# nivaca-leuven-theme

An Emacs colour theme, based upon [Fabrice Niessen's Leuven theme](https://github.com/fniessen/emacs-leuven-theme).

<!-- ![Screenshot](screenshot.png) -->

## Requirements

- GNU Emacs 24.1 or later (`deftheme` / `load-theme` support).

## Installation

### Manual

Copy `nivaca-leuven-theme.el` to a directory in your `custom-theme-load-path`,
for example `~/emacs/themes/`:

```sh
mkdir -p ~/emacs/themes/
cp nivaca-leuven-theme.el ~/emacs/themes/
```

Then add to your init file:

```elisp
(add-to-list 'custom-theme-load-path (expand-file-name "~/emacs/themes/"))
(load-theme 'nivaca-leuven t)
```

### With `use-package`

```elisp
(use-package nivaca-leuven-theme
  :straight nil
  :no-require t
  :init
  (add-to-list 'custom-theme-load-path (expand-file-name "~/emacs/themes/"))
  (load-theme 'nivaca-leuven t))
```

Two details matter here:

- `:no-require t` is required. A theme file provides the *theme* feature
  (`provide-theme`), not a package feature (`provide`), so the implicit
  `require` that `use-package` would otherwise emit fails and the rest of
  the declaration is silently skipped.
- The code goes in `:init`, not `:config`. `:config` runs only after the
  package is deemed loaded, which never happens for a theme file.

If you do not use [straight.el](https://github.com/radian-software/straight.el),
replace `:straight nil` with `:ensure nil`.

## Usage

To switch themes interactively:

```
M-x load-theme RET nivaca-leuven RET
```

To disable it:

```elisp
(disable-theme 'nivaca-leuven)
```

## Troubleshooting

- **`Unable to find theme file for 'nivaca-leuven'`** — the file must be named
  exactly `nivaca-leuven-theme.el`; `load-theme` derives the filename from the
  theme symbol by appending `-theme.el`. Check that the containing directory
  appears in `custom-theme-load-path` (`C-h v custom-theme-load-path`).
- **Nothing happens on startup** — make sure the theme is loaded *after* the
  frame's basic settings, and that no later theme overrides it.
- **Colours look wrong in the terminal** — the theme is designed for a
  light background on a graphical display; 256-colour terminals will
  approximate.

## Credits

Based on the Leuven theme by Fabrice Niessen. All credit for the original
design and palette belongs to him; this is a personal set of modifications.

## License

GPL-3.0-or-later, inherited from the original Leuven theme.
