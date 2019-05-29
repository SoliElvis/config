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
  ;; (set-face-attribute 'default nil
  ;;                     :family "Source Code Pro"
  ;;                     :weight 'bold
  ;;                     :width 'normal)

  (global-set-key (kbd "C-x C-b") 'ibuffer)
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

  (load-file "~/.emacs.d/private/my-org.el")
  (load-file "~/.emacs.d/private/my-python.el")
  (load-file "~/.emacs.d/private/my-tex.el")
  (load-file "~/.emacs.d/private/my-engine.el")
  ;; (load-file "~/.emacs.d/private/my-flyspell.el")


;; (setq org-latex-pdf-process (list "latexmk -shell-escape -bibtex -f -pdf %f"))
;;------------------------------------------------

  ;; private interactive functions
  (defun occur-non-ascii ()
    "Find any non-ascii characters in the current buffer."
    (interactive)
    (occur "[^[:ascii:]]"))
  (defun find-first-non-ascii-char ()
    "Find the first non-ascii character from point onwards."
    (interactive)
    (let (point)
      (save-excursion
        (setq point
              (catch 'non-ascii
                (while (not (eobp))
                  (or (eq (char-charset (following-char))
                          'ascii)
                      (throw 'non-ascii (point)))
                  (forward-char 1)))))
      (if point
          (goto-char point)
        (message "No non-ascii characters."))))
  (defun toggle-maximize-buffer () "Maximize buffer" (interactive) (if (= 1 (length (window-list)))
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
  (setq x-select-enable-clipboard t)
  (require 'doom-themes)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-city-lights t)
  (load-theme 'nord t)
  (doom-themes-org-config)
  (doom-themes-visual-bell-config)
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
      `(org-document-title ((t (,@headline ,@variable-tuple :height 2.0 :underline nil)))))))

