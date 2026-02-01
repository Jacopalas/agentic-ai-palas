---
name: removing-notebooklm
description: Remove the NotebookLM watermark from PDFs (presentations) and images (infographics) automatically. Use when the user wants to remove the NotebookLM watermark, eliminar el watermark, quitar la marca de agua.
---

# /palas:removing-notebooklm — Remove NotebookLM Watermark

Remove the NotebookLM watermark from PDFs and images automatically.

## Usage

```text
/palas:removing-notebooklm <file> [--output <path>]
```

**Arguments:**

- `file` (Required): Input file to process
  - **PDF**: Multi-page presentations (e.g., `presentation.pdf`)
  - **PNG/JPG**: Single images/infographics (e.g., `infographic.png`)
- `--output` (Optional): Custom output path (default: `{name}_clean.{ext}`)

**No argument = show this usage.**

## Environment Setup

This skill requires Python dependencies. Before running:

1. **Locate plugin directory**: Find this plugin's `_tooling/` directory (contains `requirements.txt`)
2. **Create virtual environment if needed**: If `_tooling/.venv/` doesn't exist:
   ```bash
   python -m venv <plugin-path>/_tooling/.venv
   ```
3. **Install dependencies if needed**:
   ```bash
   # Windows
   <plugin-path>/_tooling/.venv/Scripts/pip.exe install -r <plugin-path>/_tooling/requirements.txt

   # Unix/macOS
   <plugin-path>/_tooling/.venv/bin/pip install -r <plugin-path>/_tooling/requirements.txt
   ```

The plugin directory is typically in `~/.claude/plugins/cache/` or wherever the plugin was installed.

### Dependencies

- `Pillow` — Image processing
- `pymupdf` — PDF processing
- `opencv-python` — Inpainting algorithm

## Command

Replace `<plugin-path>` with the actual path to this plugin's installation directory.

```bash
# Windows - Default output (adds _clean suffix)
<plugin-path>/_tooling/.venv/Scripts/python.exe <plugin-path>/skills/removing-notebooklm/scripts/removing-notebooklm.py "<file>"

# Windows - Custom output path
<plugin-path>/_tooling/.venv/Scripts/python.exe <plugin-path>/skills/removing-notebooklm/scripts/removing-notebooklm.py "<file>" --output "<output>"

# Unix/macOS - Default output
<plugin-path>/_tooling/.venv/bin/python <plugin-path>/skills/removing-notebooklm/scripts/removing-notebooklm.py "<file>"

# Unix/macOS - Custom output
<plugin-path>/_tooling/.venv/bin/python <plugin-path>/skills/removing-notebooklm/scripts/removing-notebooklm.py "<file>" --output "<output>"
```

## Examples

```text
/palas:removing-notebooklm presentation.pdf
-> Creates presentation_clean.pdf

/palas:removing-notebooklm infographic.png
-> Creates infographic_clean.png

/palas:removing-notebooklm input.pdf --output final.pdf
-> Creates final.pdf
```

## Output Format

```text
Processing PDF: presentation.pdf
Pages: 12
  Page 1/12
  Page 2/12
  ...
  Page 12/12
Saved: presentation_clean.pdf

Done
```

## How It Works

### Watermark Specifications

| Property      | Value                   |
| ------------- | ----------------------- |
| Size          | 194 x 28 pixels (at 2x) |
| Position      | Bottom-right corner     |
| PDF margins   | 18px right, 16px bottom |
| Image margins | 9px right, 10px bottom  |

### Inpainting Algorithm

Uses OpenCV's Telea inpainting algorithm to seamlessly reconstruct the background:

- Creates a mask over the watermark area
- Propagates surrounding pixels into the masked region
- Works with complex backgrounds (textures, patterns, gradients)

### Supported Formats

| Type  | Extensions     | Processing  |
| ----- | -------------- | ----------- |
| PDF   | `.pdf`         | All pages   |
| Image | `.png`, `.jpg` | Single file |

## Behavior

1. **Check argument**: If no file provided, show usage and exit
2. **Setup environment**: Ensure Python venv exists with dependencies in plugin directory
3. **Validate file**: Check file exists and format is supported
4. **Process file**: Remove watermark using appropriate method
5. **Save output**: `{original_name}_clean.{extension}`

## Notes

- Output file is saved in the same directory as input
- Original file is not modified
- Requires: Python 3 installed on system
- Dependencies installed on first use in plugin's `_tooling/.venv/`
