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
        magit
        auth-source-pass
        epa
        creamsody-theme
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
        ;; org-agenda-property
        org-bullets
        ;; org-download
        ;; org-caldav
        ;; org-noter
        ;; org-ref
        ;; origami
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
   dotspacemacs-check-for-update t
   dotspacemacs-elpa-subdirectory nil
   dotspacemacs-editing-style 'hybrid
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner 'official
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   dotspacemacs-startup-buffer-responsive t
   dotspacemacs-scratch-mode 'text-mode
   dotspacemacs-themes '(doom-one
                         spacemacs-dark
                         spacemacs-light)
   dotspacemacs-colorize-cursor-according-to-state t
   ;; dotspacemacs-default-font '("Source Code Pro"
   ;;                             :size 13
   ;;                             :weight bold
   ;;                             :width normal
   ;;                             :powerline-scale 1.1)

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
   dotspacemacs-auto-resume-layouts t
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
   dotspacemacs-whitespace-cleanup t))

(defun dotspacemacs/user-init ())

(defun dotspacemacs/user-config ()
;here
  ;; (require 'doom-themes)
  ;; (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
  ;;       doom-themes-enable-italic t) ; if nil, italics is universally disabled
  ;; (load-theme 'doom-one t) ;; Enable flashing mode-line on errors
  ;; (setq package-enable-at-startup nil)
  (setq auth-source-debug t)
  (setq auth-sources
        '((:source "~/.emacs.d/private/authinfo.gpg")))

  (setq-default dotspacemacs-editing-style '(hybrid :variables
                                                    hybrid-mode-enable-evilified-state t
                                                    hybrid-mode-enable-hjkl-bindings t
                                                    hybrid-mode-default-state 'normal))
  (setq-default indent-tabs-mode nil)
  (setq-default tab-width 2)
  (setq c-basic-indent 2)
  (setq-default tab-width 2)
  (setq-default dotspacemacs-lines-numbers '(:relative t :size-limit-kb 1000))
  ;;pretty
  ;; (load-theme 'creamsody)
  ;; (set-frame-font "Inconsolata 12"  nil t)
  ;; (set-frame-font "Iosevka 12" nil t)
  ;; (set-frame-font "Source Code Pro 12" nil t)
  (set-frame-parameter (selected-frame) 'alpha '(100 . 90))
  (setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
  (setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
  (setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
  (setq scroll-step 1)
  (doom-themes-visual-bell-config)
  (doom-themes-neotree-config)
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  ; (doom-themes-org-config)
  ;; basic config and bindings
  (global-set-key (kbd "C-x C-z") 'zoom-window-zoom)
  (global-set-key (kbd "C-x C-b") 'ibuffer)
  (bind-key* "C-c y" 'clipboard-yank)
  (autoload 'ibuffer "ibuffer" "List buffers." t)
  (custom-set-variables '(zoom-window-mode-line-color "DarkGreen"))
  (setq pdf-annot-activate-created-annotations t)

  ;;drag stuff
  ;; (drag-stuff-global-mode 1)
  ;; (drag-stuff-define-keys)


  (add-hook 'emacs-lisp-mode-hook 'flyspell-prog-mode) ;; Requires Ispell
  (add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
  (add-hook 'emacs-lisp-mode-hook
                (lambda ()
                  (setq indent-tabs-mode nil)
                  (define-key flyspell-mode-map "\M-\t" nil)
                  (define-key emacs-lisp-mode-map
                              "\C-x\C-e" 'pp-eval-last-sexp)
                  (add-hook (make-local-variable 'after-save-hook)
                            (lambda ()
                              (byte-force-recompile default-directory)))
                  (define-key emacs-lisp-mode-map
                              "\r" 'reindent-then-newline-and-indent)))

  (add-hook 'emacs-lisp-mode-hook 'eldoc-mode)

  ;; (with-eval-after-load 'org
  ;;   (load-file "~/.emacs.d/private/my-org.el") )
  ;; (load-file "~/.emacs.d/private/my-python.el")
  ;; (load-file "~/.emacs.d/private/my-tex.el")
  ;; (load-file "~/.emacs.d/private/my-engine.el")
  ;; ;; (load-file "~/.emacs.d/private/my-flyspell.el")
  ;; (load-file "~/.emacs.d/private/my-python.el")

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
  (package-initialize)

);;end config


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#282c34" "#ff6c6b" "#98be65" "#ECBE7B" "#51afef" "#c678dd" "#46D9FF" "#bbc2cf"])
 '(custom-safe-themes
   (quote
    ("6b2636879127bf6124ce541b1b2824800afc49c6ccd65439d6eb987dbf200c36" default)))
 '(fci-rule-color "#5B6268")
 '(jdee-db-active-breakpoint-face-colors (cons "#1B2229" "#51afef"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#1B2229" "#98be65"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#1B2229" "#3f444a"))
 '(objed-cursor-color "#ff6c6b")
 '(package-selected-packages
   (quote
    (slime faceup powerline pdf-tools key-chord tablist org-category-capture alert request-deferred request deferred log4e gntp org-plus-contrib enlive markdown-mode magit-popup macrostep skewer-mode simple-httpd zoutline iedit json-snatcher json-reformat js2-mode htmlize helm-bibtex parsebib helm-core haml-mode fringe-helper git-gutter+ git-gutter flyspell-correct pos-tip flycheck magit transient git-commit async with-editor dash evil goto-chg undo-tree pyvenv highlight-indentation find-file-in-project autothemer projectile counsel swiper ivy web-completion-data dash-functional tern ghc haskell-mode company hydra inflections edn multiple-cursors paredit peg lv eval-sexp-fu cider sesman seq spinner queue pkg-info parseedn clojure-mode parseclj a epl bind-key biblio biblio-core yasnippet packed auctex anaconda-mode pythonic f ace-window avy auto-complete zotxt zoom-window zenburn-theme zen-and-art-theme yapfify yaml-mode xterm-color white-sand-theme which-key wgrep web-mode web-beautify vimrc-mode use-package underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spaceline spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smooth-scrolling smooth-scroll smex smeargle slime-company slim-mode shell-pop seti-theme scss-mode sass-mode reverse-theme rebecca-theme rainbow-delimiters railscasts-theme racket-mode pytest pyenv-mode py-isort py-autopep8 purple-haze-theme pug-mode professional-theme planet-theme pip-requirements phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pcre2el origami orgit organic-green-theme org-ref org-projectile org-present org-pomodoro org-noter org-mime org-gcal org-download org-caldav org-bullets org-books org-agenda-property openwith omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme nlinum naquadah-theme mustang-theme multi-term monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minimal-theme material-theme markdown-toc majapahit-theme magit-gitflow madhat2r-theme lush-theme livid-mode live-py-mode lispy linum-relative light-soap-theme less-css-mode julia-mode json-mode js2-refactor js-doc jbeans-theme jazz-theme ivy-hydra ir-black-theme intero interleave inkpot-theme hy-mode hlint-refactor hindent heroku-theme hemisu-theme helm-make hc-zenburn-theme haskell-snippets gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gh-md gandalf-theme fuzzy flyspell-correct-ivy flycheck-pos-tip flycheck-haskell flx flatui-theme flatland-theme farmhouse-theme exotica-theme exec-path-from-shell evil-visualstar evil-magit evil-escape espresso-theme eshell-z eshell-prompt-extras esh-help engine-mode emmet-mode elpy elisp-slime-nav drag-stuff dracula-theme doom-themes django-theme diminish diff-hl darktooth-theme darkokai-theme darkmine-theme darkburn-theme dakrone-theme dactyl-mode cython-mode cyberpunk-theme csv-mode creamsody-theme counsel-projectile company-web company-tern company-statistics company-ghci company-ghc company-cabal company-auctex company-anaconda common-lisp-snippets color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized coffee-mode cmm-mode clues-theme clojure-snippets clj-refactor cider-eval-sexp-fu cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme bind-map badwolf-theme auto-yasnippet auto-dictionary auto-compile auth-source-pass auctex-latexmk apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme ac-ispell)))
 '(python-indent-guess-indent-offset nil)
 '(python-indent-offset 2)
 '(vc-annotate-background "#282c34")
 '(vc-annotate-color-map
   (list
    (cons 20 "#98be65")
    (cons 40 "#b4be6c")
    (cons 60 "#d0be73")
    (cons 80 "#ECBE7B")
    (cons 100 "#e6ab6a")
    (cons 120 "#e09859")
    (cons 140 "#da8548")
    (cons 160 "#d38079")
    (cons 180 "#cc7cab")
    (cons 200 "#c678dd")
    (cons 220 "#d974b7")
    (cons 240 "#ec7091")
    (cons 260 "#ff6c6b")
    (cons 280 "#cf6162")
    (cons 300 "#9f585a")
    (cons 320 "#6f4e52")
    (cons 340 "#5B6268")
    (cons 360 "#5B6268")))
 '(vc-annotate-very-old-color nil)
 '(zoom-window-mode-line-color "DarkGreen"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
