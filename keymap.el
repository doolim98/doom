;;; keymap.el -*- lexical-binding: t; -*-

(defun example-fn ()
  (interactive)
    (message "example"))
(map! :g "s-[" 'evil-prev-buffer)
(map! :n "H" 'evil-prev-buffer)
(map! :n "L" 'evil-next-buffer)
(map! :g "s-]" 'evil-next-buffer)
(map! :mode 'flycheck :n "TAB" 'flycheck-display-error-at-point)
;; (map! :n "H" 'previous-buffer)
(map! :n "q" 'kill-current-buffer)
(map! :n "gr" '+lookup/references)
;; (map! :mode 'biblio :n )
