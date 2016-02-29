;;; init-global-keybinds.el start here
(evil-leader/set-key
  ;;; don't use o, because it's the namespace of org
  ;;; making sure always using 2 chars single chars make it less flexable
  "aa" 'avy-goto-char-2
  "aA" 'helm-apropos
  "cw"  'ispell-word
  "dw" 'delete-other-windows
  "db" 'delete-all-other-buffers
  "fm" 'indent-region
  "pF" 'helm-projectile-find-file-in-known-projects
  "nt" 'neotree-toggle
  ;;; o is for org mode
  "ds" 'delete-trailing-whitespace
  "Z"  'current-term)

(define-key evil-insert-state-map (kbd "C-y") 'helm-yas-complete)

(defun find-term-buffer ()
  (interactive)
  (car (-filter (lambda (b)
                  (eq 'term-mode (buffer-local-value 'major-mode b)))
                (buffer-list))))

;;; this is the setting for kill buffer without confirmation
;;; from http://emacs.stackexchange.com/questions/14509/kill-process-buffer-without-confirmation
(setq kill-buffer-query-functions (delq 'process-kill-buffer-query-function kill-buffer-query-functions))

(defun kill-term ()
  (interactive)
  (if (find-term-buffer)
      (kill-buffer (find-term-buffer)))
  )

(defun current-term ()
  (interactive)
  (if (find-term-buffer)
      (switch-to-buffer (buffer-name (find-term-buffer)))
    (ansi-term (getenv "SHELL") "editing-file-root")
    ))

(provide 'init-global-keybinds)
;;; init-global-keybinds.el end here