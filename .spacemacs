;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

;;*
(defun dotspacemacs/layers ()           ;
  (setq-default dotspacemacs-distribution
    'spacemacs-base dotspacemacs-enable-lazy-Installation
    'unused dotspacemacs-ask-for-lazy-installation t
     dotspacemacs-configuration-layer-path '()

    ;; List of configuration layers to load.
    dotspacemacs-configuration-layers
      '(ivy
        git
        auto-completion themes-megapack org
        python
        emacs-lisp
        vimscript
        markdown
        racket
        clojure
        common-lisp
        haskell
        spell-checking syntax-checking version-control
        (shell :variables shell-default-height 30 shell-default-position 'bottom))

      dotspacemacs-additional-packages
        '(rainbow-delimiters
          smooth-scrolling
          drag-stuff py-autopep8 smooth-scroll julia-mode
          zoom-window
          lispy
          org-bullets
          visual-line-mode
          variable-pitch-mode
          persp-mode
          ibuffer)


      dotspacemacs-frozen-packages '() dotspacemacs-excluded-packages '()
      dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  (setq-default
   dotspacemacs-elpa-https t
   dotspacemacs-elpa-timeout 5
   dotspacemacs-check-for-update nil
   dotspacemacs-elpa-subdirectory nil
   dotspacemacs-editing-style 'vim
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner 'official
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   dotspacemacs-startup-buffer-responsive t
   dotspacemacs-scratch-mode 'text-mode
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)

   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-command-key "SPC"
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   dotspacemacs-distinguish-gui-tab nil
   dotspacemacs-remap-Y-to-y$ nil
   dotspacemacs-retain-visual-state-on-shift t
   dotspacemacs-visual-line-move-text nil
   dotspacemacs-ex-substitute-global nil
   dotspacemacs-default-layout-name "Default"
   dotspacemacs-display-default-layout nil
   dotspacemacs-auto-resume-layouts nil
   dotspacemacs-large-file-size 1
   dotspacemacs-auto-save-file-location 'cache
   dotspacemacs-max-rollback-slots 5
   dotspacemacs-helm-resize nil
   dotspacemacs-helm-no-header nil
   dotspacemacs-helm-position 'bottom
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil))

(defun dotspacemacs/user-init ())

(defun dotspacemacs/user-config ()
  (bind-key* "C-c =" 'text-scale-increase)
  (bind-key* "C-c -" 'text-scale-decrease)
  (bind-key* "C-c y" 'clipboard-yank)

  (setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
  (setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
  (setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
  (setq scroll-step 1)

  (setq-default tab-width 2)
  (setq-default python-indent-offset 2)

  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
  (load-theme 'gruvbox-dark-medium)
  (autoload 'ibuffer "ibuffer" "List buffers." t)
  (add-to-list 'default-frame-alist '(alpha . (85 . 60)))
  (drag-stuff-global-mode 1)
  (drag-stuff-define-keys)

  (global-set-key (kbd "C-x C-z") 'zoom-window-zoom)
  (custom-set-variables '(zoom-window-mode-line-color "DarkGreen"))
  (global-set-key (kbd "C-M-/") 'my-expand-file-name-at-point)
  (global-set-key (kbd "C-x C-b") 'ibuffer)
  (set-frame-font "Iosevka 12" nil t)
  (set-frame-font "Inconsolata 12" nil t)
  (set-frame-parameter (selected-frame) 'alpha '(90 .60))

  (defun my-expand-file-name-at-point ()
    "Use hippie-expand to expand the filename"
    (interactive)
    (let ((hippie-expand-try-functions-list
                                            '(try-complete-file-name-partially
                                              try-complete-file-name)))
          (call-interactively 'hippie-expand)))


  ;; Org Mode
  (defun org-get-keyword (key)
    (org-element-map (org-element-parse-buffer 'element) 'keyword
      (lambda (k)
        (when (string= key (org-element-property :key k))
          (org-element-property :value k))))))

  (setq org-hide-emphasis-markers t)
  (font-lock-add-keywords 'org-mode
                          '(("^ *\\([-]\\) "
                           (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))
  (use-package org-bullets
    :config
    (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

  (let* ((variable-tuple
          (cond ((x-list-fonts   "Source Sans Pro") '(:font   "Source Sans Pro"))
                ((x-list-fonts   "Lucida Grande")   '(:font   "Lucida Grande"))
                ((x-list-fonts   "Verdana")         '(:font   "Verdana"))
                ((x-family-fonts "Sans Serif")      '(:family "Sans Serif"))
                (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
        (base-font-color (face-foreground 'default nil 'default))
        (headline       `(:inherit default :weight bold :foreground ,base-font-color)))

    (custom-theme-set-faces
      'user
        `(org-level-8        ((t (,@headline ,@variable-tuple))))
        `(org-level-7        ((t (,@headline ,@variable-tuple))))
        `(org-level-6        ((t (,@headline ,@variable-tuple))))
        `(org-level-5        ((t (,@headline ,@variable-tuple))))
        `(org-level-4        ((t (,@headline ,@variable-tuple :height 1.1))))
        `(org-level-3        ((t (,@headline ,@variable-tuple :height 1.25))))
        `(org-level-2        ((t (,@headline ,@variable-tuple :height 1.5))))
        `(org-level-1        ((t (,@headline ,@variable-tuple :height 1.70))))
        `(org-document-title ((t (,@headline ,@variable-tuple :height 2.0 :underline nil))))))

  (custom-theme-set-faces
    'user
    '(variable-pitch ((t (:family "Source Sans Pro" :height 180 :weight light))))
    '(fixed-pitch ((t ( :family "Inconsolata" :slant normal :weight normal :height 1.0 :width normal)))))

  (add-hook 'org-mode-hook 'variable-pitch-mode)
  (add-hook 'org-mode-hook 'visual-line-mode)
  (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

;;(variable-pitch ((t (:family "Source Sans Pro" :height 160 :weight light))))
;;(org-startup-indented t)
;;(variable-pitch ((t (:family "Avenir Next" :height 160 :weight light))))
;;(fixed-pitch ((t (:family "Inconsolata"))))
;;(org-indent ((t (:inherit (org-hide fixed-pitch)))))

;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("8f97d5ec8a774485296e366fdde6ff5589cf9e319a584b845b6f7fa788c9fa9a" default)))
 '(evil-want-Y-yank-to-eol nil)
 '(package-selected-packages
   (quote
    (counsel flycheck swiper ivy magit ws-butler winum volatile-highlights vi-tilde-fringe uuidgen toc-org spaceline powerline restart-emacs request popwin paradox open-junk-file neotree move-text lorem-ipsum linum-relative link-hint indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-projectile helm-mode-manager helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido fill-column-indicator fancy-battery eyebrowse expand-region evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist highlight evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state evil-exchange evil-ediff evil-args evil-anzu anzu dumb-jump define-word column-enforce-mode clean-aindent-mode auto-highlight-symbol aggressive-indent adaptive-wrap ace-link ace-jump-helm-line zoom-window zenburn-theme zen-and-art-theme yapfify xterm-color white-sand-theme which-key wgrep vimrc-mode use-package underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smooth-scroll smex smeargle slime-company shell-pop seti-theme reverse-theme rebecca-theme rainbow-delimiters railscasts-theme racket-mode pyvenv pytest pyenv-mode py-isort py-autopep8 purple-haze-theme professional-theme planet-theme pip-requirements phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pcre2el orgit organic-green-theme org-projectile org-present org-pomodoro org-mime org-download org-bullets omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme naquadah-theme mustang-theme multi-term monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minimal-theme material-theme markdown-toc majapahit-theme magit-gitflow madhat2r-theme lush-theme live-py-mode lispy light-soap-theme julia-mode jbeans-theme jazz-theme ivy-hydra ir-black-theme intero inkpot-theme hy-mode htmlize hlint-refactor hindent heroku-theme hemisu-theme helm-make hc-zenburn-theme haskell-snippets gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gh-md gandalf-theme fuzzy flyspell-correct-ivy flycheck-pos-tip flycheck-haskell flx flatui-theme flatland-theme farmhouse-theme exotica-theme exec-path-from-shell evil-visualstar evil-magit evil-escape espresso-theme eshell-z eshell-prompt-extras esh-help elisp-slime-nav drag-stuff dracula-theme django-theme diminish diff-hl darktooth-theme darkokai-theme darkmine-theme darkburn-theme dakrone-theme dactyl-mode cython-mode cyberpunk-theme counsel-projectile company-statistics company-ghci company-ghc company-cabal company-anaconda common-lisp-snippets color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized cmm-mode clues-theme clojure-snippets clj-refactor cider-eval-sexp-fu cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme bind-map badwolf-theme auto-yasnippet auto-dictionary auto-compile apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme ac-ispell)))
 '(zoom-window-mode-line-color "DarkGreen"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fixed-pitch ((t (:family "Inconsolata" :slant normal :weight normal :height 1.0 :width normal))))
 '(org-document-title ((t (:inherit default :weight bold :foreground "#b2b2b2" :family "Sans Serif" :height 2.0 :underline nil))))
 '(org-level-1 ((t (:inherit default :weight bold :foreground "#b2b2b2" :family "Sans Serif" :height 1.7))))
 '(org-level-2 ((t (:inherit default :weight bold :foreground "#b2b2b2" :family "Sans Serif" :height 1.5))))
 '(org-level-3 ((t (:inherit default :weight bold :foreground "#b2b2b2" :family "Sans Serif" :height 1.25))))
 '(org-level-4 ((t (:inherit default :weight bold :foreground "#b2b2b2" :family "Sans Serif" :height 1.1))))
 '(org-level-5 ((t (:inherit default :weight bold :foreground "#b2b2b2" :family "Sans Serif"))))
 '(org-level-6 ((t (:inherit default :weight bold :foreground "#b2b2b2" :family "Sans Serif"))))
 '(org-level-7 ((t (:inherit default :weight bold :foreground "#b2b2b2" :family "Sans Serif"))))
 '(org-level-8 ((t (:inherit default :weight bold :foreground "#b2b2b2" :family "Sans Serif"))))
 '(variable-pitch ((t (:family "Source Sans Pro" :height 180 :weight light)))))
