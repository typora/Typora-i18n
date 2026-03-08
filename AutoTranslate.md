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
base.lproj/
  ├── A.strings
  ├── B.strings
  └── ...
<language-code>.lproj/
  ├── A.strings
  ├── B.strings
  └── ...
```

- **Base (English):** `base.lproj/*.strings`
- **Target languages:** `<language-code>.lproj/*.strings` (e.g., `zh-Hans.lproj/*.strings`)

## Task

1. For each `.strings` file in `base.lproj/`, find the corresponding file in `<language-code>.lproj/`.
2. Compare keys between the base file and the target language file.
3. Identify keys present in the base file but missing in the target language file.
4. Translate the missing English values into the target language.
5. Append the translated entries to the target language file.