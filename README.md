# PDF Utils
Tools to modify PDF files

## Dependencies
- Bash
- Ghostscript

## Examples

### Split PDF
`sh split-pdf.sh /path/to/input.pdf /path/to/output.pdf 1-1 6-9 18-21`

Creates output.pdf from input.pdf pages: 1, 6, 7, 8, 9, 18, 19, 20, 21

### Watermark PDF
`sh watermark-pdf.sh /path/to/input.pdf`

Creates input-watermark.pdf from input.pdf in current dir

### Stamp PDF
`sh stamp-pdf.sh /path/to/input.pdf`

Creates input-stamp.pdf from input.pdf in current dir

## ToDo
* [ ] pass watermark string as an argument (now hardcoded)
* [ ] pass stamp string as an argument (now hardcoded)
