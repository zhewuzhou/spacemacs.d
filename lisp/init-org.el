;;; init-org.el org plus evil

(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))
(require 'init-org-agenda)
(require 'init-org-capture)

(defun my/org-archive-done-tasks ()
  (interactive)
  (org-map-entries 'org-archive-subtree "/DONE" 'file))


(add-hook 'org-capture-mode-hook
          (lambda ()
            (evil-insert-state)))

(spacemacs/set-leader-keys-for-major-mode
  'org-mode "A" 'my/org-archive-done-tasks "C"
  'org-todo)

(add-hook 'org-mode-hook
          (lambda ()
            (define-key org-mode-map (kbd "C-]") 'org-insert-heading)
            (setq truncate-lines nil)
            (auto-fill-mode)
            (flyspell-mode)))

;;; states and faces
(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "DOING(n)" "|" "DONE(d)")
              (sequence "BLOCKED(b@/!)" "REVIEW(r@/!)" "|" "CANCELLED(c@/!)" "PHONE" "MEETING"))))

(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "red" :weight bold)
              ("DOING" :foreground "blue" :weight bold)
              ("DONE" :foreground "forest green" :weight bold)
              ("BLOCKED" :foreground "orange" :weight bold)
              ("REVIEW" :foreground "magenta" :weight bold)
              ("CANCELLED" :foreground "forest green" :weight bold)
              ("MEETING" :foreground "forest green" :weight bold)
              ("PHONE" :foreground "forest green" :weight bold))))

;;; org tags
(setq org-tag-alist (quote ((:startgroup)
                            ("@office" . ?o)
                            ("@home" . ?h)
                            (:endgroup)
                            (:startgroup)
                            ("FIRE" . ?f)
                            ("SMOKE" . ?s)
                            (:endgroup)
                            (:startgroup)
                            ("HABIT" . ?H)
                            ("MANAGEMENT" . ?m)
                            ("INFLUENCE" . ?I)
                            ("PRODUCTIVE" . ?P)
                            (:endgroup)
                            (:startgroup)
                            ("DATA" . ?D)
                            ("LANG" . ?L)
                            ("OS" . ?S)
                            ("THEORY" . ?T)
                            (:endgroup)
                            ("BLOG" . ?B))))

;;; Allow setting single tags without the menu
(setq org-fast-tag-selection-single-key (quote expert))

;;; For tag searches ignore tasks with scheduled and deadline dates
(setq org-agenda-tags-todo-honor-ignore-options t)

;;; Set up agenda files location
(setq org-agenda-files (quote ("~/my-gtd")))

;;; Set default options for open a org file as conent which not too details as well as not too brief
(setq org-startup-folded 'content)

(provide 'init-org)
;;; init-org.el ends here
