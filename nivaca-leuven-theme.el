;;; nivaca-leuven-theme.el --- nivaca-leuven color theme for a softer light background -*- lexical-binding: t -*-

;; Copyright (C) 2003-2026 Free Software Foundation, Inc.

;; Author: Nicolás Vaughan  <(concat "nivaca" at-sign "fastmail.com")>
;; URL: https://github.com/fniessen/emacs-leuven-theme
;; Version: 1.0
;; Last-Updated: 2026-08-26 16:54
;; Keywords: color theme

;; This file is part of GNU Emacs.

;; GNU Emacs is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs. If not, see https://www.gnu.org/licenses/.

;;; Commentary:

;; The "nivaca-leuven" color theme is based on Leuven, with the same
;; face definitions and color relationships, but with colors subtly darkened
;; for a softer, less glaring light-background appearance.

;; To enable the "nivaca-leuven" theme, add the following line to your Emacs
;; configuration:

;;   (load-theme 'nivaca-leuven t)

;; This will load and activate the theme.

;; Requirements:
;; - Emacs 24 or later.

;; For more information and updates, visit the theme's GitHub repository at:
;; https://github.com/nivaca/nivaca-leuven-theme

;;; Code:

;;; Options.

(defgroup nivaca-leuven nil
  "Leuven theme options.
The theme has to be reloaded after changing anything in this group."
  :group 'faces)

(defcustom nivaca-leuven-scale-org-document-title t
  "Scale Org document title.
This can be nil for unscaled, t for using the theme default, or a scaling
number."
  :type '(choice
          (const :tag "Unscaled" nil)
          (const :tag "Default provided by theme" t)
          (number :tag "Set scaling")))

(defcustom nivaca-leuven-scale-outline-headlines t
  "Scale `outline' (and `org') level-1 headlines.
This can be nil for unscaled, t for using the theme default, or a scaling
number."
  :type '(choice
          (const :tag "Unscaled" nil)
          (const :tag "Default provided by theme" t)
          (number :tag "Set scaling")))

(defcustom nivaca-leuven-scale-org-agenda-structure t
  "Scale Org agenda structure lines, like dates.
This can be nil for unscaled, t for using the theme default, or a scaling
number."
  :type '(choice
          (const :tag "Unscaled" nil)
          (const :tag "Default provided by theme" t)
          (number :tag "Set scaling")))

(defcustom nivaca-leuven-scale-volatile-highlight t
  "Increase size in the `next-error' face.
This can be nil for unscaled, t for using the theme default, or a scaling
number."
  :type '(choice
          (const :tag "Unscaled" nil)
          (const :tag "Default provided by theme" t)
          (number :tag "Set scaling")))

;;;###autoload
(defun nivaca-leuven-scale-font (control default-height)
  "Function for splicing optional font heights into face descriptions.
CONTROL can be a number, nil, or t.  When t, use DEFAULT-HEIGHT."
  (cond
   ((numberp control) (list :height control))
   ((eq t control) (list :height default-height))
   (t nil)))

;;; Theme Faces.

(deftheme nivaca-leuven
  "Face colors with a light background.
Basic, Font Lock, Isearch, Gnus, Message, Org mode, Diff, Ediff,
Flyspell, Semantic, and Ansi-Color faces are included -- and much
more...")

(let ((class '((class color) (min-colors 89)))

      ;; Leuven generic colors.
      (cancel '(:slant italic :strike-through t :foreground "#9B9B9B"))
      ;; (clock-line '(:box (:line-width 1 :color "#2F569B") :foreground "black" :background "#DBB900"))
      (code-block '(:foreground "#00007D" :background "#EBEBCE"))
      (code-inline '(:foreground "#005C00" :background "#E0EBE0" :inherit fixed-pitch-serif))
      (column '(:height 1.0 :weight normal :slant normal :underline nil :strike-through unspecified :foreground "#D49F49" :background "#EBDFCC"))
      (completion-inline '(:weight normal :foreground "#B1B1B1" :inherit hl-line)) ; Like Google.
      (completion-other-candidates '(:foreground "black" :background "#E3E3E3"))
      (completion-selected-candidate '(:weight bold :foreground "black" :background "#B2CEE9"))
      (diff-added '(:background "#CBEBCB"))
      (diff-changed '(:foreground "#0000EB" :background "#CBCBEB"))
      (diff-header '(:weight bold :foreground "#760000" :background "#EBEBA1"))
      (diff-hunk-header '(:foreground "#8D008D" :background "#EBDBEB"))
      (diff-none '(:foreground "#93949A"))
      (diff-refine-added '(:background "#8BDF89"))
      (diff-refine-removed '(:background "#EBA7AB"))
      (diff-removed '(:background "#EAD5D6"))
      (directory '(:weight bold :foreground "blue" :background "#EBEBC1"))
      (file '(:foreground "black"))
      (function-param '(:foreground "#216979"))
      (grep-file-name '(:weight bold :foreground "#274291")) ; Used for grep hits.
      (grep-line-number '(:weight bold :foreground "#9831A0"))
      (highlight-blue '(:background "#A7C5E9"))
      (highlight-gray '(:background "#D2D2D1"))
      ;; (highlight-green '(:background "#C4DEBE"))
      ;; (highlight-red '(:background "#EBB8B8"))
      (highlight-yellow '(:background "#E2EABD"))
      (link '(:weight normal :underline t :foreground "#0064A1"))
      (link-no-underline '(:weight normal :foreground "#0064A1"))
      (mail-header-name '(:family "Sans Serif" :weight normal :foreground "#969695"))
      (mail-header-other '(:family "Sans Serif" :slant normal :foreground "#5E5E5E"))
      (mail-read '(:foreground "#818181"))
      (mail-read-high '(:foreground "#767676"))
      (mail-ticked '(:foreground "#EB2F00"))
      (mail-to '(:family "Sans Serif" :underline unspecified :foreground "#0064A1"))
      (mail-unread '(:weight bold :foreground "#000000"))
      (mail-unread-high '(:weight bold :foreground "#11527A"))
      (marked-line '(:foreground "#9C0000" :background "#EB9C9C"))
      (match '(:weight bold :background "#EBEB00")) ; occur patterns + match in helm for files + match in Org files.
      (ol1 `(,@(nivaca-leuven-scale-font nivaca-leuven-scale-outline-headlines 1.3) :weight bold :overline "#9A9A9A" :foreground "#373737" :background "#DDDDDD"))
      (ol2 '(:height 1.0 :weight bold :overline "#11314E" :foreground "#11314E" :background "#D3E0E7"))
      (ol3 '(:height 1.0 :weight bold :foreground "#004E1F" :background "#DCEBDC"))
      (ol4 '(:height 1.0 :weight bold :slant normal :foreground "#D75B00"))
      (ol5 '(:height 1.0 :weight bold :slant normal :foreground "#D12282"))
      (ol6 '(:height 1.0 :weight bold :slant italic :foreground "#006DBC"))
      (ol7 '(:height 1.0 :weight bold :slant italic :foreground "#2AA028"))
      (ol8 '(:height 1.0 :weight bold :slant italic :foreground "#E97607"))
      (paren-matched '(:background "#B1D5B3")) ; Or take that green for region?
      (paren-unmatched '(:weight bold :underline "red" :foreground "black" :background "#EB9898"))
      (region '(:background "#83C2EB"))
      (shadow '(:foreground "#4F648A" :background "#E0E0E3"))
      (string '(:foreground "#0D670D")) ; or #BF3329
      (subject '(:family "Sans Serif" :weight bold :foreground "black"))
      (symlink '(:foreground "#1D82C5"))
      (tab '(:foreground "#D5D5D5" :background "white"))
      (trailing '(:foreground "#D5D5D5" :background "#EBEB9D"))
      (volatile-highlight '(:underline unspecified :foreground "white" :background "#91328D"))
      (volatile-highlight-supersize `(,@(nivaca-leuven-scale-font nivaca-leuven-scale-volatile-highlight 1.1) :underline unspecified :foreground "white" :background "#91328D")) ; flash-region
      (vc-branch '(:box (:line-width 1 :color "#00BC2F") :foreground "black" :background "#9CEB9C"))
      (xml-attribute '(:foreground "#E05B31"))
      (xml-tag '(:foreground "#A0198E"))
      (highlight-current-tag '(:background "#D5D5EB")) ; #DBE0E2 or #EBD823
      )

  (custom-theme-set-faces
   'nivaca-leuven
   `(default ((,class (:foreground "#2F2F2F" :background "#EBEBEB"))))
   `(bold ((,class (:weight bold :foreground "black"))))
   `(bold-italic ((,class (:weight bold :slant italic :foreground "black"))))
   `(italic ((,class (:slant italic :foreground "#8D8D8D"))))
   `(underline ((,class (:underline t))))
   `(cursor ((,class (:background "#1EAEEB"))))

   ;; Lucid toolkit emacs menus.
   `(menu ((,class (:foreground "#EBEBEB" :background "#2F2F2F"))))

   ;; Highlighting faces.
   `(fringe ((,class (:foreground "#4691C8" :background "white"))))
   `(highlight ((,class ,highlight-blue)))
   `(region ((,class ,region)))
   `(secondary-selection ((,class ,match))) ; Used by Org-mode for highlighting matched entries and keywords.
   `(isearch ((,class (:underline "black" :foreground "white" :background "#526B9D"))))
   `(isearch-fail ((,class (:weight bold :foreground "black" :background "#EBBCBC"))))
   `(lazy-highlight ((,class (:foreground "black" :background "#EBEB00")))) ; Isearch others (see `match').
   `(trailing-whitespace ((,class ,trailing)))
   `(query-replace ((,class (:inherit isearch))))
   `(whitespace-hspace ((,class (:foreground "#C1C1C1")))) ; see also `nobreak-space'
   `(whitespace-indentation ((,class ,tab)))
   `(whitespace-line ((,class (:foreground "#BC0000" :background "#EBEB7D"))))
   `(whitespace-tab ((,class ,tab)))
   `(whitespace-trailing ((,class ,trailing)))

   ;; Mode line faces.
   `(mode-line ((,class (:box (:line-width 1 :color "#182B4D") :foreground "#7ABED8" :background "#2F569B"))))
   `(mode-line-inactive ((,class (:box (:line-width 1 :color "#484846") :foreground "#DDDDDC" :background "#8F908B"))))
   `(mode-line-buffer-id ((,class (:weight bold :foreground "white"))))
   `(mode-line-emphasis ((,class (:weight bold :foreground "white"))))
   `(mode-line-highlight ((,class (:foreground "yellow"))))

   ;; Escape and prompt faces.
   `(minibuffer-prompt ((,class (:weight bold :foreground "black" :background "gold"))))
   `(minibuffer-noticeable-prompt ((,class (:weight bold :foreground "black" :background "gold"))))
   `(escape-glyph ((,class (:foreground "#0083C0"))))
   `(error ((,class (:foreground "red"))))
   `(warning ((,class (:weight bold :foreground "orange"))))
   `(success ((,class (:foreground "green4"))))

   ;; Font lock faces.
   `(font-lock-builtin-face ((,class (:foreground "#0066CE"))))
   `(font-lock-comment-delimiter-face ((,class (:foreground "#828279")))) ; #616161
   `(font-lock-comment-face ((,class (:slant italic :foreground "#93949A")))) ; #616161
   `(font-lock-constant-face ((,class (:foreground "#C93601"))))
   `(font-lock-doc-face ((,class (:foreground "#036206"))))
   `(font-lock-function-name-face ((,class (:weight normal :foreground "#005E8D"))))
   `(font-lock-keyword-face ((,class (:foreground "#0000EB")))) ; #324DCA
   `(font-lock-preprocessor-face ((,class (:foreground "#767676"))))
   `(font-lock-regexp-grouping-backslash ((,class (:weight bold :inherit unspecified))))
   `(font-lock-regexp-grouping-construct ((,class (:weight bold :inherit nil))))
   `(font-lock-string-face ((,class ,string)))
   `(font-lock-type-face ((,class (:weight normal :foreground "#5C3096"))))
   `(font-lock-variable-name-face ((,class (:weight normal :foreground "#AB3298")))) ; #760076
   `(font-lock-warning-face ((,class (:weight bold :foreground "red"))))

   ;; Button and link faces.
   `(link ((,class ,link)))
   `(link-visited ((,class (:underline t :foreground "#D36E64"))))
   `(button ((,class (:underline t :foreground "#0064A1"))))
   `(header-line ((,class (:box (:line-width 1 :color "black") :foreground "black" :background "#DDDDDD"))))

   ;; Gnus faces.
   `(gnus-button ((,class (:weight normal))))
   `(gnus-cite-attribution-face ((,class (:foreground "#4A4AA2"))))
   `(gnus-cite-1 ((,class (:foreground "#4A4AA2" :background "#E2E2E2"))))
   `(gnus-cite-2 ((,class (:foreground "#5E005E" :background "#E2E2E2"))))
   `(gnus-cite-3 ((,class (:foreground "#006D6D" :background "#E2E2E2"))))
   `(gnus-cite-4 ((,class (:foreground "#8D0000" :background "#E2E2E2"))))
   `(gnus-cite-5 ((,class (:foreground "#00008D" :background "#E2E2E2"))))
   `(gnus-cite-6 ((,class (:foreground "#AC5E00" :background "#E2E2E2"))))
   `(gnus-cite-7 ((,class (:foreground "#4A4AA2" :background "#E2E2E2"))))
   `(gnus-cite-8 ((,class (:foreground "#5E005E" :background "#E2E2E2"))))
   `(gnus-cite-9 ((,class (:foreground "#006D6D" :background "#E2E2E2"))))
   `(gnus-cite-10 ((,class (:foreground "#8D0000" :background "#E2E2E2"))))
   `(gnus-emphasis-bold ((,class (:weight bold))))
   `(gnus-emphasis-highlight-words ((,class (:foreground "yellow" :background "black"))))
   `(gnus-group-mail-1 ((,class (:weight bold :foreground "#EB4AA2"))))
   `(gnus-group-mail-1-empty ((,class (:foreground "#4A4AA2"))))
   `(gnus-group-mail-2 ((,class (:weight bold :foreground "#EB005E"))))
   `(gnus-group-mail-2-empty ((,class (:foreground "#5E005E"))))
   `(gnus-group-mail-3 ((,class ,mail-unread)))
   `(gnus-group-mail-3-empty ((,class ,mail-read)))
   `(gnus-group-mail-low ((,class ,cancel)))
   `(gnus-group-mail-low-empty ((,class ,cancel)))
   `(gnus-group-news-1 ((,class (:weight bold :foreground "#EB4AA2"))))
   `(gnus-group-news-1-empty ((,class (:foreground "#4A4AA2"))))
   `(gnus-group-news-2 ((,class (:weight bold :foreground "#EB005E"))))
   `(gnus-group-news-2-empty ((,class (:foreground "#5E005E"))))
   `(gnus-group-news-3 ((,class ,mail-unread)))
   `(gnus-group-news-3-empty ((,class ,mail-read)))
   `(gnus-group-news-4 ((,class (:weight bold :foreground "#EB0000"))))
   `(gnus-group-news-4-empty ((,class (:foreground "#8D0000"))))
   `(gnus-group-news-5 ((,class (:weight bold :foreground "#EB008D"))))
   `(gnus-group-news-5-empty ((,class (:foreground "#00008D"))))
   `(gnus-group-news-6 ((,class (:weight bold :foreground "gray50"))))
   `(gnus-group-news-6-empty ((,class (:foreground "#767676"))))
   `(gnus-header-content ((,class ,mail-header-other)))
   `(gnus-header-from ((,class (:family "Sans Serif" :foreground "black"))))
   `(gnus-header-name ((,class ,mail-header-name)))
   `(gnus-header-newsgroups ((,class (:family "Sans Serif" :foreground "#2F8DBC"))))
   `(gnus-header-subject ((,class ,subject)))
   `(gnus-picon ((,class (:foreground "yellow" :background "white"))))
   `(gnus-picon-xbm ((,class (:foreground "yellow" :background "white"))))
   `(gnus-server-closed ((,class (:slant italic :foreground "blue" :background "white"))))
   `(gnus-server-denied ((,class (:weight bold :foreground "red" :background "white"))))
   `(gnus-server-opened ((,class (:family "Sans Serif" :foreground "white" :foreground "#4062C6"))))
   `(gnus-signature ((,class (:slant italic :foreground "#808283"))))
   `(gnus-splash ((,class (:foreground "#EB8100"))))
   `(gnus-summary-cancelled ((,class ,cancel)))
   `(gnus-summary-high-ancient ((,class ,mail-unread-high)))
   `(gnus-summary-high-read ((,class ,mail-read-high)))
   `(gnus-summary-high-ticked ((,class ,mail-ticked)))
   `(gnus-summary-high-unread ((,class ,mail-unread-high)))
   `(gnus-summary-low-ancient ((,class (:slant italic :foreground "black"))))
   `(gnus-summary-low-read ((,class (:slant italic :foreground "#8D8D8D" :background "#CECECE"))))
   `(gnus-summary-low-ticked ((,class ,mail-ticked)))
   `(gnus-summary-low-unread ((,class (:slant italic :foreground "black"))))
   `(gnus-summary-normal-ancient ((,class ,mail-read)))
   `(gnus-summary-normal-read ((,class ,mail-read)))
   `(gnus-summary-normal-ticked ((,class ,mail-ticked)))
   `(gnus-summary-normal-unread ((,class ,mail-unread)))
   `(gnus-summary-selected ((,class (:foreground "white" :background "#0081C6"))))
   `(gnus-x-face ((,class (:foreground "black" :background "white"))))

   `(gptel-response-fringe-highlight ((,class (:foreground "#B0608A"))))
   `(gptel-response-highlight ((,class (:background "#E0E0E0" :extend t))))
   ;; `(gptel-rewrite-highlight-face ((,class (:background "#E3E3E3"))))

   ;; Message faces.
   `(message-header-name ((,class ,mail-header-name)))
   `(message-header-cc ((,class ,mail-to)))
   `(message-header-other ((,class ,mail-header-other)))
   `(message-header-subject ((,class ,subject)))
   `(message-header-to ((,class ,mail-to)))
   `(message-cited-text ((,class (:foreground "#4A4AA2" :background "#E2E2E2"))))
   `(message-separator ((,class (:family "Sans Serif" :weight normal :foreground "#AEB2B6"))))
   `(message-header-newsgroups ((,class (:family "Sans Serif" :foreground "#2F8DBC"))))
   `(message-header-xheader ((,class ,mail-header-other)))
   `(message-mml ((,class (:foreground "forest green"))))

   ;; ANSI colors.
   `(ansi-color-bold ((,class (:weight bold))))
   `(ansi-color-black ((,class (:foreground "black" :background "black"))))
   `(ansi-color-red ((,class (:foreground "red3" :background "red3"))))
   `(ansi-color-green ((,class (:foreground "forest green" :background "forest green"))))
   `(ansi-color-yellow ((,class (:foreground "yellow3" :background "yellow3"))))
   `(ansi-color-blue ((,class (:foreground "blue" :background "blue"))))
   `(ansi-color-magenta ((,class (:foreground "magenta3" :background "magenta3"))))
   `(ansi-color-cyan ((,class (:foreground "deep sky blue" :background "deep sky blue"))))
   `(ansi-color-white ((,class (:foreground "gray60" :background "gray60"))))
   `(ansi-color-bright-black ((,class (:foreground "gray30" :background "gray30"))))
   `(ansi-color-bright-red ((,class (:foreground "red1" :background "red1"))))
   `(ansi-color-bright-green ((,class (:foreground "lime green" :background "lime green"))))
   `(ansi-color-bright-yellow ((,class (:foreground "yellow2" :background "yellow2"))))
   `(ansi-color-bright-blue ((,class (:foreground "dodger blue" :background "dodger blue"))))
   `(ansi-color-bright-magenta ((,class (:foreground "magenta" :background "magenta"))))
   `(ansi-color-bright-cyan ((,class (:foreground "sky blue" :background "sky blue"))))
   `(ansi-color-bright-white ((,class (:foreground "gray80" :background "gray80"))))

   ;; Diff.
   `(diff-added ((,class ,diff-added)))
   `(diff-changed ((,class ,diff-changed)))
   `(diff-context ((,class ,diff-none)))
   `(diff-file-header ((,class ,diff-header)))
   `(diff-file1-hunk-header ((,class (:foreground "dark magenta" :background "#D7DFE1"))))
   `(diff-file2-hunk-header ((,class (:foreground "#287427" :background "#D7DFE1"))))
   `(diff-function ((,class (:foreground "#BC8DBC"))))
   `(diff-header ((,class ,diff-header)))
   `(diff-hunk-header ((,class ,diff-hunk-header)))
   `(diff-index ((,class ,diff-header)))
   `(diff-indicator-added ((,class (:foreground "#358D35" :background "#BDEBC7"))))
   `(diff-indicator-changed ((,class (:background "#C9DAEB"))))
   `(diff-indicator-removed ((,class (:foreground "#BC2F2F" :background "#EBCACE"))))
   `(diff-refine-added ((,class ,diff-refine-added)))
   `(diff-refine-change ((,class (:background "#CBCBEB"))))
   `(diff-refine-removed ((,class ,diff-refine-removed)))
   `(diff-removed ((,class ,diff-removed)))

   ;; SMerge.
   `(smerge-mine ((,class ,diff-changed)))
   `(smerge-other ((,class ,diff-added)))
   `(smerge-base ((,class ,diff-removed)))
   `(smerge-markers ((,class (:background "#EBD3BC"))))
   `(smerge-refined-change ((,class (:background "#9C9CEB"))))

   ;; Ediff.
   `(ediff-current-diff-A ((,class (:background "#EBCBCB"))))
   `(ediff-current-diff-B ((,class (:background "#CBEBCB"))))
   `(ediff-current-diff-C ((,class (:background "cyan"))))
   `(ediff-even-diff-A ((,class (:background "light grey"))))
   `(ediff-even-diff-B ((,class (:background "light grey"))))
   `(ediff-fine-diff-A ((,class (:background "#EB9C9C"))))
   `(ediff-fine-diff-B ((,class (:background "#4EEB4E"))))
   `(ediff-odd-diff-A ((,class (:background "light grey"))))
   `(ediff-odd-diff-B ((,class (:background "light grey"))))

   ;; Flyspell.
   (if (version< emacs-version "24.4")
       `(flyspell-duplicate ((,class (:underline "#E0D876" :inherit unspecified))))
     `(flyspell-duplicate ((,class (:underline (:style wave :color "#E0D876") :background "#E6E3BC" :inherit nil)))))
   (if (version< emacs-version "24.4")
       `(flyspell-incorrect ((,class (:underline "#E69A98" :inherit nil))))
     `(flyspell-incorrect ((,class (:underline (:style wave :color "#E69A98") :background "#E0C6C9":inherit nil)))))

   ;; ;; Semantic faces.
   ;; `(semantic-decoration-on-includes ((,class (:underline ,cham-4))))
   ;; `(semantic-decoration-on-private-members-face ((,class (:background ,alum-2))))
   ;; `(semantic-decoration-on-protected-members-face ((,class (:background ,alum-2))))
   `(semantic-decoration-on-unknown-includes ((,class (:background "#EBE4E4"))))
   ;; `(semantic-decoration-on-unparsed-includes ((,class (:underline ,orange-3))))
   `(semantic-highlight-func-current-tag-face ((,class ,highlight-current-tag)))
   `(semantic-tag-boundary-face ((,class (:overline "#6D6D6D")))) ; Method separator.
   ;; `(semantic-unmatched-syntax-face ((,class (:underline ,red-1))))

   `(Info-title-1-face ((,class ,ol1)))
   `(Info-title-2-face ((,class ,ol2)))
   `(Info-title-3-face ((,class ,ol3)))
   `(Info-title-4-face ((,class ,ol4)))
   `(ace-jump-face-foreground ((,class (:weight bold :foreground "black" :background "#EA9800"))))
   `(ahs-face ((,class (:background "#D2D2EB"))))
   `(ahs-definition-face ((,class (:background "#EBA7B6"))))
   `(ahs-plugin-default-face ((,class (:background "#EBD2EB")))) ; Current.
   `(anzu-match-1 ((,class (:foreground "black" :background "aquamarine"))))
   `(anzu-match-2 ((,class (:foreground "black" :background "springgreen"))))
   `(anzu-match-3 ((,class (:foreground "black" :background "red"))))
   `(anzu-mode-line ((,class (:foreground "black" :background "#76EB76"))))
   `(anzu-mode-line-no-match ((,class (:foreground "black" :background "#EB7676"))))
   `(anzu-replace-highlight ((,class (:inherit query-replace))))
   `(anzu-replace-to ((,class (:weight bold :foreground "#AE2FE9" :background "#E9AE2F"))))
   `(auto-dim-other-buffers-face ((,class (:background "#E3E3E3"))))
   `(avy-background-face ((,class (:background "#9B9B9B"))))
   `(avy-lead-face ((,class (:weight bold :foreground "black" :background "#E2E306"))))
   `(avy-lead-face-0 ((,class (:weight bold :foreground "white" :background "#488211"))))
   `(bbdb-company ((,class (:slant italic :foreground "steel blue"))))
   `(bbdb-field-name ((,class (:weight bold :foreground "steel blue"))))
   `(bbdb-field-value ((,class (:foreground "steel blue"))))
   `(bbdb-name ((,class (:underline t :foreground "#EB5E2F"))))
   `(bmkp-light-autonamed ((,class (:background "#DDDDDD"))))
   `(bmkp-light-fringe-autonamed ((,class (:foreground "#535353" :background "#C3C3C3"))))
   `(bmkp-light-fringe-non-autonamed ((,class (:foreground "#EBEBBC" :background "#01EBE7")))) ; default
   `(bmkp-light-non-autonamed ((,class (:background "#B0EBEA"))))
   `(bmkp-no-local ((,class (:background "pink"))))
   `(browse-kill-ring-separator-face ((,class (:foreground "red"))))
   `(calendar-month-header ((,class (:weight bold :foreground "#494438" :background "#EBEBBC"))))
   `(calendar-today ((,class (:weight bold :foreground "#494438" :background "#EBEBBC"))))
   `(calendar-weekday-header ((,class (:weight bold :foreground "#145AA1"))))
   `(calendar-weekend-header ((,class (:weight bold :foreground "#484848"))))
   `(cfw:face-annotation ((,class (:foreground "green" :background "red"))))
   `(cfw:face-day-title ((,class (:foreground "#B9B9B9"))))
   `(cfw:face-default-content ((,class (:foreground "#264B96"))))
   `(cfw:face-default-day ((,class (:weight bold))))
   `(cfw:face-disable ((,class (:foreground "DarkGray"))))
   `(cfw:face-grid ((,class (:foreground "#CBCBCB"))))
   `(cfw:face-header ((,class (:foreground "#145AA1" :background "white" :weight bold))))
   `(cfw:face-holiday ((,class (:foreground "#6D6D6D" :background "#D2D8EA"))))
   `(cfw:face-periods ((,class (:foreground "white" :background "#5E81C8" :slant italic))))
   `(cfw:face-saturday ((,class (:foreground "#484848" :background "white" :weight bold))))
   `(cfw:face-select ((,class (:foreground "#4489D8" :background "#DADEE6"))))
   `(cfw:face-sunday ((,class (:foreground "#484848" :background "white" :weight bold))))
   `(cfw:face-title ((,class (:height 2.0 :foreground "#5F5F5F" :weight bold :inherit variable-pitch))))
   `(cfw:face-today ((,class (:foreground "#494438" :background "#EBEBBC"))))
   `(cfw:face-today-title ((,class (:foreground "white" :background "#155EA3"))))
   `(cfw:face-toolbar ((,class (:background "white"))))
   `(cfw:face-toolbar-button-off ((,class (:foreground "#BEBEBE" :background "white"))))
   `(cfw:face-toolbar-button-on ((,class (:foreground "#565656" :background "#E2E2E2"))))
   `(change-log-date ((,class (:foreground "purple"))))
   `(change-log-file ((,class (:weight bold :foreground "#3C79B4"))))
   `(change-log-list ((,class (:foreground "black" :background "#6CDBB7"))))
   `(change-log-name ((,class (:foreground "#007600"))))
   `(circe-highlight-all-nicks-face ((,class (:foreground "blue" :background "#DDDDDD")))) ; other nick names
   `(circe-highlight-nick-face ((,class (:foreground "#008700" :background "#DDDDDD")))) ; messages with my nick cited
   `(circe-my-message-face ((,class (:foreground "#808080" :background "#DDDDDD"))))
   `(circe-originator-face ((,class (:foreground "blue"))))
   `(circe-prompt-face ((,class (:foreground "red"))))
   `(circe-server-face ((,class (:foreground "#8DBAD3"))))

   ;; `(ac-selection-face ((,class ,completion-selected-candidate)))
   `(ac-selection-face ((,class (:weight bold :foreground "white" :background "orange")))) ; TEMP For diff'ing AC from Comp.
   `(ac-candidate-face ((,class ,completion-other-candidates)))
   `(ac-completion-face ((,class ,completion-inline)))
   `(ac-candidate-mouse-face ((,class (:inherit highlight))))
   `(popup-scroll-bar-background-face ((,class (:background "#D8E0EA"))))
   `(popup-scroll-bar-foreground-face ((,class (:background "#C0C9D2")))) ; Scrollbar (visible).

   ;; Company.
   `(company-tooltip-common-selection ((,class (:weight bold :foreground "#046BA7" :inherit company-tooltip-selection)))) ; Prefix + common part in tooltip (for selection).
   `(company-tooltip-selection ((,class ,completion-selected-candidate))) ; Suffix in tooltip (for selection).
   `(company-tooltip-annotation-selection ((,class (:weight bold :foreground "#777777")))) ; Annotation (for selection).
   `(company-tooltip-common ((,class (:weight normal :foreground "#046BA7" :inherit company-tooltip)))) ; Prefix + common part in tooltip.
   `(company-tooltip ((,class ,completion-other-candidates))) ; Suffix in tooltip.
   `(company-tooltip-annotation ((,class (:weight normal :foreground "#777777")))) ; Annotation.
   `(company-preview ((,class ,completion-inline)))
   `(company-preview-common ((,class ,completion-inline)))
   `(company-scrollbar-bg ((,class (:background "#D8E0EA"))))
   `(company-scrollbar-fg ((,class (:background "#C0C9D2")))) ; Scrollbar (visible).

   ;; Centaur Tabs
   ;; With the addition of tab-mode, centaur tabs looks there first for how the tabline should look
   (if (version<= "27.0" emacs-version)
       `(tab-line ((t (:background ,"#56628D" :foreground ,"#56628D")))))
   `(centaur-tabs-default ((t (:background ,"#2F569B" :foreground ,"#EBEBEB" :box nil))))
   `(centaur-tabs-background-color ((t (:background ,"#56628D" :foreground ,"#56628D" :box nil))))
   `(centaur-tabs-active-bar-face ((t (:background ,"#2F569B" :foreground ,"#EBEBEB"  :box nil))))
   `(centaur-tabs-selected ((t (:foreground ,"#2F2F2F" :background ,"#E1BC79" :box nil))))
   `(centaur-tabs-unselected ((t (:foreground ,"#EBEBEB" :background ,"#364977" :box nil))))
   `(centaur-tabs-selected-modified ((t (:foreground ,"#2F2F2F" :background ,"#E1BC79" :weight ,'bold :box nil))))
   `(centaur-tabs-unselected-modified ((t (:foreground ,"#EBEBEB" :background ,"#364977" :weight ,'bold :box nil))))
   `(centaur-tabs-modified-marker-selected ((t (:foreground ,"#2F2F2F" :background ,"#E1BC79" :weight ,'bold :box nil))))
   `(centaur-tabs-modified-marker-unselected ((t (:foreground ,"#EBEBEB" :background ,"#364977" :weight ,'bold :box nil))))

   ;; doom-modeline
   `(doom-modeline-bar ((t (:background ,"#56628D"))))
   `(doom-modeline-info ((t (:inherit ,'mode-line-emphasis))))
   `(doom-modeline-urgent ((t (:inherit ,'mode-line-emphasis))))
   `(doom-modeline-warning ((t (:inherit ,'mode-line-emphasis))))
   `(doom-modeline-debug ((t (:inherit ,'mode-line-emphasis))))
   `(doom-modeline-buffer-minor-mode ((t (:inherit ,'mode-line-emphasis :weight ,'bold))))
   `(doom-modeline-project-dir ((t (:inherit ,'mode-line-emphasis :weight ,'bold))))
   `(doom-modeline-project-parent-dir ((t (:inherit ,'mode-line-emphasis :weight ,'bold))))
   `(doom-modeline-persp-name ((t (:inherit ,'mode-line-emphasis :weight ,'bold))))
   `(doom-modeline-buffer-file ((t (:inherit ,'mode-line-emphasis :weight ,'bold))))
   `(doom-modeline-buffer-modified ((t (:inherit ,'mode-line-emphasis :weight ,'bold))))
   `(doom-modeline-lsp-success ((t (:inherit ,'mode-line-emphasis :weight ,'bold))))
   `(doom-modeline-buffer-path ((t (:inherit ,'mode-line-emphasis :weight ,'bold))))
   `(doom-modeline-buffer-project-root ((t (:inherit ,'mode-line-emphasis))))

   `(comint-highlight-input ((,class (:weight bold :foreground "#005391"))))
   `(comint-highlight-prompt ((,class (:weight bold :foreground "#002F5E"))))
   `(compare-windows ((,class (:background "#EBEB00"))))
   ;; `(completions-common-part ((,class (:foreground "red" :weight bold))))
   ;; `(completions-first-difference ((,class (:foreground "green" :weight bold))))
   `(compilation-error ((,class (:weight bold :foreground "red")))) ; Used for grep error messages.
   `(compilation-info ((,class (:weight bold :foreground "#5F79C6"))))
   `(compilation-line-number ((,class ,grep-line-number)))
   `(compilation-warning ((,class (:weight bold :foreground "orange"))))
   `(compilation-mode-line-exit ((,class (:weight bold :foreground "green")))) ; :exit[matched]
   `(compilation-mode-line-fail ((,class (:weight bold :foreground "violet")))) ; :exit[no match]
   `(compilation-mode-line-run ((,class (:weight bold :foreground "orange")))) ; :run
   `(css-property ((,class (:foreground "#009C00"))))
   `(css-selector ((,class (:weight bold :foreground "blue"))))
   `(custom-button ((,class (:box (:line-width 2 :style released-button) :foreground "black" :background "lightgrey"))))
   `(custom-button-mouse ((,class (:box (:line-width 2 :style released-button) :foreground "black" :background "grey90"))))
   `(custom-button-pressed ((,class (:box (:line-width 2 :style pressed-button) :foreground "black" :background "light grey"))))
   `(custom-button-pressed-unraised ((,class (:underline t :foreground "magenta4"))))
   `(custom-button-unraised ((,class (:underline t))))
   `(custom-changed ((,class (:foreground "white" :background "blue"))))
   `(custom-comment ((,class (:background "gray85"))))
   `(custom-comment-tag ((,class (:foreground "blue4"))))
   `(custom-documentation ((,class (nil))))
   `(custom-face-tag ((,class (:family "Sans Serif" :height 1.2 :weight bold))))
   `(custom-group-tag ((,class (:height 1.2 :weight bold :foreground "blue1"))))
   `(custom-group-tag-1 ((,class (:family "Sans Serif" :height 1.2 :weight bold :foreground "red1"))))
   `(custom-invalid ((,class (:foreground "yellow" :background "red"))))
   `(custom-link ((,class (:underline t :foreground "blue1"))))
   `(custom-modified ((,class (:foreground "white" :background "blue"))))
   `(custom-rogue ((,class (:foreground "pink" :background "black"))))
   `(custom-saved ((,class (:underline t))))
   `(custom-set ((,class (:foreground "blue" :background "white"))))
   `(custom-state ((,class (:foreground "green4"))))
   `(custom-themed ((,class (:foreground "white" :background "blue1"))))
   `(custom-variable-button ((,class (:weight bold :underline t))))
   `(custom-variable-tag ((,class (:family "Sans Serif" :height 1.2 :weight bold :foreground "blue1"))))
   `(custom-visibility ((,class ,link)))
   `(diff-hl-change ((,class (:foreground "blue3" :background "#C9DAEB"))))
   `(diff-hl-delete ((,class (:foreground "red3" :background "#EBCACE"))))
   `(diff-hl-dired-change ((,class (:weight bold :foreground "black" :background "#EB9631"))))
   `(diff-hl-dired-delete ((,class (:weight bold :foreground "#C63413"))))
   `(diff-hl-dired-ignored ((,class (:weight bold :foreground "white" :background "#B1AC9D"))))
   `(diff-hl-dired-insert ((,class (:weight bold :foreground "#AAAAAB"))))
   `(diff-hl-dired-unknown ((,class (:foreground "white" :background "#3A36A6"))))
   `(diff-hl-insert ((,class (:foreground "green4" :background "#BDEBC7"))))
   `(diff-hl-unknown ((,class (:foreground "white" :background "#3A36A6"))))
   `(diary-face ((,class (:foreground "#7CB9E8"))))
   `(dircolors-face-asm ((,class (:foreground "black"))))
   `(dircolors-face-backup ((,class (:foreground "black"))))
   `(dircolors-face-compress ((,class (:foreground "red"))))
   `(dircolors-face-dir ((,class ,directory)))
   `(dircolors-face-doc ((,class (:foreground "black"))))
   `(dircolors-face-dos ((,class (:foreground "ForestGreen"))))
   `(dircolors-face-emacs ((,class (:foreground "black"))))
   `(dircolors-face-exec ((,class (:foreground "ForestGreen"))))
   `(dircolors-face-html ((,class (:foreground "black"))))
   `(dircolors-face-img ((,class (:foreground "magenta3"))))
   `(dircolors-face-lang ((,class (:foreground "black"))))
   `(dircolors-face-lang-interface ((,class (:foreground "black"))))
   `(dircolors-face-make ((,class (:foreground "black"))))
   `(dircolors-face-objet ((,class (:foreground "black"))))
   `(dircolors-face-package ((,class (:foreground "black"))))
   `(dircolors-face-paddb ((,class (:foreground "black"))))
   `(dircolors-face-ps ((,class (:foreground "black"))))
   `(dircolors-face-sound ((,class (:foreground "DeepSkyBlue"))))
   `(dircolors-face-tar ((,class (:foreground "red"))))
   `(dircolors-face-text ((,class (:foreground "black"))))
   `(dircolors-face-yacc ((,class (:foreground "black"))))
   `(dired-directory ((,class ,directory)))
   `(dired-header ((,class ,directory)))
   `(dired-ignored ((,class (:strike-through t :foreground "red"))))
   `(dired-mark ((,class ,marked-line)))
   `(dired-marked ((,class ,marked-line)))
   `(dired-symlink ((,class ,symlink)))
   `(diredfl-compressed-file-suffix ((,class (:foreground "#000000" :background "#EBE284"))))
   `(diredp-compressed-file-suffix ((,class (:foreground "red"))))
   `(diredp-date-time ((,class (:foreground "purple"))))
   `(diredp-dir-heading ((,class ,directory)))
   `(diredp-dir-name ((,class ,directory)))
   `(diredp-dir-priv ((,class ,directory)))
   `(diredp-exec-priv ((,class (:background "#03B137"))))
   `(diredp-executable-tag ((,class (:foreground "ForestGreen" :background "white"))))
   `(diredp-file-name ((,class ,file)))
   `(diredp-file-suffix ((,class (:foreground "#B1B1B1"))))
   `(diredp-flag-mark-line ((,class ,marked-line)))
   `(diredp-ignored-file-name ((,class ,shadow)))
   `(diredp-read-priv ((,class (:background "#098DEB"))))
   `(diredp-write-priv ((,class (:foreground "white" :background "#EB3B3B"))))
   `(eldoc-highlight-function-argument ((,class (:weight bold :foreground "red" :background "#EBD2EB"))))
   `(elfeed-search-filter-face ((,class (:foreground "gray"))))
   ;; `(eww-form-checkbox ((,class ())))
   ;; `(eww-form-select ((,class ())))
   ;; `(eww-form-submit ((,class ())))
   `(eww-form-text ((,class (:weight bold :foreground "#3B5166" :background "#9ABDDE"))))
   ;; `(eww-form-textarea ((,class ())))
   `(fill-column-indicator ((,class (:foreground "#CECECE" :background unspecified))))
   `(file-name-shadow ((,class ,shadow)))
   `(flycheck-error ((,class (:underline (:color "#EA221C" :style wave) :weight bold :background "#EBCFCF"))))
   `(flycheck-error-list-line-number ((,class (:foreground "#9831A0"))))
   `(flycheck-fringe-error ((,class (:foreground "#EA221C"))))
   `(flycheck-fringe-info ((,class (:foreground "#137F13"))))
   `(flycheck-fringe-warning ((,class (:foreground "#E09B34"))))
   `(flycheck-info ((,class (:underline (:color "#137F13" :style wave) :weight bold))))
   `(flycheck-warning ((,class (:underline (:color "#E09B34" :style wave) :weight bold :background "#EBEBAF"))))
   `(font-latex-bold-face ((,class (:weight bold :foreground "black"))))
   `(fancy-narrow-blocked-face ((,class (:foreground "#8D8C97"))))
   `(flycheck-color-mode-line-error-face ((, class (:background "#BE544F"))))
   `(flycheck-color-mode-line-warning-face ((, class (:background "#D8B700"))))
   `(flycheck-color-mode-line-info-face ((, class (:background "yellow"))))
   `(font-latex-italic-face ((,class (:slant italic :foreground "#181818"))))
   `(font-latex-math-face ((,class (:foreground "blue"))))
   `(font-latex-sectioning-1-face ((,class (:family "Sans Serif" :height 2.7 :weight bold :foreground "cornflower blue"))))
   `(font-latex-sectioning-2-face ((,class ,ol1)))
   `(font-latex-sectioning-3-face ((,class ,ol2)))
   `(font-latex-sectioning-4-face ((,class ,ol3)))
   `(font-latex-sectioning-5-face ((,class ,ol4)))
   `(font-latex-sedate-face ((,class (:foreground "#EB4E00"))))
   `(font-latex-string-face ((,class (:weight bold :foreground "#005EEB"))))
   `(font-latex-verbatim-face ((,class (:foreground "#00007D" :background "#EBEBCE" :inherit nil))))
   `(git-commit-summary-face ((,class (:foreground "#000000"))))
   `(git-commit-comment-face ((,class (:slant italic :foreground "#616161"))))
   `(git-timemachine-commit ((,class ,diff-removed)))
   `(git-timemachine-minibuffer-author-face ((,class ,diff-added)))
   `(git-timemachine-minibuffer-detail-face ((,class ,diff-header)))
   `(google-translate-text-face ((,class (:foreground "#6D6D6D" :background "#E1E1E1"))))
   `(google-translate-phonetic-face ((,class (:inherit shadow))))
   `(google-translate-translation-face ((,class (:weight normal :foreground "#2C6FDA" :background "#D1D7DF"))))
   `(google-translate-suggestion-label-face ((,class (:foreground "red"))))
   `(google-translate-suggestion-face ((,class (:slant italic :underline t))))
   `(google-translate-listen-button-face ((,class (:height 0.8))))
   `(helm-action ((,class (:foreground "black"))))
   `(helm-bookmark-file ((,class ,file)))
   `(helm-bookmarks-su-face ((,class (:foreground "red"))))
   `(helm-buffer-directory ((,class ,directory)))
   ;; `(helm-non-file-buffer ((,class (:slant italic :foreground "blue"))))
   ;; `(helm-buffer-file ((,class (:foreground "#2F2F2F"))))
   `(helm-buffer-modified ((,class (:slant italic :foreground "#AB3298"))))
   `(helm-buffer-process ((,class (:foreground "#007800"))))
   `(helm-candidate-number ((,class (:foreground "black" :background "#EBEB5E"))))
   `(helm-dir-heading ((,class (:foreground "blue" :background "pink"))))
   `(helm-dir-priv ((,class (:foreground "dark red" :background "light grey"))))
   `(helm-ff-directory ((,class ,directory)))
   `(helm-ff-dotted-directory ((,class ,directory)))
   `(helm-ff-executable ((,class (:foreground "green3" :background "white"))))
   `(helm-ff-file ((,class (:foreground "black"))))
   `(helm-ff-invalid-symlink ((,class (:foreground "yellow" :background "red"))))
   `(helm-ff-symlink ((,class ,symlink)))
   `(helm-file-name ((,class (:foreground "blue"))))
   `(helm-gentoo-match-face ((,class (:foreground "red"))))
   `(helm-grep-file ((,class ,grep-file-name)))
   `(helm-grep-lineno ((,class ,grep-line-number)))
   `(helm-grep-match ((,class ,match)))
   `(helm-grep-running ((,class (:weight bold :foreground "white"))))
   `(helm-isearch-match ((,class (:background "#BCEBBC"))))
   `(helm-lisp-show-completion ((,class ,volatile-highlight-supersize))) ; See `helm-dabbrev'.
   ;; `(helm-ls-git-added-copied-face ((,class (:foreground ""))))
   ;; `(helm-ls-git-added-modified-face ((,class (:foreground ""))))
   ;; `(helm-ls-git-conflict-face ((,class (:foreground ""))))
   ;; `(helm-ls-git-deleted-and-staged-face ((,class (:foreground ""))))
   ;; `(helm-ls-git-deleted-not-staged-face ((,class (:foreground ""))))
   ;; `(helm-ls-git-modified-and-staged-face ((,class (:foreground ""))))
   `(helm-ls-git-modified-not-staged-face ((,class (:foreground "#AB3298"))))
   ;; `(helm-ls-git-renamed-modified-face ((,class (:foreground ""))))
   ;; `(helm-ls-git-untracked-face ((,class (:foreground ""))))
   `(helm-match ((,class ,match)))
   `(helm-moccur-buffer ((,class (:foreground "#005EBC"))))
   `(helm-selection ((,class (:background "#346CC5" :foreground "white"))))
   `(helm-selection-line ((,class ,highlight-gray))) ; ???
   `(helm-separator ((,class (:foreground "red"))))
   `(helm-source-header ((,class (:weight bold :box (:line-width 1 :color "#B7B7B7") :background "#CCCCCC" :foreground "black"))))
   `(helm-swoop-target-line-block-face ((,class (:background "#BCBC00" :foreground "#1F1F1F"))))
   `(helm-swoop-target-line-face ((,class (:background "#BCBCEB"))))
   `(helm-swoop-target-word-face ((,class (:weight bold :foreground unspecified :background "#E9AE2F"))))
   `(helm-visible-mark ((,class ,marked-line)))
   `(helm-w3m-bookmarks-face ((,class (:underline t :foreground "cyan1"))))
   `(highlight-changes ((,class (:foreground unspecified)))) ;; blue "#2A07A7"
   `(highlight-changes-delete ((,class (:strike-through nil :foreground unspecified)))) ;; red "#A7072A"
   `(highlight-symbol-face ((,class (:background "#EBEB93"))))
   `(hl-line ((,class ,highlight-yellow))) ; Highlight current line.
   `(hl-tags-face ((,class ,highlight-current-tag))) ; ~ Pair highlighting (matching tags).
   `(holiday-face ((,class (:foreground "#6D6D6D" :background "#D2D8EA"))))
   `(html-helper-bold-face ((,class (:weight bold :foreground "black"))))
   `(html-helper-italic-face ((,class (:slant italic :foreground "black"))))
   `(html-helper-underline-face ((,class (:underline t :foreground "black"))))
   `(html-tag-face ((,class (:foreground "blue"))))
   `(ilog-non-change-face ((,class (:height 2.0 :foreground "#5C3096"))))
   `(ilog-change-face ((,class (:height 2.0 :foreground "#007800"))))
   `(ilog-echo-face ((,class (:height 2.0 :foreground "#0066CE"))))
   `(ilog-load-face ((,class (:foreground "#AB3298"))))
   `(ilog-message-face ((,class (:foreground "#767676"))))
   `(image-dired-thumb-flagged ((,class (:background "red"))))
   `(image-dired-thumb-mark ((,class :background "#EB9C9C")))
   `(indent-guide-face ((,class (:foreground "#C2C2C2"))))
   `(info-file ((,class (:family "Sans Serif" :height 1.8 :weight bold :box (:line-width 1 :color "#0000BC") :foreground "cornflower blue" :background "LightSteelBlue1"))))
   `(info-header-node ((,class (:underline t :foreground "orange")))) ; nodes in header
   `(info-header-xref ((,class (:underline t :foreground "dodger blue")))) ; cross references in header
   `(info-index-match ((,class (:weight bold :foreground unspecified :background "#E9AE2F")))) ; when using `i'
   `(info-menu-header ((,class ,ol2))) ; menu titles (headers) -- major topics
   `(info-menu-star ((,class (:foreground "black")))) ; every 3rd menu item
   `(info-node ((,class (:underline t :foreground "blue")))) ; node names
   `(info-quoted-name ((,class ,code-inline)))
   `(info-string ((,class ,string)))
   `(info-title-1 ((,class ,ol1)))
   `(info-xref ((,class (:underline t :foreground "#0064A1")))) ; unvisited cross-references
   `(info-xref-visited ((,class (:underline t :foreground "magenta4")))) ; previously visited cross-references
   ;; js2-highlight-vars-face (~ auto-highlight-symbol)
   `(js2-error ((,class (:box (:line-width 1 :color "#EB3333") :background "#EBB8B8")))) ; DONE.
   `(js2-external-variable ((,class (:foreground "#EB0000" :background "#EBE4E4")))) ; DONE.
   `(js2-function-param ((,class ,function-param)))
   `(js2-instance-member ((,class (:foreground "DarkOrchid"))))
   `(js2-jsdoc-html-tag-delimiter ((,class (:foreground "#BF3329"))))
   `(js2-jsdoc-html-tag-name ((,class (:foreground "#BF3329"))))
   `(js2-jsdoc-tag ((,class (:weight normal :foreground "#5C3096"))))
   `(js2-jsdoc-type ((,class (:foreground "SteelBlue"))))
   `(js2-jsdoc-value ((,class (:weight normal :foreground "#AB3298")))) ; #760076
   `(js2-magic-paren ((,class (:underline t))))
   `(js2-private-function-call ((,class (:foreground "goldenrod"))))
   `(js2-private-member ((,class (:foreground "PeachPuff3"))))
   `(js2-warning ((,class (:underline "orange"))))

   ;; Org non-standard faces.
   `(nivaca-leuven-org-deadline-overdue ((,class (:foreground "#DF2352"))))
   `(nivaca-leuven-org-deadline-today ((,class (:weight bold :foreground "#494438" :background "#EBEBBC"))))
   `(nivaca-leuven-org-deadline-tomorrow ((,class (:foreground "#3B9B0A"))))
   `(nivaca-leuven-org-deadline-future ((,class (:foreground "#3B9B0A"))))
   `(nivaca-leuven-gnus-unseen ((,class (:weight bold :foreground "#E86902"))))
   `(nivaca-leuven-gnus-date ((,class (:foreground "#EB76B0"))))
   `(nivaca-leuven-gnus-size ((,class (:foreground "#84B058"))))
   `(nivaca-leuven-todo-items-face ((,class (:weight bold :foreground "#EB2D22" :background "#EBEB7D"))))

   `(light-symbol-face ((,class (:background "#EBEB93"))))
   `(linum ((,class (:foreground "#8E8E8E" :background "#DADADA"))))
   `(log-view-file ((,class (:foreground "#0000BC" :background "#D7DFE1"))))
   `(log-view-message ((,class (:foreground "black" :background "#DAD76B"))))
   `(lsp-modeline-code-actions-preferred-face ((,class (:foreground "#000000" :background "#EBE284"))))
   `(lsp-ui-doc-background ((,class (:background "#E2EABD"))))
   `(lsp-ui-sideline-code-action ((,class (:foreground "#000000" :background "#EBE284"))))
   `(lui-button-face ((,class ,link)))
   `(lui-highlight-face ((,class (:box '(:line-width 1 :color "#BC0000") :foreground "#BC0000" :background "#EBEB7D")))) ; my nickname
   `(lui-time-stamp-face ((,class (:foreground "purple"))))
   `(magit-blame-header ((,class (:inherit magit-diff-file-header))))
   `(magit-blame-heading ((,class (:overline "#9A9A9A" :foreground "red" :background "#D4D4D4"))))
   `(magit-blame-hash ((,class (:overline "#9A9A9A" :foreground "red" :background "#D4D4D4"))))
   `(magit-blame-name ((,class (:overline "#9A9A9A" :foreground "#036206" :background "#D4D4D4"))))
   `(magit-blame-date ((,class (:overline "#9A9A9A" :foreground "blue" :background "#D4D4D4"))))
   `(magit-blame-summary ((,class (:overline "#9A9A9A" :weight bold :foreground "#676767" :background "#D4D4D4"))))
   `(magit-branch ((,class ,vc-branch)))
   `(magit-diff-add ((,class ,diff-added)))
   `(magit-diff-del ((,class ,diff-removed)))
   `(magit-diff-file-header ((,class (:height 1.1 :weight bold :foreground "#3C79B4"))))
   `(magit-diff-hunk-header ((,class ,diff-hunk-header)))
   `(magit-diff-hunk-heading ((,class (:foreground "grey20" :background "grey80"))))
   `(magit-diff-hunk-heading-highlight ((,class ,diff-header)))
   `(magit-diff-none ((,class ,diff-none)))
   `(magit-header ((,class (:foreground "white" :background "#EB3B3B"))))
   `(magit-item-highlight ((,class (:background "#D7DFE1"))))
   `(magit-item-mark ((,class ,marked-line)))
   `(magit-log-head-label ((,class (:box (:line-width 1 :color "blue" :style nil)))))
   `(magit-log-tag-label ((,class (:box (:line-width 1 :color "#00BC00" :style nil)))))
   `(magit-section-highlight ((,class (:background  "#E2EABD"))))
   `(magit-section-title ((,class (:family "Sans Serif" :height 1.8 :weight bold :foreground "cornflower blue" :inherit nil))))
   `(makefile-space-face ((,class (:background "hot pink"))))
   `(makefile-targets ((,class (:weight bold :foreground "blue"))))
   ;; `(markdown-blockquote-face ((,class ())))
   `(markdown-bold-face ((,class (:inherit bold))))
   ;; `(markdown-comment-face ((,class ())))
   ;; `(markdown-footnote-face ((,class ())))
   ;; `(markdown-header-delimiter-face ((,class ())))
   ;; `(markdown-header-face ((,class ())))
   `(markdown-header-face-1 ((,class ,ol1)))
   `(markdown-header-face-2 ((,class ,ol2)))
   `(markdown-header-face-3 ((,class ,ol3)))
   `(markdown-header-face-4 ((,class ,ol4)))
   `(markdown-header-face-5 ((,class ,ol5)))
   `(markdown-header-face-6 ((,class ,ol6)))
   ;; `(markdown-header-rule-face ((,class ())))
   `(markdown-inline-code-face ((,class ,code-inline)))
   `(markdown-italic-face ((,class (:inherit italic))))
   `(markdown-language-keyword-face ((,class (:inherit org-block-begin-line))))
   ;; `(markdown-line-break-face ((,class ())))
   `(markdown-link-face ((,class ,link-no-underline)))
   ;; `(markdown-link-title-face ((,class ())))
   ;; `(markdown-list-face ((,class ())))
   ;; `(markdown-math-face ((,class ())))
   ;; `(markdown-metadata-key-face ((,class ())))
   ;; `(markdown-metadata-value-face ((,class ())))
   ;; `(markdown-missing-link-face ((,class ())))
   `(markdown-pre-face ((,class (:inherit org-block))))
   ;; `(markdown-reference-face ((,class ())))
   ;; `(markdown-strike-through-face ((,class ())))
   `(markdown-url-face ((,class ,link)))
   `(match ((,class ,match)))           ; Used for grep matches.
   `(mc/cursor-bar-face ((,class (:height 1.0 :foreground "#145CB4" :background "#145CB4"))))
   `(mc/cursor-face ((,class (:inverse-video t))))
   `(mc/region-face ((,class (:inherit region))))
   `(mm-uu-extract ((,class ,code-block)))
   `(moccur-current-line-face ((,class (:foreground "black" :background "#EBEBBC"))))
   `(moccur-face ((,class (:foreground "black" :background "#EBEB8D"))))
   `(next-error ((,class ,volatile-highlight-supersize)))
   `(nobreak-space ((,class (:background "#BCD5E2"))))
   `(nxml-attribute-local-name-face ((,class ,xml-attribute)))
   `(nxml-attribute-value-delimiter-face ((,class (:foreground "green4"))))
   `(nxml-attribute-value-face ((,class (:foreground "green4"))))
   `(nxml-comment-content-face ((,class (:slant italic :foreground "red"))))
   `(nxml-comment-delimiter-face ((,class (:foreground "red"))))
   `(nxml-element-local-name ((,class ,xml-tag)))
   `(nxml-element-local-name-face ((,class (:foreground "blue"))))
   `(nxml-processing-instruction-target-face ((,class (:foreground "purple1"))))
   `(nxml-tag-delimiter-face ((,class (:foreground "blue"))))
   `(nxml-tag-slash-face ((,class (:foreground "blue"))))
   `(org-agenda-block-count ((,class (:weight bold :foreground "#989898"))))
   `(org-agenda-calendar-event ((,class (:weight bold :foreground "#006EC3" :background "#B8CEDF"))))
   `(org-agenda-calendar-sexp ((,class (:foreground "#2E70BD" :background "#BCD2E2"))))
   `(org-agenda-clocking ((,class (:foreground "black" :background "#DBB900"))))
   `(org-agenda-column-dateline ((,class ,column)))
   `(org-agenda-current-time ((,class (:underline t :foreground "#145AA1"))))
   `(org-agenda-date ((,class (,@(nivaca-leuven-scale-font nivaca-leuven-scale-org-agenda-structure 1.6) :weight bold :foreground "#006EC3")))) ; "#145AA1"
   `(org-agenda-date-today ((,class (,@(nivaca-leuven-scale-font nivaca-leuven-scale-org-agenda-structure 1.6) :weight bold :foreground "#494438" :background "#EBEBBC")))) ; "#EBDE58"
   `(org-agenda-date-weekend ((,class (,@(nivaca-leuven-scale-font nivaca-leuven-scale-org-agenda-structure 1.6) :weight bold :foreground "#484848"))))
   `(org-agenda-diary ((,class (:weight bold :foreground "green4" :background "light blue"))))
   `(org-agenda-dimmed-todo-face ((,class (:foreground "gold2"))))
   `(org-agenda-done ((,class (:foreground "#4E4E4E"))))
   `(org-agenda-filter-category ((,class (:weight bold :foreground "orange"))))
   `(org-agenda-filter-effort ((,class (:weight bold :foreground "orange"))))
   `(org-agenda-filter-regexp ((,class (:weight bold :foreground "orange"))))
   `(org-agenda-filter-tags ((,class (:weight bold :foreground "orange"))))
   `(org-agenda-restriction-lock ((,class (:background "#D5735B"))))
   `(org-agenda-structure ((,class (,@(nivaca-leuven-scale-font nivaca-leuven-scale-org-agenda-structure 1.6) :weight bold :foreground "#1D82C5"))))
   `(org-archived ((,class (:foreground "gray70"))))
   `(org-beamer-tag ((,class (:box (:line-width 1 :color "#E6AD16") :foreground "#282828" :background "#EBE4BF"))))
   `(org-block ((,class ,code-block)))
   `(org-block-begin-line ((,class (:underline "#9A999C" :foreground "#4E4E4E" :background "#D0CFC4"))))
   `(org-block-end-line ((,class (:overline "#9A999C" :foreground "#4E4E4E" :background "#D0CFC4"))))
   `(org-checkbox ((,class (:weight bold :foreground "#561513" :background "#EBD0CB"))))
   `(org-clock-overlay ((,class (:foreground "white" :background "SkyBlue4"))))
   `(org-code ((,class ,code-inline)))
   `(org-column ((,class ,column)))
   `(org-column-title ((,class ,column)))
   `(org-date ((,class (:underline t :foreground "#003F91"))))
   `(org-default ((,class (:foreground "#2F2F2F" :background "#EBEBEB"))))
   `(org-dim ((,class (:foreground "#9C9C9C"))))
   `(org-document-info ((,class (:foreground "#424242"))))
   `(org-document-info-keyword ((,class (:foreground "#0083C0" :background "#D7D7EB"))))
   `(org-document-title ((,class (,@(nivaca-leuven-scale-font nivaca-leuven-scale-org-document-title 1.8)  :weight bold :foreground "black"))))
   `(org-done ((,class (:weight bold :box "#7EB584" :foreground "#7EB584" :background "#D0EACC"))))
   `(org-drawer ((,class (:weight bold :foreground "#628320" :background "#DBEBDB"))))
   `(org-ellipsis ((,class (:underline nil :foreground "#8D8D8D")))) ; #EBDB5A
   `(org-example ((,class (:foreground "blue" :background "#DBEBDB"))))
   `(org-footnote ((,class (:underline t :foreground "#0083C0"))))
   `(org-formula ((,class (:foreground "chocolate1"))))
   ;; org-habit colours are thanks to zenburn
   `(org-habit-ready-face ((t :background "#759275"))) ; ,zenburn-green
   `(org-habit-alert-face ((t :background "#CEBE92" :foreground "#3A3A3A"))) ; ,zenburn-yellow-1 fg ,zenburn-bg
   `(org-habit-clear-face ((t :background "#557D80")))                       ; ,zenburn-blue-3
   `(org-habit-overdue-face ((t :background "#905B5B")))                     ; ,zenburn-red-3
   `(org-habit-clear-future-face ((t :background "#46676A")))                ; ,zenburn-blue-4
   `(org-habit-ready-future-face ((t :background "#577557")))                ; ,zenburn-green-2
   `(org-habit-alert-future-face ((t :background "#BFB084" :foreground "#3A3A3A"))) ; ,zenburn-yellow-2 fg ,zenburn-bg
   `(org-habit-overdue-future-face ((t :background "#814C4C"))) ; ,zenburn-red-4
   `(org-headline-done ((,class (:height 1.0 :weight normal :foreground "#9F9F9F"))))
   `(org-hide ((,class (:foreground "#D0D0D0"))))
   `(org-inlinetask ((,class (:box (:line-width 1 :color "#D8D8D8") :foreground "#6D6D6D" :background "#EBEBC5"))))
   `(org-latex-and-related ((,class (:foreground "#2F5E8D" :background "white"))))
   `(org-level-1 ((,class ,ol1)))
   `(org-level-2 ((,class ,ol2)))
   `(org-level-3 ((,class ,ol3)))
   `(org-level-4 ((,class ,ol4)))
   `(org-level-5 ((,class ,ol5)))
   `(org-level-6 ((,class ,ol6)))
   `(org-level-7 ((,class ,ol7)))
   `(org-level-8 ((,class ,ol8)))
   `(org-link ((,class ,link)))
   `(org-list-dt ((,class (:weight bold :foreground "#2F569B"))))
   `(org-macro ((,class (:weight bold :foreground "#DAA902"))))
   `(org-meta-line ((,class (:slant normal :foreground "#0083C0" :background "#D7D7EB"))))
   `(org-mode-line-clock ((,class (:box (:line-width 1 :color "#2F569B") :foreground "black" :background "#EB9631"))))
   `(org-mode-line-clock-overrun ((,class (:weight bold :box (:line-width 1 :color "#2F569B") :foreground "white" :background "#EB3B3B"))))
   `(org-number-of-items ((,class (:weight bold :foreground "white" :background "#6FAB6F"))))
   `(org-property-value ((,class (:foreground "#009300"))))
   `(org-quote ((,class (:slant italic :foreground "dim gray" :background "#EBEBCE"))))
   `(org-scheduled ((,class (:foreground "#2F2F2F"))))
   `(org-scheduled-previously ((,class (:foreground "#125EB6"))))
   `(org-scheduled-today ((,class (:weight bold :foreground "#494438" :background "#EBEBBC"))))
   `(org-sexp-date ((,class (:foreground "#336BBC"))))
   `(org-special-keyword ((,class (:weight bold :foreground "#4078A6" :background "#DBEBDB"))))
   `(org-table ((,class (:foreground "dark green" :background "#DBEBDB")))) ;; :inherit fixed-pitch))))
   `(org-tag ((,class (:weight normal :slant italic :foreground "#8E9297" :background "white"))))
   `(org-target ((,class (:foreground "#EB64A1"))))
   `(org-time-grid ((,class (:foreground "#A9A9A9"))))
   `(org-todo ((,class (:weight bold :box (:line-width 1 :color "#C79D9A") :foreground "#C79D9A" :background "#EBD4D2"))))
   ;; `(org-modern-todo ((,class (:weight semibold :inherit (org-todo org-modern-label)))))
   `(org-modern-todo ((,class (:foreground "#561513" :background "#EBD0CB"))))
   `(org-modern-tag ((,class (:foreground "#2D2B28" :background "#DEDDDC"))))
   `(org-upcoming-deadline ((,class (:foreground "#EB4E4E"))))
   `(org-verbatim ((,class (:foreground "#005EBC" :background "#E3E9EB"))))
   `(org-verse ((,class (:slant italic :foreground "dim gray" :background "#DBDBDB"))))
   `(org-warning ((,class (:weight bold :foreground "black" :background "#BCD5EB"))))
   `(outline-1 ((,class ,ol1)))
   `(outline-2 ((,class ,ol2)))
   `(outline-3 ((,class ,ol3)))
   `(outline-4 ((,class ,ol4)))
   `(outline-5 ((,class ,ol5)))
   `(outline-6 ((,class ,ol6)))
   `(outline-7 ((,class ,ol7)))
   `(outline-8 ((,class ,ol8)))
   `(pabbrev-debug-display-label-face ((,class (:foreground "white" :background "#991E4D"))))
   `(pabbrev-suggestions-face ((,class (:weight bold :foreground "white" :background "red"))))
   `(pabbrev-suggestions-label-face ((,class (:weight bold :foreground "white" :background "purple"))))
   `(paren-face-match ((,class ,paren-matched)))
   `(paren-face-mismatch ((,class ,paren-unmatched)))
   `(paren-face-no-match ((,class ,paren-unmatched)))
   `(persp-selected-face ((,class (:weight bold :foreground "#DBE1EA"))))
   `(powerline-active1 ((,class (:foreground "#7ABED8" :background "#343434" :inherit mode-line))))
   `(powerline-active2 ((,class (:foreground "#7ABED8" :background "#3B67A7" :inherit mode-line))))
   `(powerline-inactive1 ((,class (:foreground "#DDDDDC" :background "#606060" :inherit mode-line-inactive))))
   `(powerline-inactive2 ((,class (:foreground "#DDDDDC" :background "#9B9B9B" :inherit mode-line-inactive))))
   `(rainbow-delimiters-depth-1-face ((,class (:foreground "#676879"))))
   `(rainbow-delimiters-depth-2-face ((,class (:foreground "#6A7DC5"))))
   `(rainbow-delimiters-depth-3-face ((,class (:foreground "#848579"))))
   `(rainbow-delimiters-depth-4-face ((,class (:foreground "#678C67"))))
   `(rainbow-delimiters-depth-5-face ((,class (:foreground "#846A6A"))))
   `(rainbow-delimiters-depth-6-face ((,class (:foreground "#5A6DAB"))))
   `(rainbow-delimiters-depth-7-face ((,class (:foreground "#7A7A76"))))
   `(rainbow-delimiters-depth-8-face ((,class (:foreground "#769B76"))))
   `(rainbow-delimiters-depth-9-face ((,class (:foreground "#7D6767"))))
   `(rainbow-delimiters-mismatched-face ((,class ,paren-unmatched)))
   `(rainbow-delimiters-unmatched-face ((,class ,paren-unmatched)))
   `(recover-this-file ((,class (:weight bold :background "#EB3A3A"))))
   `(rng-error ((,class (:weight bold :foreground "red" :background "#E7D1D2"))))
   `(sh-heredoc ((,class (:foreground "blue" :background "#DBE1EA"))))
   `(sh-quoted-exec ((,class (:foreground "#EB1287"))))
   `(shadow ((,class ,shadow)))         ; Used for grep context lines.
   `(shell-option-face ((,class (:foreground "forest green"))))
   `(shell-output-2-face ((,class (:foreground "blue"))))
   `(shell-output-3-face ((,class (:foreground "purple"))))
   `(shell-output-face ((,class (:foreground "black"))))
   ;; `(shell-prompt-face ((,class (:weight bold :foreground "yellow"))))
   `(shm-current-face ((,class (:background "#DBD5C4"))))
   `(shm-quarantine-face ((,class (:background "lemonchiffon"))))
   `(show-paren-match ((,class ,paren-matched)))
   `(show-paren-mismatch ((,class ,paren-unmatched)))
   `(sml-modeline-end-face ((,class (:background "#629FE2")))) ; #2F569B
   `(sml-modeline-vis-face ((,class (:background "#176FBA"))))
   `(term ((,class (:foreground "#2F2F2F" :background "#EBEBEB"))))

   ;; `(sp-pair-overlay-face ((,class ())))
   ;; `(sp-show-pair-enclosing ((,class ())))
   ;; `(sp-show-pair-match-face ((,class ()))) ; ~ Pair highlighting (matching tags).
   ;; `(sp-show-pair-mismatch-face ((,class ())))
   ;; `(sp-wrap-overlay-closing-pair ((,class ())))
   ;; `(sp-wrap-overlay-face ((,class ())))
   ;; `(sp-wrap-overlay-opening-pair ((,class ())))
   ;; `(sp-wrap-tag-overlay-face ((,class ())))

   `(speedbar-button-face ((,class (:foreground "green4"))))
   `(speedbar-directory-face ((,class (:foreground "blue4"))))
   `(speedbar-file-face ((,class (:foreground "cyan4"))))
   `(speedbar-highlight-face ((,class ,volatile-highlight)))
   `(speedbar-selected-face ((,class (:underline t :foreground "red"))))
   `(speedbar-tag-face ((,class (:foreground "brown"))))
   `(svn-status-directory-face ((,class ,directory)))
   `(svn-status-filename-face ((,class (:weight bold :foreground "#3C79B4"))))
   `(svn-status-locked-face ((,class (:weight bold :foreground "red"))))
   `(svn-status-marked-face ((,class ,marked-line)))
   `(svn-status-marked-popup-face ((,class (:weight bold :foreground "green3"))))
   `(svn-status-switched-face ((,class (:slant italic :foreground "gray55"))))
   `(svn-status-symlink-face ((,class ,symlink)))
   `(svn-status-update-available-face ((,class (:foreground "orange"))))
   `(tex-verbatim ((,class (:foreground "blue"))))
   `(tool-bar ((,class (:box (:line-width 1 :style released-button) :foreground "black" :background "gray75"))))
   `(tooltip ((,class (:foreground "black" :background "light yellow"))))
   `(traverse-match-face ((,class (:weight bold :foreground "blue violet"))))
   `(vc-annotate-face-3F3FFF ((,class (:foreground "#3A3AEB" :background "black"))))
   `(vc-annotate-face-3F6CFF ((,class (:foreground "#3A3AEB" :background "black"))))
   `(vc-annotate-face-3F99FF ((,class (:foreground "#3A8DEB" :background "black"))))
   `(vc-annotate-face-3FC6FF ((,class (:foreground "#3A8DEB" :background "black"))))
   `(vc-annotate-face-3FF3FF ((,class (:foreground "#3AE0EB" :background "black"))))
   `(vc-annotate-face-3FFF56 ((,class (:foreground "#45EB45" :background "black"))))
   `(vc-annotate-face-3FFF83 ((,class (:foreground "#3AEBA2" :background "black"))))
   `(vc-annotate-face-3FFFB0 ((,class (:foreground "#3AEBA2" :background "black"))))
   `(vc-annotate-face-3FFFDD ((,class (:foreground "#3AE0EB" :background "black"))))
   `(vc-annotate-face-56FF3F ((,class (:foreground "#45EB45" :background "black"))))
   `(vc-annotate-face-83FF3F ((,class (:foreground "#A2EB3A" :background "black"))))
   `(vc-annotate-face-B0FF3F ((,class (:foreground "#A2EB3A" :background "black"))))
   `(vc-annotate-face-DDFF3F ((,class (:foreground "#EBE03A" :background "black"))))
   `(vc-annotate-face-F6FFCC ((,class (:foreground "black" :background "#EBEBB1"))))
   `(vc-annotate-face-FF3F3F ((,class (:foreground "#EB3A3A" :background "black"))))
   `(vc-annotate-face-FF6C3F ((,class (:foreground "#EB3A3A" :background "black"))))
   `(vc-annotate-face-FF993F ((,class (:foreground "#EB8D3A" :background "black"))))
   `(vc-annotate-face-FFC63F ((,class (:foreground "#EB8D3A" :background "black"))))
   `(vc-annotate-face-FFF33F ((,class (:foreground "#EBE03A" :background "black"))))
   `(vc-git-log-edit-summary-max-warning ((,class (:weight bold :foreground "red"))))

   ;; ;; vc
   ;; (vc-up-to-date-state    ((,c :foreground ,(gc 'green-1))))
   ;; (vc-edited-state        ((,c :foreground ,(gc 'yellow+1))))
   ;; (vc-missing-state       ((,c :foreground ,(gc 'red))))
   ;; (vc-conflict-state      ((,c :foreground ,(gc 'red+2) :weight bold)))
   ;; (vc-locked-state        ((,c :foreground ,(gc 'cyan-1))))
   ;; (vc-locally-added-state ((,c :foreground ,(gc 'blue))))
   ;; (vc-needs-update-state  ((,c :foreground ,(gc 'magenta))))
   ;; (vc-removed-state       ((,c :foreground ,(gc 'red-1))))

   `(vhl/default-face ((,class ,volatile-highlight))) ; `volatile-highlights.el' (for undo, yank).
   `(w3m-anchor ((,class ,link)))
   `(w3m-arrived-anchor ((,class (:foreground "purple1"))))
   `(w3m-bitmap-image-face ((,class (:foreground "gray4" :background "green"))))
   `(w3m-bold ((,class (:weight bold :foreground "black"))))
   `(w3m-current-anchor ((,class (:weight bold :underline t :foreground "blue"))))
   `(w3m-form ((,class (:underline t :foreground "tan1"))))
   `(w3m-form-button-face ((,class (:weight bold :underline t :foreground "gray4" :background "light grey"))))
   `(w3m-form-button-mouse-face ((,class (:underline t :foreground "light grey" :background "#287427"))))
   `(w3m-form-button-pressed-face ((,class (:weight bold :underline t :foreground "gray4" :background "light grey"))))
   `(w3m-header-line-location-content-face ((,class (:foreground "#757575":background "#E3E3E3"))))
   `(w3m-header-line-location-title-face ((,class (:foreground "#284EA3" :background "#E3E3E3"))))
   `(w3m-history-current-url-face ((,class (:foreground "lemon chiffon"))))
   `(w3m-image-face ((,class (:weight bold :foreground "DarkSeaGreen2"))))
   `(w3m-link-numbering ((,class (:foreground "#A6B7D8")))) ; mouseless browsing
   `(w3m-strike-through-face ((,class (:strike-through t))))
   `(w3m-underline-face ((,class (:underline t))))

   ;; `(web-mode-block-attr-name-face ((,class ())))
   ;; `(web-mode-block-attr-value-face ((,class ())))
   ;; `(web-mode-block-comment-face ((,class ())))
   ;; `(web-mode-block-control-face ((,class ())))
   ;; `(web-mode-block-delimiter-face ((,class ())))
   ;; `(web-mode-block-face ((,class ())))
   ;; `(web-mode-block-string-face ((,class ())))
   ;; `(web-mode-bold-face ((,class ())))
   ;; `(web-mode-builtin-face ((,class ())))
   ;; `(web-mode-comment-face ((,class ())))
   ;; `(web-mode-comment-keyword-face ((,class ())))
   ;; `(web-mode-constant-face ((,class ())))
   ;; `(web-mode-css-at-rule-face ((,class ())))
   ;; `(web-mode-css-color-face ((,class ())))
   ;; `(web-mode-css-comment-face ((,class ())))
   ;; `(web-mode-css-function-face ((,class ())))
   ;; `(web-mode-css-priority-face ((,class ())))
   ;; `(web-mode-css-property-name-face ((,class ())))
   ;; `(web-mode-css-pseudo-class-face ((,class ())))
   ;; `(web-mode-css-selector-face ((,class ())))
   ;; `(web-mode-css-string-face ((,class ())))
   ;; `(web-mode-css-variable-face ((,class ())))
   ;; `(web-mode-current-column-highlight-face ((,class ())))
   `(web-mode-current-element-highlight-face ((,class (:background "#8DBCEB")))) ; #EBDB76
   ;; `(web-mode-doctype-face ((,class ())))
   ;; `(web-mode-error-face ((,class ())))
   ;; `(web-mode-filter-face ((,class ())))
   `(web-mode-folded-face ((,class (:box (:line-width 1 :color "#6D6D6D") :foreground "#8E8E62" :background "#E0E043"))))
   ;; `(web-mode-function-call-face ((,class ())))
   ;; `(web-mode-function-name-face ((,class ())))
   ;; `(web-mode-html-attr-custom-face ((,class ())))
   ;; `(web-mode-html-attr-engine-face ((,class ())))
   ;; `(web-mode-html-attr-equal-face ((,class ())))
   `(web-mode-html-attr-name-face ((,class ,xml-attribute)))
   ;; `(web-mode-html-attr-value-face ((,class ())))
   ;; `(web-mode-html-entity-face ((,class ())))
   `(web-mode-html-tag-bracket-face ((,class ,xml-tag)))
   ;; `(web-mode-html-tag-custom-face ((,class ())))
   `(web-mode-html-tag-face ((,class ,xml-tag)))
   ;; `(web-mode-html-tag-namespaced-face ((,class ())))
   ;; `(web-mode-inlay-face ((,class ())))
   ;; `(web-mode-italic-face ((,class ())))
   ;; `(web-mode-javascript-comment-face ((,class ())))
   ;; `(web-mode-javascript-string-face ((,class ())))
   ;; `(web-mode-json-comment-face ((,class ())))
   ;; `(web-mode-json-context-face ((,class ())))
   ;; `(web-mode-json-key-face ((,class ())))
   ;; `(web-mode-json-string-face ((,class ())))
   ;; `(web-mode-jsx-depth-1-face ((,class ())))
   ;; `(web-mode-jsx-depth-2-face ((,class ())))
   ;; `(web-mode-jsx-depth-3-face ((,class ())))
   ;; `(web-mode-jsx-depth-4-face ((,class ())))
   ;; `(web-mode-keyword-face ((,class ())))
   ;; `(web-mode-param-name-face ((,class ())))
   ;; `(web-mode-part-comment-face ((,class ())))
   `(web-mode-part-face ((,class (:background "#EBEBCE"))))
   ;; `(web-mode-part-string-face ((,class ())))
   ;; `(web-mode-preprocessor-face ((,class ())))
   `(web-mode-script-face ((,class (:background "#DCDDDE"))))
   ;; `(web-mode-sql-keyword-face ((,class ())))
   ;; `(web-mode-string-face ((,class ())))
   ;; `(web-mode-style-face ((,class ())))
   ;; `(web-mode-symbol-face ((,class ())))
   ;; `(web-mode-type-face ((,class ())))
   ;; `(web-mode-underline-face ((,class ())))
   ;; `(web-mode-variable-name-face ((,class ())))
   ;; `(web-mode-warning-face ((,class ())))
   ;; `(web-mode-whitespace-face ((,class ())))

   `(which-func ((,class (:weight bold :slant italic :foreground "white"))))
   ;; `(which-key-command-description-face)
   ;; `(which-key-group-description-face)
   ;; `(which-key-highlighted-command-face)
   ;; `(which-key-key-face)
   `(which-key-local-map-description-face ((,class (:weight bold :background "#E0E3E8" :inherit which-key-command-description-face))))
   ;; `(which-key-note-face)
   ;; `(which-key-separator-face)
   ;; `(which-key-special-key-face)
   `(widget-button ((,class ,link)))
   `(widget-button-pressed ((,class (:foreground "red"))))
   `(widget-documentation ((,class (:foreground "green4"))))
   `(widget-field ((,class (:background "gray85"))))
   `(widget-inactive ((,class (:foreground "dim gray"))))
   `(widget-single-line-field ((,class (:background "gray85"))))
   `(woman-bold ((,class (:weight bold :foreground "#DE3838"))))
   `(woman-italic ((,class (:weight bold :slant italic :foreground "#40AF19"))))
   `(woman-symbol ((,class (:weight bold :foreground "purple"))))
   `(yas-field-debug-face ((,class (:foreground "white" :background "#991E4D"))))
   `(yas-field-highlight-face ((,class (:box (:line-width 1 :color "#797979") :foreground "black" :background "#C3CAC7"))))

   ;; `(ztreep-arrow-face ((,class ())))
   ;; `(ztreep-diff-header-face ((,class ())))
   ;; `(ztreep-diff-header-small-face ((,class ())))
   `(ztreep-diff-model-add-face ((,class (:weight bold :foreground "#007D00"))))
   `(ztreep-diff-model-diff-face ((,class (:weight bold :foreground "#003FCB"))))
   `(ztreep-diff-model-ignored-face ((,class (:strike-through t :foreground "#919191"))))
   `(ztreep-diff-model-normal-face ((,class (:foreground "#000000"))))
   ;; `(ztreep-expand-sign-face ((,class ())))
   ;; `(ztreep-header-face ((,class ())))
   ;; `(ztreep-leaf-face ((,class ())))
   ;; `(ztreep-node-face ((,class ())))

   ))

(custom-theme-set-variables 'nivaca-leuven

                            ;; highlight-sexp-mode.
                            '(hl-sexp-background-color "#DCD8D6")

                            )

;;;###autoload
(when (and (boundp 'custom-theme-load-path)
           load-file-name)
  ;; Add theme folder to `custom-theme-load-path' when installing over MELPA.
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'nivaca-leuven)

;; This is for the sake of Emacs.
;; Local Variables:
;; time-stamp-end: "$"
;; time-stamp-format: "%Y-%02m-%02d %02H:%02M"
;; time-stamp-start: "Last-Updated: "
;; End:
;;; nivaca-leuven-theme.el ends here
