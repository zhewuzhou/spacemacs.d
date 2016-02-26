;;; init-scheme.el start here

(spacemacs|defvar-company-backends scheme-mode)
(push '(company-files
         company-dabbrev
         geiser-company-backend) company-backends-scheme-mode)


(spacemacs|add-company-hook scheme-mode)

(provide 'init-scheme)

;;; init-scheme.el end here
