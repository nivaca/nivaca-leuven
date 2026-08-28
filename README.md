Nivaca-Leuven Emacs theme, based upon Fabrice Niessen's Leuven Theme.

- Copy `nivaca-leuven-theme.el` to `~/emacs/themes/`.
- Load theme as follows:

```lisp
(use-package nivaca-leuven-theme
  :straight nil
  :no-require t
  :init
  (add-to-list 'custom-theme-load-path (expand-file-name "~/emacs/themes/"))
  (load-theme 'nivaca-leuven t))
```
