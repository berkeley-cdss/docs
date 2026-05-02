#!/usr/bin/env bash
set -euo pipefail

# Setup script for Canon DR-G2110 scanning workstation
# Ubuntu 24.04 LTS
# Run with: bash setup.sh

echo "=== Canon DR-G2110 Scanning Workstation Setup ==="
echo ""

# --- Install dependencies ---
echo "[1/8] Installing dependencies..."
sudo apt update
sudo apt install -y \
    sane-utils \
    libsane1 \
    img2pdf \
    imagemagick \
    avahi-utils \
    unzip \
    curl

# --- Install NAPS2 ---
echo ""
echo "[2/8] Installing NAPS2..."
curl -fsSL https://www.naps2.com/naps2-public.pgp | \
    sudo gpg --dearmor -o /etc/apt/keyrings/naps2.gpg
echo "deb [signed-by=/etc/apt/keyrings/naps2.gpg] https://downloads.naps2.com ./" | \
    sudo tee /etc/apt/sources.list.d/naps2.list > /dev/null
sudo apt update
sudo apt install -y naps2

# --- Install Canon SANE driver ---
echo ""
echo "[3/8] Installing Canon DR-G2110 SANE driver..."
CANON_ZIP="/tmp/canon-sane-driver.zip"
CANON_DIR="/tmp/canon-sane-driver"
curl -fSL -o "$CANON_ZIP" \
    "https://gdlp01.c-wss.com/gds/2/0100012702/02/DR-G2090_2110_2140_SANEDriver_V1.1.0-20250725_Linux.zip"
mkdir -p "$CANON_DIR"
unzip -o "$CANON_ZIP" -d "$CANON_DIR"

# Find and install the matching .deb (G2110)
CANON_DEB=$(find "$CANON_DIR" -name "*2110*.deb" | head -1)
if [[ -z "$CANON_DEB" ]]; then
    echo "ERROR: Could not find a matching .deb in the Canon driver package."
    echo "Contents of $CANON_DIR:"
    find "$CANON_DIR" -type f
    exit 1
fi
echo "  Installing: $(basename "$CANON_DEB")"
sudo dpkg -i "$CANON_DEB" || sudo apt --fix-broken install -y
rm -rf "$CANON_ZIP" "$CANON_DIR"

# --- Install AirSane (network scanning for macOS/Windows) ---
echo ""
echo "[4/8] Installing AirSane..."
sudo apt install -y \
    build-essential \
    cmake \
    libsane-dev \
    libjpeg-dev \
    libpng-dev \
    libavahi-client-dev \
    libusb-1.0-0-dev \
    git

AIRSANE_DIR="/tmp/AirSane"
rm -rf "$AIRSANE_DIR"
git clone https://github.com/SimulPiscator/AirSane.git "$AIRSANE_DIR"
cd "$AIRSANE_DIR"
mkdir build && cd build
cmake ..
make -j"$(nproc)"
sudo make install
cd "$HOME"
rm -rf "$AIRSANE_DIR"

# Ensure saned user/group exist (needed by AirSane)
if ! id -u saned &>/dev/null; then
    sudo useradd -r -s /usr/sbin/nologin saned
fi
sudo usermod -aG scanner saned 2>/dev/null || true

# Enable and start AirSane
sudo systemctl daemon-reload
sudo systemctl enable airsaned
sudo systemctl start airsaned

# --- Create ~/scans directory ---
echo ""
echo "[5/8] Creating ~/scans directory..."
mkdir -p "$HOME/scans"

# --- Create desktop shortcuts ---
echo ""
echo "[6/8] Creating desktop shortcuts..."
DESKTOP_DIR="$HOME/Desktop"
mkdir -p "$DESKTOP_DIR"

# NAPS2 desktop shortcut
cat > "$DESKTOP_DIR/NAPS2.desktop" <<EOF
[Desktop Entry]
Name=NAPS2 Scanner
Comment=Scan documents with Canon DR-G2110
Exec=naps2
Icon=scanner
Terminal=false
Type=Application
Categories=Office;Scanning;
EOF
chmod +x "$DESKTOP_DIR/NAPS2.desktop"
gio set "$DESKTOP_DIR/NAPS2.desktop" metadata::trusted true 2>/dev/null || true

# Scans folder shortcut
cat > "$DESKTOP_DIR/Scans.desktop" <<EOF
[Desktop Entry]
Name=Scans Folder
Comment=Open scanned documents folder
Exec=xdg-open $HOME/scans
Icon=folder
Terminal=false
Type=Application
Categories=Utility;
EOF
chmod +x "$DESKTOP_DIR/Scans.desktop"
gio set "$DESKTOP_DIR/Scans.desktop" metadata::trusted true 2>/dev/null || true

# --- Install scan-exams and docs ---
echo ""
echo "[7/8] Installing scan-exams command and docs..."
SCANNER_DIR="$HOME/scanner"
mkdir -p "$SCANNER_DIR"

# Copy scripts and docs (expect them in same directory as setup.sh)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
for file in scan-exams.sh README.md; do
    if [[ -f "$SCRIPT_DIR/$file" ]]; then
        cp "$SCRIPT_DIR/$file" "$SCANNER_DIR/$file"
        echo "  Copied $file to $SCANNER_DIR/"
    else
        echo "  WARNING: $file not found in $SCRIPT_DIR — skipping"
    fi
done

# Add source line to .bashrc (remove old versions first)
SCAN_SOURCE_MARKER="# --- scan-exams source ---"
sed -i "/$SCAN_SOURCE_MARKER/d" "$HOME/.bashrc" 2>/dev/null || true
sed -i "\|source.*scanner/scan-exams.sh|d" "$HOME/.bashrc" 2>/dev/null || true
# Also remove any old inline function
if grep -qF "# --- scan-exams function ---" "$HOME/.bashrc" 2>/dev/null; then
    sed -i '/# --- scan-exams function ---/,/^# --- end scan-exams ---$/d' "$HOME/.bashrc"
fi

echo "$SCAN_SOURCE_MARKER" >> "$HOME/.bashrc"
echo "source \"$SCANNER_DIR/scan-exams.sh\"" >> "$HOME/.bashrc"
echo "  ✓ scan-exams command added to ~/.bashrc (source ~/scanner/scan-exams.sh)"

# --- Verify ---
echo ""
echo "[8/8] Checking scanner and services..."
echo ""

# Scanner detection
if scanimage -L 2>&1 | grep -qi "canon"; then
    echo "  ✓ Scanner detected!"
    scanimage -L 2>&1 | grep -i canon
else
    echo "  ✗ Scanner not detected."
    echo "    - Make sure the scanner is connected via USB and powered on."
    echo "    - Try: scanimage -L"
fi

# AirSane status
echo ""
if systemctl is-active --quiet airsaned; then
    echo "  ✓ AirSane is running."
    echo "    Macs on the network can scan via Image Capture or Preview."
else
    echo "  ✗ AirSane is not running."
    echo "    Check: sudo systemctl status airsaned"
fi

echo ""
echo "=== Setup Complete ==="
echo ""
echo "  NAPS2:            Launch from desktop or run 'naps2'"
echo "  Scan exams:       Type 'scan-exams' in any terminal (source ~/.bashrc first)"
echo "  Scan exams help:  scan-exams -h"
echo "  Scripts & docs:   ~/scanner/"
echo "  Scans folder:     ~/scans"
echo "  Network scanning: Macs on the LAN will auto-discover the scanner"
echo "  Test scanner:     scanimage -L"
echo ""
echo "  NOTE: Scanned files may contain sensitive data."
echo "        Please save locally and clean up ~/scans after each session."
echo ""
