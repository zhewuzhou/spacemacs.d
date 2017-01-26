;;; init-project.el start here

(require 'neotree)

(setq neo-show-hidden-files nil)

(setq projectile-switch-project-action '(lambda()
                                          (interactive)
                                          (neotree-projectile-action)
                                          (neotree-hide)
                                          (kill-term)
                                          (projectile-find-file)))


(provide 'init-project)
;;; init-project.el end here
