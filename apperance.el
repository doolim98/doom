;;; apperance.el -*- lexical-binding: t; -*-

;; NOTE: Be careful, invalid doom-font configuration breaks the doom emacs.
(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light))
(setq doom-font-increment 1)
(setq all-the-icons-scale-factor 1.2)

(setq doom-theme
      'doom-one-light
      ;; 'modus-operandi
      ;; 'doom-solarized-light
      )
;; Custom doom-themes
(custom-theme-set-faces! 'doom-one-light
  '(default :background "white")
  ;; '(line-number :foreground "dim gray")
  ;; '(line-number-current-line :foreground "white")
  ;; '(doom-modeline-project-dir :foreground "blue")
  ;; '(doom-modeline-buffer-path   :foreground "blue")
  ;; '(mode-line-inactive :background "dim gray" :foreground "white" :height 80)
  ;; '(mode-line :background "black" :height 80)
  ;; '(default :background "#002b36")
  )

(setq display-line-numbers-type nil)
;; (after! latex-mode
;;   (remove-hook 'latex-mode-hook #'rainbow-delimiters-mode))

(rainbow-delimiters-mode-disable)

(set-face-background 'child-frame-border "grey40")

(setq flycheck-posframe-border-width 1)

;; NOTE: (modeline +light) disables following configs
(setq ;; doom-modeline-major-mode-icon t
      doom-modeline-buffer-encoding nil
      ;; doom-modeline-persp-name t
      ;; doom-modeline-modal t
      doom-modeline-bar-width 0 ;; NOTE: set to 0 automatically shrink mode line to minmal size
      doom-modeline-height 40
      doom-modeline-window-width-limit 60
      doom-modeline-vcs-max-length 20
      doom-modeline-mu4e nil
      doom-modeline-buffer-file-name-style 'truncate-with-project)
