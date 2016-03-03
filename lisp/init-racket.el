;;; init-racket.el start here

(spacemacs/set-leader-keys-for-major-mode 'racket-mode
  "tr" 'racket-raco-test)

(spacemacs|defvar-company-backends racket-mode)
(push '(company-files
        company-dabbrev
        company-capf) company-backends-racket-mode)


(spacemacs|add-company-hook racket-mode)
(add-hook 'racket-mode-hook 'smartparens-mode)

(provide 'init-racket)

;;; init-racket.el end here
