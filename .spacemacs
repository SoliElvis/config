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
        html
        ivy
        git
        auto-completion themes-megapack org
        python
        emacs-lisp
        vimscript
        markdown
        racket
        clojure
        pdf-tools
        common-lisp
        haskell
        spell-checking syntax-checking version-control
        (latex :variables latex-enable-folding t latex-build-command "LatexMk")
        bibtex
        (shell :variables shell-default-height 30 shell-default-position 'bottom))

      dotspacemacs-additional-packages
      '((org-books :location (recipe :fetcher github :repo "lepisma/org-books"))
        rainbow-delimiters
        elpy
        linum-relative
        engine-mode
        org-noter
        org-ref
        org-download
        smooth-scrolling
        drag-stuff py-autopep8 smooth-scroll julia-mode
        zoom-window
        lispy
        org-bullets
        visual-line-mode
        persp-mode
        ibuffer
        origami
        zotxt
        openwith
        org-agenda-property
        org-download)


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
   dotspacemacs-whitespace-cleanup nil))

(defun dotspacemacs/user-init ())

(defun dotspacemacs/user-config ()
  (global-set-key
   [f3]
   (lambda ()
     (interactive)
     (ispell-change-dictionary "francais")))
  (global-set-key
   [f4]
   (lambda ()
     (interactive)
     (ispell-change-dictionary "english")))
  (setq TeX-source-correlate-mode t)
  (setq TeX-save-query nil)
  (setq TeX-source-correlate-mode t)
  (setq TeX-electric-math (cons "$" "$") )
  (engine-mode t)
  ;;(setq linum-relative-backend 'display-line-numbers-mode)
  ;;(setq-default pdf-view-display-size 'fit-page)
  ;; automatically annotate highlights
  (setq pdf-annot-activate-created-annotations t)


  (load-theme 'gruvbox-dark-medium)
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
  (bind-key* "C-x =" 'text-scale-increase)
  (bind-key* "C-x -" 'text-scale-decrease)
  (bind-key* "C-c y" 'clipboard-yank)

  (setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
  (setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
  (setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
  (setq scroll-step 1)

  (setq-default tab-width 2)

  (setq org-books-file "~/org/mylist.org")
  (setq org-agenda-files '("~/org"))
  (setq-default dotspacemacs-lines-numbers '(:relative t
                                             :size-limit-kb 1000))
  (setq org-hide-emphasis-markers t)
  (font-lock-add-keywords 'org-mode
                          '(("^ *\\([-]\\) "
                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))


  (autoload 'ibuffer "ibuffer" "List buffers." t)
  ;;(add-to-list 'default-frame-alist '(alpha . (85 . 60)))
  (set-frame-parameter (selected-frame) 'alpha '(100 . 90))

  (drag-stuff-global-mode 1)
  (drag-stuff-define-keys)

  (global-set-key (kbd "C-x C-z") 'zoom-window-zoom)
  (custom-set-variables '(zoom-window-mode-line-color "DarkGreen"))
  (global-set-key (kbd "C-M-/") 'my-expand-file-name-at-point)
  (global-set-key (kbd "C-x C-b") 'ibuffer)
  (set-frame-font "Iosevka 12" nil t)
  (set-frame-font "Inconsolata 12" nil t)
  (defun er-switch-to-previous-buffer ()
    "Switch to previously open buffer.
      Repeated invocations toggle between the two most recently open buffers."
    (interactive)
    (switch-to-buffer (other-buffer (current-buffer) 1)))
  (global-set-key (kbd "C-c b") #'er-switch-to-previous-buffer)
  (defun toggle-maximize-buffer () "Maximize buffer"
         (interactive)
         (if (= 1 (length (window-list)))
             (jump-to-register '_) 
           (progn
             (window-configuration-to-register '_)
             (delete-other-windows))))

  ;;(require 'openwith)
  ;;(openwith-mode t)
  ;;(setq openwith-associations '(("\\.pdf\\'" "evince" (file))))

  (defun my-expand-file-name-at-point ()
    "Use hippie-expand to expand the filename"
    (interactive)
    (let ((hippie-expand-try-functions-list
                                            '(try-complete-file-name-partially
                                              try-complete-file-name)))
          (call-interactively 'hippie-expand)))


;; Auctex
;;------------------------------------------------------------------------------------
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq-default TeX-master nil)
  (add-hook 'doc-view-mode-hook 'auto-revert-mode)



;;-------------------------------------------------------------------------------------
(defengine amazon
  "http://www.amazon.com/s/ref=nb_sb_noss?url=search-alias%3Daps&field-keywords=%s")

(defengine libgen
  "http://libgen.io/search.php?req=%s&lg_topic=libgen&open=0&view=simple&res=25&phrase=1&column=def"
  :keybinding "l")

(defengine duckduckgo
  "https://duckduckgo.com/?q=%s")

(defengine github
  "https://github.com/search?ref=simplesearch&q=%s"
  :keybinding "c")

(defengine google
  "http://www.google.com/search?ie=utf-8&oe=utf-8&q=%s"
  :keybinding "g")

(defengine google-images
  "http://www.google.com/images?hl=en&source=hp&biw=1440&bih=795&gbv=2&aq=f&aqi=&aql=&oq=&q=%s"
  :keybinding "i")

(defengine google-maps
  "http://maps.google.com/maps?q=%s"
  :keybinding "m"
  :docstring "Mappin' it up.")

(defengine project-gutenberg
  "http://www.gutenberg.org/ebooks/search/?query=%s")

(defengine rfcs
  "http://pretty-rfc.herokuapp.com/search?q=%s")

(defengine stack-overflow
  "https://stackoverflow.com/search?q=%s"
  :keybinding "s")

(defengine twitter
  "https://twitter.com/search?q=%s")

(defengine wikipedia
  "http://www.wikipedia.org/search-redirect.php?language=en&go=Go&search=%s"
  :keybinding "w"
  :docstring "Searchin' the wikis.")

(defengine wiktionary
  "https://www.wikipedia.org/search-redirect.php?family=wiktionary&language=en&go=Go&search=%s")

(defengine wolfram-alpha
  "http://www.wolframalpha.com/input/?i=%s")

(defengine youtube
  "http://www.youtube.com/results?aq=f&oq=&search_query=%s"
  :keybinding "y")
;;-------------------------------------------------------------------------------
  ;; Org Mode
(defun org-archive-done-tasks ()
  (interactive)
  (org-map-entries
   (lambda ()
     (org-archive-subtree)
     (setq org-map-continue-from (outline-previous-heading)))
   "/DONE" 'agenda))

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

  (setq org-books-file "~/org/my-list.org")
  (setq org-format-latex-options (plist-put org-format-latex-options :scale 2.0))

  (eval-after-load 'org '(require 'org-pdfview))
  (add-to-list 'org-file-apps
               '("\\.pdf\\'" . (lambda (file link)
                                 (org-pdfview-open link))))

  ;; Activate org-zotxt-mode in org-mode buffers
  (add-hook 'org-mode-hook (lambda () (org-zotxt-mode 1)))
  (define-key org-mode-map
    (kbd "C-c \" \"") (lambda () (interactive)
                        (org-zotxt-insert-reference-link '(4))))
  ;; Change citation format to be less cumbersome in files.
  ;; You'll need to install mkbehr-short into your style manager first.
  (defconst zotxt-url-base
    "http://localhost:23119/zotxt")
  (eval-after-load "zotxt"
    '(setq zotxt-default-bibliography-style "mkbehr-short"))

  (defun org-get-keyword (key)
    (org-element-map (org-element-parse-buffer 'element) 'keyword
      (lambda (k)
        (when (string= key (org-element-property :key k))
          (org-element-property :value k)))))
;;org pretty

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

  (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
  ;;\orgpretty

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key mode-specific-map [?a] 'org-agenda)

;;(eval-after-load "org"
;;  '(progn
;;     (define-prefix-command 'org-todo-state-map)
;;     (define-key org-mode-map "\C-cx" 'org-todo-state-map)
;;     (define-key org-todo-state-map "x"
;;       #'(lambda nil (interactive) (org-todo "CANCELLED")))
;;     (define-key org-todo-state-map "d"
;;       #'(lambda nil (interactive) (org-todo "DONE")))
;;     (define-key org-todo-state-map "f"
;;       #'(lambda nil (interactive) (org-todo "DEFERRED"))
;;)
;;     (define-key org-todo-state-map "l"
;;       #'(lambda nil (interactive) (org-todo "DELEGATED")))
;;     (define-key org-todo-state-map "s"
;;       #'(lambda nil (interactive) (org-todo "STARTED")))
;;     (define-key org-todo-state-map "w"
;;       #'(lambda nil (interactive) (org-todo "WAITING")))
;;     ;; (define-key org-agenda-mode-map "\C-n" 'next-line)
;;     ;; (define-key org-agenda-keymap "\C-n" 'next-line)
;;     ;; (define-key org-agenda-mode-map "\C-p" 'previous-line)
;;     ;; (define-key org-agenda-keymap "\C-p" 'previous-line))
;;    )))

(setq org-ref-bibliography-notes "~/org/ref/notes.org"
      org-ref-default-bibliography '("~/org/ref/master.bib")
      org-ref-pdf-directory "~/org/ref/pdfs/")

(setq bibtex-completion-bibliography "~/org/ref/master.bib"
      bibtex-completion-library-path "~/org/ref/pdfs"
      bibtex-completion-notes-path "~/org/ref/notes.org"))
;;(setq bibtex-completion-pdf-open-function
;;      (lambda (fpath)
;;        (start-process "open" "*open*" "open" fpath)))
;;
;;(setq org-latex-pdf-process (list "latexmk -shell-escape -bibtex -f -pdf %f"))
;;
;;(server-start)
;;(add-to-list 'load-path "~/path/to/org/protocol/")
;;(require 'org-protocol)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("8d805143f2c71cfad5207155234089729bb742a1cb67b7f60357fdd952044315" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "8f97d5ec8a774485296e366fdde6ff5589cf9e319a584b845b6f7fa788c9fa9a" default)))
 '(evil-want-Y-yank-to-eol nil)
 '(line-number-mode t)
 '(linum-relative-global-mode t)
 '(org-agenda-custom-commands
   (quote
    (("d" todo "DELEGATED" nil)
     ("c" todo "DONE|DEFERRED|CANCELLED" nil)
     ("w" todo "WAITING" nil)
     ("W" agenda ""
      ((org-agenda-ndays 21)))
     ("A" agenda ""
      ((org-agenda-skip-function
        (lambda nil
          (org-agenda-skip-entry-if
           (quote notregexp)
           "\\=.*\\[#A\\]")))
       (org-agenda-ndays 1)
       (org-agenda-overriding-header "Today's Priority #A tasks: ")))
     ("u" alltodo ""
      ((org-agenda-skip-function
        (lambda nil
          (org-agenda-skip-entry-if
           (quote scheduled)
           (quote deadline)
           (quote regexp)
           "
      ]+>")))
       (org-agenda-overriding-header "Unscheduled TODO entries: "))))))
 '(org-agenda-files
   (quote
    ("~/UdeM/mrSimon/mrSimonNotes.org" "/home/sole/org/my-list.org" "/home/sole/org/recettes.org" "/home/sole/org/template_today.org")))
 '(org-agenda-ndays 7)
 '(org-agenda-show-all-dates t)
 '(org-agenda-skip-deadline-if-done t)
 '(org-agenda-skip-scheduled-if-done t)
 '(org-agenda-start-on-weekday nil)
 '(org-deadline-warning-days 14)
 '(org-default-notes-file "~/org/notes.org")
 '(org-fast-tag-selection-single-key (quote expert))
 '(org-remember-store-without-prompt t)
 '(org-remember-templates
   (quote
    ((116 "* TODO %?
  %u" "~/todo.org" "Tasks")
     (110 "* %u %?" "~/notes.org" "Notes"))))
 '(org-reverse-note-order t)
 '(package-selected-packages
   (quote
    (elpy find-file-in-project company-auctex auctex-latexmk auctex engine-mode web-mode tagedit slim-mode scss-mode sass-mode pug-mode haml-mode emmet-mode company-web web-completion-data flyspell-correct-popup org-pdfview org-noter company openwith interleave org-protocol-jekyll zotxt request-deferred deferred org-ref pdf-tools key-chord helm-bibtex biblio parsebib biblio-core tablist org-books enlive counsel clojure-mode flycheck helm org-plus-contrib magit slime remember-last-theme origami smart-mode-line smart-mode-line-powerline-theme powerline-evil smooth-scrolling ws-butler winum volatile-highlights vi-tilde-fringe uuidgen toc-org spaceline powerline restart-emacs request popwin paradox open-junk-file neotree move-text lorem-ipsum linum-relative link-hint indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-projectile helm-mode-manager helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido fill-column-indicator fancy-battery eyebrowse expand-region evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist highlight evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state evil-exchange evil-ediff evil-args evil-anzu anzu dumb-jump define-word column-enforce-mode clean-aindent-mode auto-highlight-symbol aggressive-indent adaptive-wrap ace-link ace-jump-helm-line zoom-window zenburn-theme zen-and-art-theme yapfify xterm-color white-sand-theme which-key wgrep vimrc-mode use-package underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smooth-scroll smex smeargle slime-company shell-pop seti-theme reverse-theme rebecca-theme rainbow-delimiters railscasts-theme racket-mode pyvenv pytest pyenv-mode py-isort py-autopep8 purple-haze-theme professional-theme planet-theme pip-requirements phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pcre2el orgit organic-green-theme org-projectile org-present org-pomodoro org-mime org-download org-bullets org-agenda-property omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme naquadah-theme mustang-theme multi-term monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minimal-theme material-theme markdown-toc majapahit-theme magit-gitflow madhat2r-theme lush-theme live-py-mode lispy light-soap-theme julia-mode jbeans-theme jazz-theme ivy-hydra ir-black-theme intero inkpot-theme hy-mode htmlize hlint-refactor hindent heroku-theme hemisu-theme helm-make hc-zenburn-theme haskell-snippets gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gh-md gandalf-theme fuzzy flyspell-correct-ivy flycheck-pos-tip flycheck-haskell flx flatui-theme flatland-theme farmhouse-theme exotica-theme exec-path-from-shell evil-visualstar evil-magit evil-escape espresso-theme eshell-z eshell-prompt-extras esh-help elisp-slime-nav drag-stuff dracula-theme django-theme diminish diff-hl darktooth-theme darkokai-theme darkmine-theme darkburn-theme dakrone-theme dactyl-mode cython-mode cyberpunk-theme counsel-projectile company-statistics company-ghci company-ghc company-cabal company-anaconda common-lisp-snippets color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized cmm-mode clues-theme clojure-snippets clj-refactor cider-eval-sexp-fu cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme bind-map badwolf-theme auto-yasnippet auto-dictionary auto-compile apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme ac-ispell)))
 '(remember-annotation-functions (quote (org-remember-annotation)))
 '(remember-handler-functions (quote (org-remember-handler)))
 '(smooth-scrolling-mode t)
 '(zoom-window-mode-line-color "DarkGreen"))




;;



;; auto-generate custom variable definitions.

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fixed-pitch ((t (:family "Inconsolata" :slant normal :weight normal :height 1.0 :width normal))))
 '(org-document-title ((t (:inherit default :weight bold :foreground "#fdf4c1" :family "Sans Serif" :height 2.0 :underline nil))))
 '(org-level-1 ((t (:inherit default :weight bold :foreground "#fdf4c1" :family "Sans Serif" :height 1.7))))
 '(org-level-2 ((t (:inherit default :weight bold :foreground "#fdf4c1" :family "Sans Serif" :height 1.5))))
 '(org-level-3 ((t (:inherit default :weight bold :foreground "#fdf4c1" :family "Sans Serif" :height 1.25))))
 '(org-level-4 ((t (:inherit default :weight bold :foreground "#fdf4c1" :family "Sans Serif" :height 1.1))))
 '(org-level-5 ((t (:inherit default :weight bold :foreground "#fdf4c1" :family "Sans Serif"))))
 '(org-level-6 ((t (:inherit default :weight bold :foreground "#fdf4c1" :family "Sans Serif"))))
 '(org-level-7 ((t (:inherit default :weight bold :foreground "#fdf4c1" :family "Sans Serif"))))
 '(org-level-8 ((t (:inherit default :weight bold :foreground "#fdf4c1" :family "Sans Serif"))))
 '(variable-pitch ((t (:family "Source Sans Pro" :height 180 :weight light)))))
