;;; init-window.el start here

(setq-default switch-window-shortcut-style 'alphabet)
(setq-default switch-window-timeout nil)

(defun split-window-func-with-other-buffer (split-function)
  (lexical-let ((s-f split-function))
    (lambda (&optional arg)
      "Split this window and switch to the new window unless ARG is provided."
      (interactive "P")
      (funcall s-f)
      (let ((target-window (next-window)))
        (set-window-buffer target-window (other-buffer))
        (unless arg
          (select-window target-window))))))

(defun split-window-horizontally-instead ()
  (interactive)
  (save-excursion
    (delete-other-windows)
    (funcall (split-window-func-with-other-buffer 'split-window-horizontally))))

(defun split-window-vertically-instead ()
  (interactive)
  (save-excursion
    (delete-other-windows)
    (funcall (split-window-func-with-other-buffer 'split-window-vertically))))


(provide 'init-window)
;;; init-window.el ends here
