;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs) dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/') dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; common tools
     osx shell
         gtags
         ; git
         ; semantic
         ; restclient
         ; search-engine
         (ibuffer :variables ibuffer-group-buffers-by'projects)
         (ranger :variables ranger-show-preview
                 t)
         ;; ----------------------------------------------------------------
         ;; common editing support
         (auto-completion :variables auto-completion-enable-snippets-in-popup
                          t
                          auto-completion-enable-sort-by-usage
                          t
                          auto-completion-enable-help-tooltip
                          t
                          haskell-completion-backend)
         spell-checking
         syntax-checking
         better-defaults
         ;; ----------------------------------------------------------------
     ;;; lang lisp family
         emacs-lisp
         (haskell :variables haskell-process-type'stack-ghci
                  haskell-enable-hindent-style "johan-tibell")
         racket
         ;; clojure
         ;; common-lisp
         ;; ----------------------------------------------------------------
     ;;; main langs
         ;; c-c++
         ;; swift
         (python :variables python-test-runner 'pytest
                 python-enable-yapf-format-on-save t
                 python-sort-imports-on-save t)
         ;; scala
         ;; ruby
         ;; go
         ;; erlang
         ;; react
         ;; javascript
         ;; typescript
         shell-scripts
         ;; windows-scripts
         sql
         ;; html
         ;; ----------------------------------------------------------------
     ;;; misc langs
         yaml
         markdown
         (org :variables org-enable-github-support t)
  )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages
   '(anki-editor
     solidity-mode
     fcitx)
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages
   '(linum-relative)
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages
   t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t) dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository. dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. (default t)
   dotspacemacs-check-for-update
   nil
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style
   'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading
   nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner
   'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists
   '(recents projects)
   ;; Number of recent files to show in the startup buffer. Ignored if
   ;; `dotspacemacs-startup-lists' doesn't include `recents'. (default 5)
   dotspacemacs-startup-recent-list-size
   5
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode
   'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes
   '(spacemacs-dark sanityinc-solarized-light
                    spacemacs-light solarized-light solarized-dark
                    leuven monokai zenburn)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state
   t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font
   '("Source Code Pro" :size 13
     :weight normal
     :width normal
     :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key
   ","
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key
   "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key
   "SPC"
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key
   "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab
   nil
   ;; (Not implemented) dotspacemacs-distinguish-gui-ret nil
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key
   ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$
   t
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name
   "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout
   nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts
   nil
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location
   'original
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots
   5
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido
   nil
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize
   nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header
   nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position
   'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state
   nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay
   0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position
   'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar
   t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup
   nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native
   nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup
   nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency
   90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency
   90
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols
   t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling
   t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers '(t
                               :disabled-for-modes org-mode
                                                   markdown-mode
                              )
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode
   1
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters
   'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server
   nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools
   '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository
   nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup
   nil))

(defun dotspacemacs/user-init ()
  (setq srecode-map-save-file "~/.spacemacs.d/srecode-map.el")
  ;; (setq configuration-layer--elpa-archives
  ;;       '(("melpa-cn" . "http://elpa.emacs-china.org/melpa/")
  ;;         ("org-cn"   . "http://elpa.emacs-china.org/org/")
  ;;         ("gnu-cn"   . "http://elpa.emacs-china.org/gnu/")))
  "Initialization function for user code.
  It is called immediately after `dotspacemacs/init'.  You are free to put almost
  any user code here.  The exception is org related code, which should be placed
in `dotspacemacs/user-con fig'.")
(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration. You are free to put any user code."
  ;; This is temp fix for can not create file very dirty fix, need to clean up at some stage
  ;; From long term perspective, make spacemacs thiner would be the solution
  (require 'helm-bookmark)
  (setq markdown-command "/usr/local/bin/kramdown")
  (setq google-translate-default-source-language
        "en")
  (setq google-translate-default-target-language
        "zh-CN")
  (setq python-fill-column 99)
  (setq auto-save-timeout 5)
  (setq create-lockfiles nil)
  (global-company-mode 1)
  (global-evil-matchit-mode 1)
  (global-evil-surround-mode 1)
  (add-to-list 'load-path
               (expand-file-name "lisp" "~/.spacemacs.d/"))
  (add-to-list 'exec-path "~/.local/bin/")
  (add-hook 'ess-mode-hook
            (lambda ()
              (ess-toggle-underscore nil)))
  ;; fcitx setup
  (setq fcitx-active-evil-states '(insert emacs vim))
  (fcitx-aggressive-setup)
  (fcitx-prefix-keys-add "M-m")

  (require 'init-linum)
  (with-eval-after-load 'org
    (require 'init-org))
  (require 'init-global-keybinds)
  (require 'init-project)
  (require 'init-haskell)
  (require 'init-racket)
  (require 'init-web)
  (require 'init-diff))
  ;; Make sure the following comes before `(fcitx-aggressive-setup)'
  ;(setq fcitx-active-evil-states '(insert emacs vim)) ; if you use hybrid mode
  ;(fcitx-aggressive-setup)
  ;(fcitx-prefix-keys-add "M-m") ; M-m is common in Spacemacs

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (anki-editor youdao-dictionary names chinese-word-at-point pangu-spacing find-by-pinyin-dired fcitx ace-pinyin pinyinlib winum fuzzy unfill org-category-capture slime-company pug-mode alert log4e gntp mmm-mode minitest skewer-mode simple-httpd insert-shebang parent-mode hide-comnt request gitignore-mode flyspell-correct flx anzu evil goto-chg ctable magit-popup json-snatcher json-reformat diminish web-completion-data pos-tip ghc peg eval-sexp-fu seq pkg-info epl inf-ruby bind-map bind-key packed anaconda-mode pythonic avy auto-complete popup go-mode yasnippet company org go-guru highlight async yaml-mode dash dockerfile-mode docker tablist docker-tramp package-build tide typescript-mode which-key web-mode toc-org swift-mode spaceline slime sass-mode ruby-test-mode robe ranger racket-mode pip-requirements persp-mode paradox org-plus-contrib neotree move-text macrostep less-css-mode js2-refactor helm-projectile helm-ag ggtags fish-mode evil-unimpaired evil-mc eshell-prompt-extras erlang ensime sbt-mode company-tern cmake-mode clj-refactor clang-format cider clojure-mode auto-yasnippet ansible-doc ace-window ace-link ess julia-mode iedit smartparens undo-tree helm helm-core haskell-mode flycheck markdown-mode projectile magit git-commit with-editor f js2-mode s hcl-mode yapfify xterm-color ws-butler window-numbering web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package terraform-mode tern tagedit stickyfunc-enhance srefactor sql-indent spinner spacemacs-theme smeargle slim-mode shell-pop scss-mode scala-mode salt-mode rvm ruby-tools rubocop rspec-mode reveal-in-osx-finder restclient restart-emacs rbenv rake rainbow-delimiters queue quelpa pyvenv pytest pyenv-mode py-isort puppet-mode powershell powerline popwin pcre2el pbcopy paredit ox-gfm osx-trash osx-dictionary orgit org-projectile org-present org-pomodoro org-download org-bullets open-junk-file ob-http noflet mwim multiple-cursors multi-term markdown-toc magit-gitflow lorem-ipsum livid-mode live-py-mode link-hint launchctl json-mode js-doc jinja2-mode jade-mode intero info+ inflections indent-guide ido-vertical-mode ibuffer-projectile hydra hy-mode hungry-delete htmlize hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers highlight-indentation help-fns+ helm-themes helm-swoop helm-pydoc helm-mode-manager helm-make helm-hoogle helm-gtags helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet haskell-snippets haml-mode google-translate golden-ratio go-eldoc gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md flyspell-correct-helm flycheck-pos-tip flycheck-haskell flx-ido fill-column-indicator fancy-battery faceup eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu ess-smart-equals ess-R-object-popup ess-R-data-view eshell-z esh-help engine-mode emmet-mode elisp-slime-nav edn dumb-jump disaster dash-functional cython-mode company-web company-statistics company-shell company-quickhelp company-go company-ghci company-ghc company-cabal company-c-headers company-anaconda common-lisp-snippets column-enforce-mode color-theme-sanityinc-solarized coffee-mode cmm-mode clojure-snippets clean-aindent-mode cider-eval-sexp-fu chruby bundler auto-highlight-symbol auto-dictionary auto-compile ansible aggressive-indent adaptive-wrap ace-jump-helm-line ac-ispell)))
 '(safe-local-variable-values (quote ((no-byte-compile t)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
