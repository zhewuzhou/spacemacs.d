;;; init org capture stuff

(defun open-org-file (path)
  (find-file-other-window path))

(defun capture-org-work ()
  (interactive)
  (open-org-file "~/Dropbox/org/work.org"))

(defun capture-org-notes ()
  (interactive)
  (open-org-file "~/Dropbox/org/notes.org"))

(defun capture-org-home ()
  (interactive)
  (open-org-file "~/Dropbox/org/home.org"))

(defun capture-org-vault ()
  (interactive)
  (open-org-file "~/Dropbox/org/vault.gpg"))

(defun capture-org-agenda (split)
  (interactive "P")
  (org-agenda-list)
  (when (not split)
    (delete-other-windows)))

(define-key global-map (kbd "C-c c") (lambda () (interactive) (org-capture nil "t")))
(define-key global-map (kbd "C-c n") 'capture-org-notes)
(define-key global-map (kbd "C-c h") 'capture-org-home)
(define-key global-map (kbd "C-c v") 'capture-org-vault)
(define-key global-map (kbd "C-c w") 'capture-org-work)
(define-key global-map (kbd "C-c a") 'capture-org-agenda)

; org remember stuff
(setq org-agenda-text-search-extra-files '(agenda-archives))
(setq org-directory "~/Dropbox/org")
(setq org-default-notes-file "~/Dropbox/org/tasks.org")

;; Capture templates for: TODO tasks, Notes, appointments, phone calls, meetings, and org-protocol
(setq org-capture-templates
      (quote (("t" "todo" entry (file "~/Dropbox/org/tasks.org")
               "* TODO %?\n%U\n%a\n" :clock-in t :clock-resume t)
              ("r" "respond" entry (file "~/Dropbox/org/tasks.org")
               "* DOING Respond to %:from on %:subject\nSCHEDULED: %t\n%U\n%a\n" :clock-in t :clock-resume t :immediate-finish t)
              ("n" "note" entry (file "~/Dropbox/org/notes.org")
               "* %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)
              ("j" "Journal" entry (file+datetree "~/Dropbox/org/tasks.org")
               "* %?\n%U\n" :clock-in t :clock-resume t)
              ("w" "org-protocol" entry (file "~/Dropbox/org/tasks.org")
               "* TODO Review %c\n%U\n" :immediate-finish t)
              ("m" "Meeting" entry (file "~/Dropbox/org/meeting.org")
               "* MEETING with %? :MEETING:\n%U" :clock-in t :clock-resume t)
              ("p" "Phone call" entry (file "~/Dropbox/org/phone.org")
               "* PHONE %? :PHONE:\n%U" :clock-in t :clock-resume t)
              ("h" "Habit" entry (file "~/Dropbox/org/tasks.org")
               "* DOING %?\n%U\n%a\nSCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a .+1d/3d>>\")\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:END:\n"))))

(setq org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9))))

(setq org-refile-use-outline-path t)
(setq org-outline-path-complete-in-steps nil)
(setq org-refile-allow-creating-parent-nodes (quote confirm))
(defun my/verify-refile-target ()
    "Exclude todo keywords with a done state from refile targets"
      (not (member (nth 2 (org-heading-components)) (quote "DONE")))) ;Note - "org-done-keywords"?

(setq org-refile-target-verify-function 'my/verify-refile-target)

(provide 'init-org-capture)
;;; init-org.el ends here
