---
title: Exam Scanning
layout: default
nav_order: 1
parent: Scanning Station Overview
permalink: /course-logistics/scanning/exam-scanning
---

# Exam Scanning

The `scan-exams` command is a batch scanning tool for the CDSS [scanning station](scanning). It scans exams from the Canon DR-G2110 ADF and produces compressed, timestamped PDFs.

For general scanning station info, see the [Scanning Station Overview](scanning).

## Usage

```
scan-exams              # interactive prompts
scan-exams -o           # scan and open PDF when done
scan-exams -r -o        # reuse last course/exam, open when done
scan-exams -q           # no prompts, just scan and save
scan-exams -h           # show help
```

## Options

| Flag | Description |
|------|-------------|
| `-o` | Open the PDF automatically after scanning |
| `-r` | Reuse course/exam metadata from the last scan |
| `-q` | Quiet mode — no prompts, auto batch number and timestamp |
| `-h` | Show help |

## Output filename

```
20260429-143022-SP26-cs169-mt1-batch-01-240pg.pdf
│              │    │     │    │        └─ page count
│              │    │     │    └─ auto-incrementing batch number
│              │    │     └─ exam type (mt, mt1, mt2, final, quiz)
│              │    └─ course number
│              └─ semester (SP/SU/FA + 2-digit year)
└─ timestamp (YYYYMMDD-HHMMSS)
```

## Semester detection

Automatically determined from the current date:

| Months | Semester |
|--------|----------|
| January–May | SP (Spring) |
| June–August | SU (Summer) |
| September–December | FA (Fall) |

## Batch numbering

The batch number auto-increments based on existing files in `~/scans/` matching the same course and exam type. Scanning `cs169-mt1` when `batch-01` and `batch-02` already exist produces `batch-03`.

## Reusing metadata (`-r`)

After each scan, the course, exam type, expected copies, pages per exam, and rotation setting are saved to `~/.scan-exams-last`. Use `-r` to reuse these values for the next scan without re-entering them — useful when scanning the same exam in multiple batches.

## Scan settings

| Setting | Value |
|---------|-------|
| Mode | Duplex (double-sided) |
| Color | Grayscale |
| Resolution | 200 DPI |
| Paper size | Letter (8.5" × 11") |
| Compression | JPEG quality 85 |
| Output | Single PDF per batch |

## Files

| File | Purpose |
|------|---------|
| `setup.sh` | Install Canon SANE driver, NAPS2, AirSane, and `scan-exams` command |
| `setup_apps.sh` | Install general dev tools (VS Code, Docker, mise, PostgreSQL, etc.) |
| `scan-exams.sh` | The `scan-exams` bash function |

Source: [berkeley-cdss/docs/scanning-scripts](https://github.com/berkeley-cdss/docs/tree/main/scanning-scripts)

## Data handling

**Scanned files may contain sensitive data (exams, student work, etc.).**

- Copy your PDFs to your own device after scanning.
- **Delete your files from `~/scans/` when you're done.**
