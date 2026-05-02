---
title: Scanning Station Overview
layout: default
nav_order: 3
parent: Course Logistics
---

# Scanning Station Overview

The CDSS document scanning station is a 2018 Mac Mini running Ubuntu 24.04 LTS, connected to a Canon imageFORMULA DR-G2110 production scanner via USB 3.0. Macs on the same network can also scan directly via AirSane.

## Location & Access

The scanning station is located in **TODO: room/building**. (Currently Michae's office, but will move to a more normal location once the Gateway finally opens.)

- **Username:** `oski`
- **Password:** Posted near the computer

This is a shared local account. Do not store sensitive files on this machine — save scans to your own device, or upload to Gradescope, and clean up `~/scans` when you're done.

## Using the Scanner

**[Jump to the Exam Scanning README](/course-logistics/scanning/exam-scanning) for detailed instructions on using the `scan-exams` command, filename conventions, batch numbering, and semester detection.**

### `scan-exams` (recommended for exams)

Open a terminal and type:

```
scan-exams
```

This walks you through scanning a batch of exams: course number, exam type, expected copies, and pages per exam. It scans duplex at 200 DPI grayscale, compresses the output, and saves a single PDF to `~/scans/`.

Common options:

| Flag | Description |
|------|-------------|
| `-o` | Open the PDF automatically after scanning |
| `-r` | Reuse course/exam metadata from the last scan |
| `-q` | Quiet mode — no prompts, just scan and save |
| `-h` | Show help |

Examples:

```
scan-exams -o           # scan and open the PDF when done
scan-exams -r -o        # another batch of the same exam
scan-exams -h           # full usage info
```

For details on filenames, batch numbering, and semester detection, see the [Exam Scanning README](exam-scanning).

### NAPS2 (GUI scanning)

NAPS2 is a graphical scanning app linked on the desktop. You can also launch it from a terminal:

```
naps2
```

Select **SANE Driver**, choose the Canon DR-G2110, and save directly to PDF.

### `scanimage` (advanced CLI)

For more control over scan settings:

```
scanimage -L                    # list scanners
scanimage -A                    # show all scanner options
scanimage --format=tiff --resolution 200 --mode Gray --source="Duplex" --batch=scan_%04d.tiff
img2pdf scan_*.tiff -o output.pdf
```

### Network scanning from a Mac

The scanner is published on the local network via AirSane. On any Mac on the same network:
(This is currently the internal EECS network, and may not be accessible from campus Wi-Fi.)

1. Open **Image Capture** (or **Preview → File → Import from Scanner**)
2. The Canon DR-G2110 should appear in the sidebar
3. Select scan settings and scan — files go directly to your Mac

AirSane also provides a web interface at `http://TODO-HOSTNAME:8090/`.

### After scanning

**Scanned files may contain sensitive data (exams, student work, etc.).**

- Copy your PDFs from `~/scans/` to your own device.
- **Delete your files from `~/scans/` when you're done.** This is a shared machine.
- The workstation does not share files over the network — only the scanner device is exposed via AirSane.

## Equipment

- **Scanner:** Canon imageFORMULA DR-G2110 (USB 3.0)
- **Computer:** 2018 Mac Mini, Intel, 64 GB RAM, Ubuntu 24.04 LTS
- **Network scanning:** AirSane (eSCL/AirScan protocol, auto-discovered by macOS)

## Setup & Maintenance

The setup scripts and scanning tools are maintained in the [berkeley-cdss/docs](https://github.com/berkeley-cdss/docs) repository:

- [scanning-scripts/](https://github.com/berkeley-cdss/docs/tree/main/course-logistics/scanning/) — setup scripts, scan-exams tool, and documentation

To re-run the workstation setup from scratch:

```
git clone https://github.com/berkeley-cdss/docs.git
cd docs/course-logistics/scanning
bash setup.sh        # scanner driver, NAPS2, AirSane, scan-exams command
bash setup_apps.sh   # general dev tools and apps
```

Setup installs scripts and docs to `~/scanner/` and adds `scan-exams` to `~/.bashrc`.

### Installed files

| Location | Contents |
|----------|----------|
| `~/scanner/scan-exams.sh` | The `scan-exams` function (sourced by `.bashrc`) |
| `~/scanner/README.md` | This documentation |
| `~/scans/` | Default scan output directory |
| `~/.scan-exams-last` | Saved metadata for `scan-exams -r` |

## Troubleshooting

### Scanner not detected

```
lsusb | grep -i canon           # check USB connection
scanimage -L                    # check SANE detection
dpkg -l | grep canon            # check driver installation
```

### Scan source options

The scanner uses `--source="Duplex"` for double-sided and `--source="Simplex"` for single-sided. Check available options:

```
scanimage -A | grep -i source
```

### Scanning pauses or is slow

- Confirm USB 3.0 connection (not USB 2.0)
- Check disk write speed — scan output should go to an SSD/NVMe
- Lower resolution (200 DPI is usually sufficient for exams)
- Use grayscale instead of color

### AirSane not visible on Mac

- Ensure both machines are on the same network/subnet
- Check AirSane is running: `sudo systemctl status airsaned`
- Check Avahi is running: `sudo systemctl status avahi-daemon`
- Try the web interface: `http://TODO-HOSTNAME.local:8090/`

### Managing services

```
sudo systemctl status airsaned      # AirSane status
sudo systemctl restart airsaned     # restart AirSane
sudo journalctl -u airsaned -f      # AirSane logs
```
