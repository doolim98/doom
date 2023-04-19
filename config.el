;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Hajeong Lim"
      user-mail-address "doolim98@gmail.com")

(load! "apperance.el")
(load! "keymap.el")
(load! "my.el")

(setq org-directory "~/org/")
(setq auto-save-default nil)

(add-to-list 'auto-mode-alist '("[Mm]akefile\..*\\'" . makefile-bsdmake-mode))
(add-to-list 'auto-mode-alist '("\\.[Mm]akefile\\'" . makefile-bsdmake-mode))

;; (setq flycheck-display-errors-delay 100000) ;; Display errors only when I want

(after! ispell
  (setq ispell-program-name "aspell"
        ispell-extra-args '("--sug-mode=ultra" "--lang=en_US")
        ispell-personal-dictionary "~/.config/doom/dictionary/.pws"
        spell-fu-directory "~/.config/doom/dictionary") ;; Please create this directory manually.
  )

(defun my/pdf-view-hook()
  ;; auto bounding
  (pdf-view-auto-slice-minor-mode 1)
  (setq auto-revert-mode t
        auto-revert-interval 2)
  )

(add-hook 'pdf-view-mode-hook 'my/pdf-view-hook)

(after! projectile
  (setq projectile-file-exists-remote-cache-expire nil)
  (setq projectile-enable-caching nil)
  ;; (setq projectile-mode-line '(:eval (format " Projectile[%s]" (projectile-project-name))))
  (setq projectile-globally-ignored-directories
        (quote (".idea" ".eunit" ".git" ".hg" ".svn" ".fslckout" ".bzr" "_darcs" ".tox" "build" "target")))
)



; ============
; REMOTE SETUP
; ============
;; GNU TRAMP Configuration
(customize-set-variable
 'tramp-ssh-controlmaster-options
 (concat
   "-o ControlPath=/tmp/ssh-ControlPath-%%r@%%h:%%p "
   "-o ControlMaster=auto -o ControlPersist=yes"))

(setq tramp-default-method "ssh"
      tramp-chunksize nil ;2000
      tramp-use-ssh-controlmaster-options t)
;; (add-to-list 'vterm-tramp-shells
;;              '("ssh" "/bin/bash"))

(after! company
  (setq company-idle-delay 0.1
        company-tooltip-margin 1))
(after! eglot
  )
(setq eldoc-last-message t)
(setq eldoc-idle-delay 0.2)
(setq eldoc-echo-area-use-multiline-p nil)
(setq max-mini-window-height 5)

;; eglot-workspace-configuration

(setq rainbow-delimiters-mode 0)

(defun my/disable-modes()
  (progn
    (setq rainbow-delimiters-mode 0)
    (message "latex hook")
    )
  )
(add-hook! Tex-mode
  'my/disable-modes
  )

(use-package! yasnippet
  :config
  (setq yas-snippet-dirs '("~/.config/doom/snippets")))

;; Latex
(setq +latex-viewers '(pdf-tools))
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

(defun my/latexmk()
  (interactive)
  (if (projectile-project-root)
      (progn
        (message "OK!")
        (projectile-run-async-shell-command-in-root  "latexmk -pvc -view=none")
        )
    (message "ERR!"))
  )
