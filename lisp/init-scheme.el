;;; init-scheme.el start here
(require 'init-window)
(require 'xscheme)

(evil-leader/set-key-for-mode 'scheme-mode
  "eb" '(lambda ()
         (interactive)
         (if (get-buffer "*scheme*")
             (kill-buffer "*scheme*"))
         (split-window-horizontally-instead)
         (run-scheme "scheme")
         (switch-window)
         (xscheme-send-buffer)))

(provide 'init-scheme)

;;; init-scheme.el end here
