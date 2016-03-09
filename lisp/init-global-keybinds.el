;;; init-global-keybinds.el start here
(evil-leader/set-key
  ;;; don't use o, because it's the namespace of org
  ;;; making sure always using 2 chars single chars make it less flexable
  ",a" 'diff-region-tag-selected-as-a
  ",b" 'diff-region-compare-with-b
  ",c" 'avy-goto-char-2
  ",w" 'avy-goto-word-or-subword-1
  ",g" 'google-translate-at-point
  ",t" 'google-translate-query-translate-reverse
  "aA" 'helm-apropos
  "cw" 'ispell-word
  "wD" 'delete-other-windows
  "db" 'delete-all-other-buffers
  "fm" 'indent-region
  "pF" 'helm-projectile-find-file-in-known-projects
  "ps" 'spacemacs/helm-project-smart-do-search
  "nt" 'neotree-toggle
  ;;; o is for org mode
  "ds" 'delete-trailing-whitespace
  "Z"  'current-term)

(define-key evil-insert-state-map (kbd "C-y") 'helm-yas-complete)
(define-key evil-normal-state-map (kbd "C-f") 'evil-jump-forward)
(define-key evil-insert-state-map (kbd "C-f") 'evil-jump-forward)

(defun find-term-buffer ()
  (interactive)
  (car (-filter (lambda (b)
                  (eq 'term-mode (buffer-local-value 'major-mode b)))
                (buffer-list))))

;;; this is the setting for kill buffer without confirmation
;;; from http://emacs.stackexchange.com/questions/14509/kill-process-buffer-without-confirmation
(setq kill-buffer-query-functions (delq 'process-kill-buffer-query-function kill-buffer-query-functions))

(defun kill-term-window-and-process()
   (switch-to-buffer (buffer-name (find-term-buffer)))
   (term-kill-subjob)
   (kill-buffer (find-term-buffer))
  )

(defun kill-term ()
  (interactive)
  (if (find-term-buffer)
      (kill-term-window-and-process)
      )
  )



(defun current-term ()
  (interactive)
  (if (find-term-buffer)
      (switch-to-buffer (buffer-name (find-term-buffer)))
    (ansi-term (getenv "SHELL") "editing-file-root")
    ))

(provide 'init-global-keybinds)
;;; init-global-keybinds.el end here
