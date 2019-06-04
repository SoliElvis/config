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

          (latex :variables latex-enable-folding t )
          (shell :variables shell-default-height 30 shell-default-position 'bottom)
          auto-completion
          bibtex
          clojure
          common-lisp
          csv
          dash
          emacs-lisp
        git
        haskell
        html
        ivy
        javascript
        markdown
        org
        python
        racket
        rust
        spell-checking
        swift
        syntax-checking
        themes-megapack
        version-control
        vimscript
        yaml
        )

      dotspacemacs-additional-packages
      '(
        (org-books :location (recipe :fetcher github :repo "lepisma/org-books"))
        avy
        org-journal
        sudo-edit
        dash
        auth-source-pass
        creamsody-theme
        magit
        auth-source-pass
        mpdel
        creamsody-theme
        nord-theme
        epa
        doom-themes
        drag-stuff py-autopep8 smooth-scroll julia-mode
        elpy
        engine-mode
        helm-bibtex
        ibuffer
        interleave
        linum-relative
        lispy
        nlinum
        openwith
        org-agenda-property
        org-bullets
        org-download
        org-gcal
        org-caldav
        org-cliplink
        org-noter
        org-ref
        origami
        persp-mode
        powerline
        pdf-tools
        rainbow-delimiters
        smooth-scrolling
        spaceline
        visual-line-mode
        yafolding
        zoom-window
        ace-window
        windmove
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
    dotspacemacs-editing-style 'hybrid


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
  (add-to-list 'load-path "~/.emacs.d/private/julia-emacs/")
  (require 'julia-mode)
  (bind-key "C-j" 'evil-window-down)
  (bind-key "C-h" 'evil-window-left)
  (bind-key "C-k" 'evil-window-up)
  (bind-key "C-l" 'evil-window-right)
  (bind-key* "C-c y" 'clipboard-yank)
  (global-unset-key (kbd "C-x C-z"))
  (setq auth-source-debug t)
  (setq auth-sources '((:source "~/.authinfo.gpg")))


  (setq-default dotspacemacs-editing-style '(hybrid :variables
                                                    hybrid-mode-enable-evilified-state t
                                                    hybrid-mode-enable-hjkl-bindings t
                                                    hybrid-mode-default-state 'normal))
  (setq-default indent-tabs-mode nil)
  (setq-default tab-width 2)
  (setq c-basic-indent 2)
  (setq-default dotspacemacs-lines-numbers '(:relative t :size-limit-kb 1000))
  (set-frame-parameter (selected-frame) 'alpha '(100 . 90))
  (setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
  (setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
  (setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
  (setq scroll-step 1)

  ;; basic config and bindings
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



;; (setq org-latex-pdf-process (list "latexmk -shell-escape -bibtex -f -pdf %f"))
  (require 'org-tempo)
  (setq x-select-enable-clipboard t)
  (require 'doom-themes)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-molokai t)
  (doom-themes-org-config)
  (doom-themes-visual-bell-config)
  ;; (require 'virtualenvwrapper)
  ;; (venv-initialize-interactive-shells)
  ;; (setq venv-location "home/sole/.virtualenvs")
  (load-file "~/.emacs.d/private/my-org.el")
  (load-file "~/.emacs.d/private/my-python.el")
  (load-file "~/.emacs.d/private/my-tex.el")
  (load-file "~/.emacs.d/private/my-engine.el")
  ;; (load-file "~/.emacs.d/private/my-flyspell.el")
  (load-file "~/.emacs.d/private/my-functions.el"))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("a8c210aa94c4eae642a34aaf1c5c0552855dfca2153fa6dd23f3031ce19453d4" "6d589ac0e52375d311afaa745205abb6ccb3b21f6ba037104d71111e7e76a3fc" "d2e9c7e31e574bf38f4b0fb927aaff20c1e5f92f72001102758005e53d77b8c9" default)))
 '(doom-modeline-mode t)
 '(evil-want-Y-yank-to-eol nil)
 '(org-journal-date-format "%e %b %Y (%A)" t)
 '(org-journal-dir "~/.personal/journal/" t)
 '(org-journal-enable-encryption t t)
 '(org-journal-file-format "%Y%m%d" t)
 '(org-journal-time-format "" t)
 '(package-selected-packages
   (quote
    (org-journal parseclj projectile helm-core slime ivy doom-modeline doom zotxt zoom-window zenburn-theme zen-and-art-theme zeal-at-point yapfify yaml-mode yafolding xterm-color white-sand-theme which-key wgrep web-mode web-beautify vimrc-mode use-package underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme toml-mode tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit swift-mode sunny-day-theme sudo-edit sublime-themes subatomic256-theme subatomic-theme spaceline spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smooth-scrolling smooth-scroll smex smeargle slime-company slim-mode shell-pop seti-theme scss-mode sass-mode reverse-theme rebecca-theme rainbow-delimiters railscasts-theme racket-mode racer pytest pyenv-mode py-isort py-autopep8 purple-haze-theme pug-mode professional-theme planet-theme pip-requirements phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pcre2el origami orgit organic-green-theme org-ref org-projectile org-present org-pomodoro org-noter org-mime org-gcal org-download org-cliplink org-caldav org-bullets org-books org-agenda-property openwith omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme nord-theme noctilux-theme nlinum naquadah-theme mustang-theme multi-term mpdel monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minimal-theme material-theme markdown-toc majapahit-theme magit-gitflow madhat2r-theme lush-theme livid-mode live-py-mode lispy linum-relative light-soap-theme julia-mode json-mode js2-refactor js-doc jbeans-theme jazz-theme ivy-hydra ir-black-theme intero interleave inkpot-theme hy-mode hlint-refactor hindent heroku-theme hemisu-theme helm-make hc-zenburn-theme haskell-snippets gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gh-md gandalf-theme fuzzy flyspell-correct-ivy flycheck-rust flycheck-pos-tip flycheck-haskell flx flatui-theme flatland-theme farmhouse-theme exotica-theme exec-path-from-shell evil-visualstar evil-magit evil-escape espresso-theme eshell-z eshell-prompt-extras esh-help engine-mode emmet-mode elpy elisp-slime-nav drag-stuff dracula-theme doom-themes django-theme diminish diff-hl darktooth-theme darkokai-theme darkmine-theme darkburn-theme dakrone-theme dactyl-mode cython-mode cyberpunk-theme csv-mode creamsody-theme counsel-projectile counsel-dash company-web company-tern company-statistics company-ghci company-ghc company-cabal company-auctex company-anaconda common-lisp-snippets color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized coffee-mode cmm-mode clues-theme clojure-snippets clj-refactor cider-eval-sexp-fu cherry-blossom-theme cargo busybee-theme bubbleberry-theme birds-of-paradise-plus-theme bind-map badwolf-theme auto-yasnippet auto-dictionary auto-compile auctex-latexmk apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme ac-ispell)))
 '(python-indent-guess-indent-offset nil)
 '(python-indent-offset 2)
 '(zoom-window-mode-line-color "DarkGreen"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil))))
 '(org-document-title ((t (:inherit default :weight bold :foreground "#D8DEE9" :family "Sans Serif" :height 2.0 :underline nil))))
 '(org-level-1 ((t (:inherit default :weight bold :foreground "#D8DEE9" :family "Sans Serif" :height 1.7))))
 '(org-level-2 ((t (:inherit default :weight bold :foreground "#D8DEE9" :family "Sans Serif" :height 1.5))))
 '(org-level-3 ((t (:inherit default :weight bold :foreground "#D8DEE9" :family "Sans Serif" :height 1.25))))
 '(org-level-4 ((t (:inherit default :weight bold :foreground "#D8DEE9" :family "Sans Serif" :height 1.1))))
 '(org-level-5 ((t (:inherit default :weight bold :foreground "#D8DEE9" :family "Sans Serif"))))
 '(org-level-6 ((t (:inherit default :weight bold :foreground "#D8DEE9" :family "Sans Serif"))))
 '(org-level-7 ((t (:inherit default :weight bold :foreground "#D8DEE9" :family "Sans Serif"))))
 '(org-level-8 ((t (:inherit default :weight bold :foreground "#D8DEE9" :family "Sans Serif")))))
