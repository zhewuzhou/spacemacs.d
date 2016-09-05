;;; init-haskell start here

(spacemacs/set-leader-keys-for-major-mode 'haskell-mode
  "p" 'hindent-reformat-buffer) ;;; stands for pretty

(provide 'init-haskell)
;;; init-haskell end here
