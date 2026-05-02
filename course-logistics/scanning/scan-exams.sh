scan-exams() {
    local SCANS_DIR="$HOME/scans"
    local LAST_FILE="$HOME/.scan-exams-last"
    local open_after=false
    local quiet=false
    local reuse=false
    local show_help=false

    # --- Parse flags ---
    local OPTIND=1
    while getopts "oqrh" opt; do
        case "$opt" in
            o) open_after=true ;;
            q) quiet=true ;;
            r) reuse=true ;;
            h) show_help=true ;;
            *) show_help=true ;;
        esac
    done
    shift $((OPTIND - 1))

    if $show_help; then
        echo "Usage: scan-exams [-o] [-q] [-r] [-h]"
        echo ""
        echo "Batch scan exams to PDF using the Canon DR-G2110."
        echo ""
        echo "Options:"
        echo "  -o    Open the PDF automatically after scanning"
        echo "  -q    Quiet mode — skip interactive prompts, use defaults"
        echo "        (auto batch number, timestamp filename only)"
        echo "  -r    Reuse course/exam metadata from the last scan"
        echo "  -h    Show this help message"
        echo ""
        echo "Output: ~/scans/TIMESTAMP-SEMESTER-COURSE-EXAM-BATCH-PAGECOUNTpg.pdf"
        echo ""
        echo "Examples:"
        echo "  scan-exams            # interactive prompts"
        echo "  scan-exams -o         # scan and open PDF when done"
        echo "  scan-exams -r -o      # reuse last course/exam, open when done"
        echo "  scan-exams -q         # no prompts, just scan and save"
        return 0
    fi

    mkdir -p "$SCANS_DIR"

    # --- Check for scanner ---
    echo "Searching for Canon DR-G2110 scanner..."
    local DEVICE
    DEVICE=$(scanimage -L 2>/dev/null | grep -oP "drg2110:\S+" | tr -d "'" | head -1)
    if [[ -z "$DEVICE" ]]; then
        echo "ERROR: Canon DR-G2110 not found. Is it plugged in and powered on?" >&2
        return 1
    fi
    echo "Found scanner: $DEVICE"
    echo ""

    # --- Determine semester ---
    local month year semester
    month=$(date +%-m)
    year=$(date +%y)
    if (( month >= 1 && month <= 5 )); then
        semester="SP${year}"
    elif (( month >= 6 && month <= 8 )); then
        semester="SU${year}"
    else
        semester="FA${year}"
    fi

    # --- Collect metadata ---
    local course=""
    local exam_type=""
    local expected_copies=""
    local pages_per_exam=""
    local rotate="n"

    if $reuse && [[ -f "$LAST_FILE" ]]; then
        source "$LAST_FILE"
        echo "Reusing previous scan settings:"
        echo "  Course:         $course"
        echo "  Exam type:      $exam_type"
        echo "  Expected copies: $expected_copies"
        echo "  Pages per exam: $pages_per_exam"
        echo "  Rotate:         $rotate"
        echo ""
    fi

    if $quiet; then
        # Quiet mode: use defaults or reused values
        course="${course:-unknown}"
        exam_type="${exam_type:-scan}"
        expected_copies="${expected_copies:-0}"
        pages_per_exam="${pages_per_exam:-1}"
    else
        if [[ -z "$course" ]]; then
            read -rp "Course number (e.g. CS169, DATA8): " course
        fi
        if [[ -z "$exam_type" ]]; then
            echo "Exam type options: mt, mt1, mt2, final, quiz"
            read -rp "Exam type: " exam_type
        fi
        if [[ -z "$expected_copies" ]]; then
            read -rp "Expected copies: " expected_copies
        fi
        if [[ -z "$pages_per_exam" ]]; then
            read -rp "Pages per exam (single-sided count): " pages_per_exam
        fi
        if [[ "$rotate" == "n" ]] && ! $reuse; then
            read -rp "Rotate pages 180°? Recommended if cut corner faces out (y/n) [n]: " rotate
            rotate="${rotate:-n}"
        fi
    fi

    # Validate numeric inputs
    if ! [[ "$expected_copies" =~ ^[0-9]+$ ]]; then
        echo "ERROR: expected copies must be a non-negative integer." >&2
        return 1
    fi
    if ! [[ "$pages_per_exam" =~ ^[0-9]+$ ]] || [[ "$pages_per_exam" -eq 0 ]]; then
        echo "ERROR: pages per exam must be a positive integer." >&2
        return 1
    fi

    # --- Save metadata for -r ---
    cat > "$LAST_FILE" <<EOF
course="$course"
exam_type="$exam_type"
expected_copies="$expected_copies"
pages_per_exam="$pages_per_exam"
rotate="$rotate"
EOF

    # --- Determine batch number ---
    local safe_course
    safe_course=$(echo "$course" | tr '[:upper:] /' '[:lower:]_-')
    local safe_exam
    safe_exam=$(echo "$exam_type" | tr '[:upper:] /' '[:lower:]_-')
    local batch_num=1
    while ls "$SCANS_DIR"/*-${safe_course}-${safe_exam}-batch-$(printf "%02d" $batch_num)-*.pdf &>/dev/null; do
        ((batch_num++))
    done
    local batch_label
    batch_label=$(printf "batch-%02d" "$batch_num")

    # --- Expected page count ---
    local expected_pages=0
    if [[ "$expected_copies" -gt 0 ]]; then
        expected_pages=$(( expected_copies * pages_per_exam ))
    fi

    # --- Set up temp directory ---
    local timestamp
    timestamp=$(date +%Y%m%d-%H%M%S)
    local tmpdir
    tmpdir=$(mktemp -d "/tmp/scan-exams_${timestamp}_XXXX")

    echo ""
    echo "=== Ready to scan ==="
    echo "  Course:          $course"
    echo "  Exam type:       $exam_type"
    echo "  Semester:        $semester"
    echo "  Batch:           $batch_label"
    echo "  Mode:            Duplex, Grayscale, 200 DPI, Letter"
    echo "  Rotate:          $(if [[ "$rotate" =~ ^[Yy] ]]; then echo 'Yes (180°)'; else echo 'No'; fi)"
    if [[ "$expected_copies" -gt 0 ]]; then
        echo "  Expected copies: $expected_copies"
        echo "  Pages per exam:  $pages_per_exam"
        echo "  Expected pages:  $expected_pages"
    fi
    echo ""

    if ! $quiet; then
        echo "Load documents into the ADF and press Enter to start."
        read -r
    fi

    # --- Scan ---
    echo "Scanning..."
    scanimage \
        --device-name="$DEVICE" \
        --format=tiff \
        --resolution 200 \
        --mode Gray \
        --source="Duplex" \
        -x 215.9 \
        -y 279.4 \
        --batch="$tmpdir/page_%04d.tiff"


    # --- Count pages ---
    local page_count
    page_count=$(find "$tmpdir" -name 'page_*.tiff' | wc -l)

    if [[ "$page_count" -eq 0 ]]; then
        echo "ERROR: No pages were scanned." >&2
        rm -rf "$tmpdir"
        return 1
    fi

    # --- Rotate if requested ---
    if [[ "$rotate" =~ ^[Yy] ]]; then
        echo "Rotating $page_count pages 180°..."
        mogrify -rotate 180 "$tmpdir"/page_*.tiff
    fi

    # --- Compress: convert TIFF to JPEG for smaller PDFs ---
    echo "Compressing $page_count pages..."
    local jpgdir="$tmpdir/jpg"
    mkdir -p "$jpgdir"
    local tiff
    for tiff in "$tmpdir"/page_*.tiff; do
        local base
        base=$(basename "$tiff" .tiff)
        convert "$tiff" -quality 85 "$jpgdir/${base}.jpg"
    done

    # --- Convert to PDF ---
    local filename="${timestamp}-${semester}-${safe_course}-${safe_exam}-${batch_label}-${page_count}pg.pdf"
    local output_path="$SCANS_DIR/$filename"

    echo "Creating PDF..."
    img2pdf "$jpgdir"/*.jpg -o "$output_path"

    # --- Cleanup temp ---
    rm -rf "$tmpdir"

    # --- Summary ---
    echo ""
    echo "=== Scan Complete ==="
    echo "  File:            $output_path"
    echo "  Size:            $(du -h "$output_path" | cut -f1)"
    echo "  Total pages:     $page_count"
    echo "  Pages per exam:  $pages_per_exam"

    if [[ "$expected_copies" -gt 0 ]]; then
        echo "  Expected copies: $expected_copies"
        echo "  Expected pages:  $expected_pages"

        if (( page_count != expected_pages )); then
            echo ""
            echo "  ⚠ WARNING: Scanned $page_count pages but expected $expected_pages"
            echo "    ($expected_copies copies × $pages_per_exam pages)"
        fi
    fi

    if (( page_count % pages_per_exam != 0 )); then
        echo "  ⚠ WARNING: $page_count is not evenly divisible by $pages_per_exam pages/exam"
        echo "    Actual exams: ~$(( page_count / pages_per_exam )) (with $(( page_count % pages_per_exam )) extra pages)"
    else
        echo "  Actual exams:    $(( page_count / pages_per_exam ))"
    fi

    echo ""
    echo "  Open with:  xdg-open \"$output_path\""

    if $open_after; then
        xdg-open "$output_path" &
    fi
}
