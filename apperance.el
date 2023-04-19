;;; apperance.el -*- lexical-binding: t; -*-

;; NOTE: Be careful, invalid doom-font configuration breaks the doom emacs.
;; (setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light))
(setq doom-font-increment 1)
;; (setq all-the-icons-scale-factor 1.2)

(setq doom-theme
      ;; nil
      ;; 'doom-one-light
      'modus-operandi
      ;; 'doom-solarized-light
      )
(if (not doom-theme)
    (load-theme 'tdsh-light))

;; Disable git gutter signs
(setq git-gutter:added-sign " ")
(setq git-gutter:deleted-sign "_")
(setq git-gutter:modified-sign " ")

;; Disable fringe bitmaps!
(define-fringe-bitmap 'git-gutter-fr:added [0] nil nil '(center repeated))
(define-fringe-bitmap 'git-gutter-fr:modified [0] nil nil '(center repeated))
(define-fringe-bitmap 'git-gutter-fr:deleted [0] nil nil '(center repeated))

;; Custom doom-themes
(custom-theme-set-faces! 'modus-operandi
  '(modus-themes-fringe-green :inherit 'modus-themes-diff-added )
  '(modus-themes-fringe-red :inherit 'modus-themes-diff-removed )
  '(modus-themes-fringe-yellow :inherit 'modus-themes-diff-changed )
  )

;; NOTE: (modeline +light) disables following configs
(setq ;; doom-modeline-major-mode-icon t
      doom-modeline-buffer-encoding nil
      doom-modeline-persp-name t
      doom-modeline-modal nil
      doom-modeline-bar-width 2 ;; NOTE: set to 0 automatically shrink mode line to minmal size
      doom-modeline-height 20
      doom-modeline-window-width-limit 60
      doom-modeline-vcs-max-length 20
      doom-modeline-mu4e nil
      doom-modeline-buffer-file-name-style 'truncate-with-project)

(custom-set-faces
 '(flycheck-warning ((t (:inherit warning)))))
