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
        swift
        csv
        dash
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
        dash
        auth-source-pass
        creamsody-theme
        magit
        auth-source-pass
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
  ;; (setq org-latex-pdf-process (list "latexmk -shell-escape -bibtex -f -pdf %f"))
  (load-theme 'nord t)
  (global-set-key (kbd "C-x p i") 'org-cliplink)
  (setq org-latex-pdf-process
        '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
          "bibtex %b"
          "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
          "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))
  (setq bibtex-completion-pdf-field "file")
  (setq bibtex-completion-pdf-open-function
        (lambda (fpath)
          (start-process "evince" "*helm-bibtex-evince*" "/usr/bin/evince"
                         fpath)))
  (setq bibtex-dialect 'biblatex)
  (global-unset-key (kbd "C-x C-c"))
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

  (with-eval-after-load 'org
    (load-file "~/.emacs.d/private/my-org.el") )
  (load-file "~/.emacs.d/private/my-python.el")
  (load-file "~/.emacs.d/private/my-tex.el")
  (load-file "~/.emacs.d/private/my-engine.el")
  (load-file "~/.emacs.d/private/my-flyspell.el")


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

  (set-face-attribute 'default nil
                      :family "Source Code Pro"
                      :weight 'bold
                      :width 'normal)


  );;end config shibaa


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (zeal-at-point swift-mode origami org-noter org-gcal org-cliplink org-caldav org-agenda-property nord-theme counsel-dash dash-docs zotxt zoom-window zenburn-theme zen-and-art-theme yapfify yaml-mode xterm-color ws-butler winum white-sand-theme which-key wgrep web-mode web-beautify volatile-highlights vimrc-mode vi-tilde-fringe uuidgen use-package underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme toc-org tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spaceline spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smooth-scrolling smooth-scroll smex smeargle slime-company slim-mode shell-pop seti-theme scss-mode sass-mode reverse-theme restart-emacs rebecca-theme rainbow-delimiters railscasts-theme racket-mode pytest pyenv-mode py-isort py-autopep8 purple-haze-theme pug-mode professional-theme popwin planet-theme pip-requirements phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pcre2el paradox orgit organic-green-theme org-ref org-projectile org-present org-pomodoro org-mime org-download org-bullets org-books openwith open-junk-file omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme nlinum neotree naquadah-theme mustang-theme multi-term move-text monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minimal-theme material-theme markdown-toc majapahit-theme magit-gitflow madhat2r-theme lush-theme lorem-ipsum livid-mode live-py-mode lispy linum-relative link-hint light-soap-theme less-css-mode julia-mode json-mode js2-refactor js-doc jbeans-theme jazz-theme ivy-hydra ir-black-theme intero interleave inkpot-theme indent-guide hy-mode hungry-delete hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers heroku-theme hemisu-theme helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-ag hc-zenburn-theme haskell-snippets gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate golden-ratio gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gh-md gandalf-theme fuzzy flyspell-correct-ivy flycheck-pos-tip flycheck-haskell flx-ido flatui-theme flatland-theme fill-column-indicator farmhouse-theme fancy-battery eyebrowse expand-region exotica-theme exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu espresso-theme eshell-z eshell-prompt-extras esh-help engine-mode emmet-mode elpy elisp-slime-nav dumb-jump drag-stuff dracula-theme doom-themes django-theme diminish diff-hl define-word darktooth-theme darkokai-theme darkmine-theme darkburn-theme dakrone-theme dactyl-mode cython-mode cyberpunk-theme csv-mode creamsody-theme counsel-projectile company-web company-tern company-statistics company-ghci company-ghc company-cabal company-auctex company-anaconda common-lisp-snippets column-enforce-mode color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized coffee-mode cmm-mode clues-theme clojure-snippets clj-refactor clean-aindent-mode cider-eval-sexp-fu cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile auth-source-pass auctex-latexmk apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes aggressive-indent afternoon-theme adaptive-wrap ace-link ace-jump-helm-line ac-ispell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
