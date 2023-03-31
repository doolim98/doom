;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Hajeong Lim"
      user-mail-address "doolim98@gmail.com")

(load! "apperance.el")
(load! "keymap.el")

(setq org-directory "~/org/")

;; (setq flycheck-display-errors-delay)

(after! ispell
  (setq ispell-program-name "aspell"
        ispell-extra-args '("--sug-mode=ultra" "--lang=en_US")
        ispell-personal-dictionary "~/.config/doom/dictionary/.pws"
        spell-fu-directory "~/.config/doom/dictionary") ;; Please create this directory manually.
  )

(defun my/pdf-view-hook()
  ;; (setq auto-revert-mode 1
  ;;       auto-revert-interval 1)
  ;; auto bounding
  (pdf-view-auto-slice-minor-mode 1)
  )

(add-hook 'pdf-view-mode-hook 'my/pdf-view-hook)


;; GNU TRAMP Configuration
(setq tramp-default-method "ssh"
      ;; tramp-terminal-type "tramp"                        ; Let other terminal know what client I'm connecting with (might need to configure server)
      ;; tramp-auto-save-directory "$XDG_CACHE_HOME/tramp/" ; Send Tramp info into XDG Cache directory on machine
      tramp-chunksize 2000)                              ; Resonable Chunk size for speed and disk space in mind

(after! company
  (setq company-idle-delay 0.1
        company-tooltip-margin 1))

(use-package! yasnippet
  :config
  (setq yas-snippet-dirs '("~/.config/doom/snippets")))

;; Latex
(setq +latex-viewers '(pdf-tools))
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys

(defun my/latexmk()
  (interactive)
  (if (projectile-project-root)
      (progn
        (message "OK!"))
    (message "ERR!"))
  ;; (projectile-run-async-shell-command-in-root  "latexmk -pvc -view=none")
  )
