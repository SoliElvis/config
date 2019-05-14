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
    '(

        (latex :variables latex-enable-folding t latex-build-command "LatexMk")
        (shell :variables shell-default-height 30 shell-default-position 'bottom)
        auto-completion
        bibtex
        clojure
        common-lisp
        csv
        emacs-lisp
        git
        haskell
        ivy
        html
        javascript
        markdown
        org
        python
        racket
        spell-checking syntax-checking version-control
        themes-megapack
        vimscript
        yaml
        )

      dotspacemacs-additional-packages
      '(
        (org-books :location (recipe :fetcher github :repo "lepisma/org-books"))
        avy
        auth-source-pass
        creamsody-theme
        epa
        doom-themes
        drag-stuff py-autopep8 smooth-scroll julia-mode
        elpy
        engine-mode
        helm-bibtex
        ibuffer
        linum-relative
        lispy
        nlinum
        openwith
        org-agenda-property
        org-bullets
        org-download
        org-gcal
        org-caldav
        org-noter
        org-ref
        origami
        persp-mode
        powerline
        rainbow-delimiters
        smooth-scrolling
        spaceline
        visual-line-mode
        zoom-window
        zotxt
        )


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
   dotspacemacs-themes '(doom-one
                         spacegray
                         spacemacs-dark
                         spacemacs-light)
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight bold
                               :width normal
                               :powerline-scale 1.1)

   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-command-key "SPC"
   dotspacemacs-ex-command-key ":"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key ","
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
   dotspacemacs-enable-paste-transient-state nil
   dotspacemacs-which-key-delay 0.2
   dotspacemacs-which-key-position 'bottom
   dotspacemacs-loading-progress-bar t
   dotspacemacs-fullscreen-at-startup nil
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup nil
   dotspacemacs-active-transparency 90
   dotspacemacs-inactive-transparency 70
   dotspacemacs-show-transient-state-title t
   dotspacemacs-show-transient-state-color-guide t
   dotspacemacs-mode-line-unicode-symbols t
   dotspacemacs-smooth-scrolling t
   dotspacemacs-line-numbers nil
   dotspacemacs-folding-method 'origami
   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-smart-closing-parenthesis nil
   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-persistent-server nil
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   dotspacemacs-default-package-repository nil
   dotspacemacs-whitespace-cleanup t))

(defun dotspacemacs/user-init ())

(defun dotspacemacs/user-config ()

  (setq auth-source-debug t)
  (setq auth-sources
        '((:source "~/.authinfo.gpg")))
  (setq auth-source-debug t)

  (setq-default dotspacemacs-editing-style '(hybrid :variables
                                                    hybrid-mode-enable-evilified-state t
                                                    hybrid-mode-enable-hjkl-bindings t
                                                    hybrid-mode-default-state 'normal))
  (setq-default indent-tabs-mode nil)
  (setq-default tab-width 2)
  (setq c-basic-indent 2)
  (setq-default tab-width 2)
  (setq-default dotspacemacs-lines-numbers '(:relative t :size-limit-kb 1000))
  (set-frame-parameter (selected-frame) 'alpha '(100 . 90))
  (setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
  (setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
  (setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
  (setq scroll-step 1)

  (doom-themes-visual-bell-config)
  (doom-themes-neotree-config)
  (doom-themes-treemacs-config)
  (doom-themes-org-config)

  ;; basic config and bindings
  (global-set-key (kbd "C-x C-z") 'zoom-window-zoom)
  (global-set-key (kbd "C-x C-b") 'ibuffer)
  (bind-key* "C-c y" 'clipboard-yank)
  (autoload 'ibuffer "ibuffer" "List buffers." t)
  (custom-set-variables '(zoom-window-mode-line-color "DarkGreen"))
  (setq pdf-annot-activate-created-annotations t)
  (add-hook 'emacs-lisp-mode-hook 'flyspell-prog-mode) ;; Requires Ispell
  (add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
  (add-hook 'emacs-lisp-mode-hook
                (lambda ()
                  (setq indent-tabs-mode nil)
                  (define-key flyspell-mode-map "\M-\t" nil)
                  (define-key emacs-lisp-mode-map
                              "\C-x\C-e" 'pp-eval-last-sexp)
                  (define-key emacs-lisp-mode-map
                              "\r" 'reindent-then-newline-and-indent)))

  (add-hook 'emacs-lisp-mode-hook 'eldoc-mode)
  (load-file "~/.emacs.d/private/my-python.el")
  (load-file "~/.emacs.d/private/my-tex.el")
  (load-file "~/.emacs.d/private/my-org.el")
  (load-file "~/.emacs.d/private/my-engine.el")


;;------------------------------------------------
  ;; private interactive functions
  (defun toggle-maximize-buffer () "Maximize buffer"
         (interactive)
         (if (= 1 (length (window-list)))
             (jump-to-register '_)
           (progn
             (window-configuration-to-register '_)
             (delete-other-windows))))

  (defun my-expand-file-name-at-point ()
    "Use hippie-expand to expand the filename"
    (interactive)
    (let ((hippie-expand-try-functions-list
           '(try-complete-file-name-partially
             try-complete-file-name)))
      (call-interactively 'hippie-expand)))

  (global-set-key (kbd "C-M-/") 'my-expand-file-name-at-point)

  (defun org-toggle-link-display ()
    "Toggle the literal or descriptive display of links."
    (interactive)
    (if org-descriptive-links
        (progn (org-remove-from-invisibility-spec '(org-link))
               (org-restart-font-lock)
               (setq org-descriptive-links nil))
      (progn (add-to-invisibility-spec '(org-link))
             (org-restart-font-lock)
             (setq org-descriptive-links t))))

  (require 'doom-themes)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'spacegray t)
  (set-frame-font "Source Code Pro 12"  nil t)
  (set-face-attribute 'default nil
                      :family "Source Code Pro"
                      :weight 'normal
                      :width 'normal));;end config


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "93a0885d5f46d2aeac12bf6be1754faa7d5e28b27926b8aa812840fe7d0b7983" "8d805143f2c71cfad5207155234089729bb742a1cb67b7f60357fdd952044315" "6b2636879127bf6124ce541b1b2824800afc49c6ccd65439d6eb987dbf200c36" "100e7c5956d7bb3fd0eebff57fde6de8f3b9fafa056a2519f169f85199cc1c96" "c7f10959cb1bc7a36ee355c765a1768d48929ec55dde137da51077ac7f899521" "4b19d61c560a93ef90767abe513c11f236caec2864617d718aa366618133704c" "4138944fbed88c047c9973f68908b36b4153646a045648a22083bd622d1e636d" "174502267725776b47bdd2d220f035cae2c00c818765b138fea376b2cdc15eb6" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "bd7b7c5df1174796deefce5debc2d976b264585d51852c962362be83932873d9" "89f545ddc104836b27167696db89b371f23893d5b2f038d43383d877ee678d3d" default)))
 '(evil-want-Y-yank-to-eol nil)
 '(fci-rule-color "#3C3D37")
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-tail-colors
   (quote
    (("#3C3D37" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#3C3D37" . 100))))
 '(jdee-db-active-breakpoint-face-colors (cons "#1B2229" "#51afef"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#1B2229" "#98be65"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#1B2229" "#3f444a"))
 '(magit-diff-use-overlays nil)
 '(objed-cursor-color "#ff6c6b")
 '(org-agenda-files nil)
 '(package-selected-packages
   (quote
    (slime cider skewer-mode simple-httpd json-snatcher json-reformat js2-mode tern ace-window avy swiper org-plus-contrib with-editor ivy helm magit transient org-journal helm-pydoc helm-hoogle helm-gitignore helm-css-scss helm-company helm-c-yasnippet flyspell-correct-helm counsel flyspell-correct-popup doom-themes all-the-icons memoize org-caldav org-gcal creamsody-theme-theme engine-mode fzf smooth-scrolling origami flycheck yasnippet async ws-butler winum volatile-highlights vi-tilde-fringe uuidgen toc-org restart-emacs rainbow-delimiters popwin paradox open-junk-file neotree move-text lorem-ipsum link-hint indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode helm-themes helm-swoop helm-projectile helm-mode-manager helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido fill-column-indicator fancy-battery eyebrowse expand-region evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist highlight evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state evil-exchange evil-ediff evil-args evil-anzu anzu dumb-jump define-word column-enforce-mode clean-aindent-mode auto-highlight-symbol aggressive-indent adaptive-wrap ace-link ace-jump-helm-line zotxt zoom-window zenburn-theme zen-and-art-theme yapfify yaml-mode xterm-color white-sand-theme which-key wgrep web-mode web-beautify vimrc-mode use-package underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spaceline spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smooth-scroll smex smeargle slime-company slim-mode shell-pop seti-theme scss-mode sass-mode reverse-theme rebecca-theme railscasts-theme racket-mode pytest pyenv-mode py-isort py-autopep8 purple-haze-theme pug-mode professional-theme planet-theme pip-requirements phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pcre2el orgit organic-green-theme org-ref org-projectile org-present org-pomodoro org-noter org-mime org-download org-bullets org-books org-agenda-property openwith omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme nlinum naquadah-theme mustang-theme multi-term monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minimal-theme material-theme markdown-toc majapahit-theme magit-gitflow madhat2r-theme lush-theme livid-mode live-py-mode lispy linum-relative light-soap-theme julia-mode json-mode js2-refactor js-doc jbeans-theme jazz-theme ivy-hydra ir-black-theme intero inkpot-theme hy-mode hlint-refactor hindent heroku-theme hemisu-theme helm-make hc-zenburn-theme haskell-snippets gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gh-md gandalf-theme fuzzy flyspell-correct-ivy flycheck-pos-tip flycheck-haskell flx flatui-theme flatland-theme farmhouse-theme exotica-theme exec-path-from-shell evil-visualstar evil-magit evil-escape espresso-theme eshell-z eshell-prompt-extras esh-help emmet-mode elpy elisp-slime-nav drag-stuff dracula-theme django-theme diminish diff-hl darktooth-theme darkokai-theme darkmine-theme darkburn-theme dakrone-theme dactyl-mode cython-mode cyberpunk-theme csv-mode creamsody-theme counsel-projectile company-web company-tern company-statistics company-ghci company-ghc company-cabal company-auctex company-anaconda common-lisp-snippets color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized coffee-mode cmm-mode clues-theme clojure-snippets clj-refactor cider-eval-sexp-fu cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme bind-map badwolf-theme auto-yasnippet auto-dictionary auto-compile auctex-latexmk apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme ac-ispell)))
 '(python-indent-guess-indent-offset nil)
 '(python-indent-offset 2)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#F92672")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#E6DB74")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#A6E22E")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#A1EFE4")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#66D9EF"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#272822" "#3C3D37" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0")))
 '(zoom-window-mode-line-color "DarkGreen"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((((class color) (min-colors 257)) (:foreground "#F8F8F2" :background "#272822" :family "Source Code Pro" :foundry "ADBO" :slant normal :weight normal :height 120 :width normal)) (((class color) (min-colors 89)) (:foreground "#F5F5F5" :background "#1B1E1C" :family "Source Code Pro" :foundry "ADBO" :slant normal :weight normal :height 120 :width normal))))
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
