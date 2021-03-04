;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!  


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
;;(user-full-name "John Doe"
;;    user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "JetBrainsMono" :size 14))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

(load! "bindings")
;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.

;; Haskell
(defun format-haskell-on-save ()
  "Function formats haskell buffer with brittany on save."
  (when (eq major-mode 'haskell-mode)
    (shell-command-to-string (format "brittany --write-mode inplace %s" buffer-file-name))))

(add-hook 'after-save-hook #'format-haskell-on-save)
(add-hook 'after-save-hook #'revert-buffer)
;; Rust
(defun format-rust-on-save ()
  "Function formats rust buffer with rustfmt on save."
  (when (eq major-mode 'rustic-mode)
    (rust-format-buffer)))

(add-hook 'after-save-hook #'format-rust-on-save)

;; Scrolling
;;(setq mouse-wheel-scroll-amount '(5 ((shift) . 5)))
;;(require 'sublimity)
;;(require 'sublimity-scroll)
;;(sublimity-mode 1)
;; (setq sublimity-scroll-weight 2
;;      sublimity-scroll-drift-length 2)


;; Modeline (the bar on the bottom of each buffer)
(setq doom-modeline-height 1)
(set-face-attribute 'mode-line nil :family "JetBrainsMono" :height 100)
(set-face-attribute 'mode-line-inactive nil :family "JetBrainsMono" :height 100)
