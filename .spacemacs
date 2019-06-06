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
        ruby

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
        org-mru-clock
        sudo-edit
        helm-spotify
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
  (setq inferior-lisp-program "ros -Q run")
  (add-to-list 'load-path "~/.emacs.d/private/julia-emacs/")
  (require 'julia-mode)
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
  (require 'org-bullets)
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

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
 '(debug-on-error t)
 '(doom-modeline-mode t)
 '(evil-want-Y-yank-to-eol nil)
 '(org-agenda-dim-blocked-tasks t)
 '(org-agenda-files
   (quote
    ("/home/sole/cloud/.personal/agenda/shortTerm.org" "/home/sole/cloud/.personal/agenda/appointments.org" "/home/sole/cloud/.personal/agenda/geek.org" "/home/sole/cloud/.personal/agenda/life.org" "/home/sole/cloud/.personal/agenda/school.org" "/home/sole/cloud/.personal/agenda/tasks.org")))
 '(org-agenda-inhibit-startup t)
 '(org-agenda-show-log t t)
 '(org-agenda-skip-deadline-if-done t)
 '(org-agenda-skip-deadline-prewarning-if-scheduled (quote pre-scheduled))
 '(org-agenda-skip-scheduled-if-done t)
 '(org-agenda-span 2)
 '(org-agenda-start-on-weekday 6)
 '(org-agenda-sticky nil)
 '(org-agenda-tags-column -100)
 '(org-agenda-time-grid (quote ((daily today require-timed))))
 '(org-agenda-use-tag-inheritance t)
 '(org-capture-templates
   (quote
    (("B" "Book" checkitem
      (file+headline "~/.personal/other/books.org" "Books")
      "- [ ] %^{Book}" :immediate-finish t)
     ("L" "Learning" checkitem
      (file+headline "~/.personal/other/learning.org" "Things")
      "- [ ] %^{Thing}" :immediate-finish t)
     ("M" "Movie" checkitem
      (file+headline "~/.personal/other/movies.org" "Movies")
      "- [ ] %^{Movie}" :immediate-finish t)
     ("P" "Purchase" checkitem
      (file+headline "~/.personal/other/purchases.org" "Purchases")
      "- [ ] %^{Item}" :immediate-finish t)
     ("c" "Contact" entry
      (file+headline "~/.personal/agenda/contacts.org" "Friends")
      "* %(org-contacts-template-name)
:PROPERTIES:
:ADDRESS: %^{289 Cleveland St. Brooklyn, 11206 NY, USA}
:BIRTHDAY: %^{yyyy-mm-dd}
:EMAIL: %(org-contacts-template-email)
:NOTE: %^{NOTE}
:END:" :empty-lines 1)
     ("l" "Ledger")
     ("lb" "Bank" plain
      (file "~/.personal/ledger/ledger-2019.dat")
      "%(org-read-date) %^{Payee}
  Expenses:%^{Account}  €%^{Amount}
  Liabilities:CreditsCards:Belfius" :empty-lines 1 :immediate-finish t)
     ("lc" "Cash" plain
      (file "~/.personal/ledger/ledger-2019.dat")
      "%(org-read-date) * %^{Payee}
  Expenses:%^{Account}  €%^{Amount}
  Assets:Cash:Wallet" :empty-lines 1 :immediate-finish t)
     ("f" "FindMyCat" entry
      (file+headline "~/.personal/agenda/findmycat.org" "Tasks")
      "* TODO %^{Task}
:PROPERTIES:
:Effort: %^{effort|1:00|0:05|0:15|0:30|2:00|4:00}
:END:
Captured %<%Y-%m-%d %H:%M>" :empty-lines 1)
     ("p" "People" entry
      (file+headline "~/.personal/agenda/people.org" "Tasks")
      "* TODO %^{Task}
:PROPERTIES:
:Effort: %^{effort|1:00|0:05|0:15|0:30|2:00|4:00}
:END:
Captured %<%Y-%m-%d %H:%M>" :empty-lines 1)
     ("s" "School" entry
      (file+headline "~/.personal/agenda/school.org" "Tasks")
      "* TODO %^{Task}
:PROPERTIES:
:Effort: %^{effort|1:00|0:05|0:15|0:30|2:00|4:00}
:END:
Captured %<%Y-%m-%d %H:%M>" :empty-lines 1)
     ("t" "Task" entry
      (file+headline "~/.personal/agenda/organizer.org" "Tasks")
      "* TODO %^{Task}
:PROPERTIES:
:Effort: %^{effort|1:00|0:05|0:15|0:30|2:00|4:00}
:END:
Captured %<%Y-%m-%d %H:%M>" :empty-lines 1))))
 '(org-clock-clocktable-default-properties
   (quote
    (:block day :maxlevel 2 :scope agenda :link t :compact t :formula % :step day :fileskip0 t :stepskip0 t :narrow 80 :properties
            ("Effort" "CLOCKSUM" "CLOCKSUM_T" "TODO"))))
 '(org-clock-continuously nil)
 '(org-clock-in-switch-to-state "STARTED")
 '(org-clock-out-remove-zero-time-clocks t)
 '(org-clock-persist t)
 '(org-clock-persist-file "~/cloud/.personal/agenda/.clock")
 '(org-clock-persist-query-resume nil)
 '(org-clock-report-include-clocking-task t)
 '(org-columns-default-format "%14SCHEDULED %Effort{:} %1PRIORITY %TODO %50ITEM %TAGS")
 '(org-contacts-files (quote ("~/cloud/.personal/agenda/contacts.org")))
 '(org-default-notes-file "~/cloud/.personal/agenda/organizer.org")
 '(org-directory "~/cloud/.personal")
 '(org-enforce-todo-dependencies t)
 '(org-habit-graph-column 80 t)
 '(org-habit-show-habits-only-for-today nil t)
 '(org-journal-date-format "%e %b %Y (%A)")
 '(org-journal-dir "~/cloud/.personal/journal/")
 '(org-journal-enable-encryption t)
 '(org-journal-file-format "%Y%m%d")
 '(org-journal-time-format "")
 '(org-show-notification-handler (lambda (msg) (alert msg)))
 '(org-todo-keyword-faces
   (quote
    (("DONE" :foreground "cyan" :weight bold)
     ("SOMEDAY" :foreground "gray" :weight bold)
     ("TODO" :foreground "green" :weight bold)
     ("WAITING" :foreground "red" :weight bold))))
 '(org-track-ordered-property-with-tag t)
 '(package-selected-packages
   (quote
    (rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake minitest chruby bundler inf-ruby helm helm-spotify multi org-mru-clock cider counsel find-file-in-project swiper org-plus-contrib org-journal parseclj projectile helm-core slime ivy doom-modeline doom zotxt zoom-window zenburn-theme zen-and-art-theme zeal-at-point yapfify yaml-mode yafolding xterm-color white-sand-theme which-key wgrep web-mode web-beautify vimrc-mode use-package underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme toml-mode tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit swift-mode sunny-day-theme sudo-edit sublime-themes subatomic256-theme subatomic-theme spaceline spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smooth-scrolling smooth-scroll smex smeargle slime-company slim-mode shell-pop seti-theme scss-mode sass-mode reverse-theme rebecca-theme rainbow-delimiters railscasts-theme racket-mode racer pytest pyenv-mode py-isort py-autopep8 purple-haze-theme pug-mode professional-theme planet-theme pip-requirements phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pcre2el origami orgit organic-green-theme org-ref org-projectile org-present org-pomodoro org-noter org-mime org-gcal org-download org-cliplink org-caldav org-bullets org-books org-agenda-property openwith omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme nord-theme noctilux-theme nlinum naquadah-theme mustang-theme multi-term mpdel monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minimal-theme material-theme markdown-toc majapahit-theme magit-gitflow madhat2r-theme lush-theme livid-mode live-py-mode lispy linum-relative light-soap-theme julia-mode json-mode js2-refactor js-doc jbeans-theme jazz-theme ivy-hydra ir-black-theme intero interleave inkpot-theme hy-mode hlint-refactor hindent heroku-theme hemisu-theme helm-make hc-zenburn-theme haskell-snippets gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gh-md gandalf-theme fuzzy flyspell-correct-ivy flycheck-rust flycheck-pos-tip flycheck-haskell flx flatui-theme flatland-theme farmhouse-theme exotica-theme exec-path-from-shell evil-visualstar evil-magit evil-escape espresso-theme eshell-z eshell-prompt-extras esh-help engine-mode emmet-mode elpy elisp-slime-nav drag-stuff dracula-theme doom-themes django-theme diminish diff-hl darktooth-theme darkokai-theme darkmine-theme darkburn-theme dakrone-theme dactyl-mode cython-mode cyberpunk-theme csv-mode creamsody-theme counsel-projectile counsel-dash company-web company-tern company-statistics company-ghci company-ghc company-cabal company-auctex company-anaconda common-lisp-snippets color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized coffee-mode cmm-mode clues-theme clojure-snippets clj-refactor cider-eval-sexp-fu cherry-blossom-theme cargo busybee-theme bubbleberry-theme birds-of-paradise-plus-theme bind-map badwolf-theme auto-yasnippet auto-dictionary auto-compile auctex-latexmk apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme ac-ispell)))
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
