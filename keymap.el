;;; keymap.el -*- lexical-binding: t; -*-

(defun example-fn ()
  (interactive)
    (message "example"))
(map! :g "s-[" 'previous-buffer)
(map! :g "s-]" 'next-buffer)
;; (map! :n "H" 'previous-buffer)
(map! :n "q" 'previous-buffer)
;; (map! :n "C-q" 'previous-buffer)
;; (map! :mode 'biblio :n )
