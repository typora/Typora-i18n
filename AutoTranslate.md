# XCode Strings Translation Task

## Overview

Translate missing entries in XCode `.strings` files by comparing language-specific files against the English base.

## File Format

XCode strings format:

```
"key" = "value";
```

## File Structure

```
Base.lproj/
  ├── Front.strings
  ├── Menu.strings
  ├── Panel.strings
  └── Welcome.strings
<language-code>.lproj/
  ├── Front.strings
  ├── Menu.strings
  ├── Panel.strings
  └── Welcome.strings
```

- **Base (English):** `Base.lproj/*.strings`
- **Target languages:** `<language-code>.lproj/*.strings` (e.g., `zh-Hans.lproj/*.strings`)

## Task

1. For each `.strings` file in `Base.lproj/`, find the corresponding file in `<language-code>.lproj/`.
2. Compare keys between the base file and the target language file.
3. Identify keys present in the base file but missing in the target language file.
4. Translate the missing English values into the target language.
5. **Append** the translated entries to the end of the target language file.
6. Fix any entries where the value is literally `"ERROR"` — replace with a proper translation.

## Critical Rules

### 1. APPEND-ONLY — Never rewrite files

- **NEVER** rewrite, reorder, or restructure existing file content.
- **NEVER** remove or modify comments, blank lines, section headers (`/* ... */`), or contributor credits.
- **NEVER** re-sort or rearrange existing entries.
- Only **append** new missing keys at the end of the file.
- Only **modify** existing lines if the value is literally `"ERROR"` (replace the ERROR value in-place, do not move the line).

### 2. Preserve file encoding and line endings exactly

- Each file may use different line endings (LF `\n` vs CRLF `\r\n`). **Detect and preserve** the line ending style of each file.
- Preserve UTF-8 encoding (with or without BOM, matching the original).
- When appending new lines, use the **same line ending** as the rest of the file.

### 3. Preserve all formatting in values

- Keep all HTML tags (e.g., `<em>`, `<strong>`, `<br/>`, `<a href='...'>`) exactly as-is.
- Keep all placeholders (e.g., `{0}`, `%@`, `%d`, `${filename}`) exactly as-is.
- Keep all escape sequences (e.g., `\n`, `\\`, `&#92;`) exactly as-is.
- Do not translate technical terms: Markdown, Pandoc, LaTeX, HTML, CSS, YAML, iPic, PicGo, Typora, MathJax, etc.

### 4. Match existing translation style

- Read the existing translations in the target file to understand the translator's style and terminology choices.
- Some files contain inline comments (`/* See <url> */`) explaining word choices — respect those conventions.
- Use consistent terminology with what's already in the file.

### 5. Diff hygiene

- The git diff for your changes should show **only additions** (`+` lines) and in-place ERROR fixes.
- There should be **zero deleted lines** (`-` lines) except when replacing an `"ERROR"` value.
- If the diff shows the entire file being rewritten, something is wrong — revert and redo.

## Verification Checklist

Before committing, verify for each modified file:

- [ ] `git diff --stat` shows mostly insertions, minimal deletions
- [ ] No comments, blank lines, or headers were removed
- [ ] No existing entries were reordered
- [ ] Line endings match the original file (`file <path>` to check)
- [ ] All HTML tags and placeholders are preserved in translations
- [ ] ERROR values (if any) have been replaced with proper translations
