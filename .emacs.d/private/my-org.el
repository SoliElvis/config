(setq org-element-use-cache nil)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(use-package org
  :init
  (setq org-use-speed-commands t
        org-return-follows-link t
        org-hide-emphasis-markers t
        org-completion-use-ido t
        org-outline-path-complete-in-steps nil
        org-src-fontify-natively t   ;; Pretty code blocks
        org-src-tab-acts-natively t
        org-confirm-babel-evaluate nil
        org-books-file "~/cloud/.personal/my-list.org"
        org-hide-emphasis-markers t
        org-ref-default-bibliography '("~/cloud/bibstuff/bib-next.bib")
        org-ref-pdf-directory '("~/cloud/zotf_ile")
        helm-bibtex-bibliography '("~/cloud/bibstuff/bib-next.bib")
        helm-bibtex-library-path '("~/cloud/zotf_ile")
        bibtex-completion-bibliography '("~/cloud/bibstuff/bib-next.bib")
        bibtex-completion-library-path '("~/cloud/zotf_ile")))

;;agenda stuff
(define-key mode-specific-map [?a] 'org-agenda)
(font-lock-add-keywords 'org-mode
                        '(("^ *\\([-]\\) "
                           (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))


;;Latex and zot stuff
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
(setq org-latex-pdf-process (list "latexmk -shell-escape -bibtex -f -pdf %f"))
(add-hook 'org-mode-hook (lambda () (org-zotxt-mode 1)))
(define-key org-mode-map
  (kbd "C-c \" \"") (lambda () (interactive)
                      (org-zotxt-insert-reference-link '(4))))
(defconst zotxt-url-base
  "http://localhost:23119/zotxt")
(eval-after-load "zotxt"
  '(setq zotxt-default-bibliography-style "mkbehr-short"))

(setq reftex-default-bibliography '("~/cloud/bibstuff/bib-next.bib"))
(setq org-ref-open-bibtex-pdf-function 'my/org-ref-open-pdf-at-point)
(defun my/org-ref-open-pdf-at-point ()
  "Open the pdf for bibtex key under point if it exists."
  (interactive)
  (let* ((results (org-ref-get-bibtex-key-and-file))
         (key (car results))
         (pdf-file (car (bibtex-completion-find-pdf key))))
    (if (file-exists-p pdf-file)
        (org-open-file pdf-file)
      (message "No PDF found for %s" key))))
(setq bibtex-completion-format-citation-functions
      '((org-mode      . bibtex-completion-format-citation-org-link-to-PDF)
        (latex-mode    . bibtex-completion-format-citation-cite)
        (markdown-mode . bibtex-completion-format-citation-pandoc-citeproc)
        (default       . bibtex-completion-format-citation-default)))

;;calendar stuff
(use-package org-caldav
  :init
  (setq org-caldav-url
  "https://free01.thegood.cloud/remote.php/dav/calendars/frederic.boileau@protonmail.com")
  ;;let filenames =
  (setq org-caldav-calendars
        '((:calendar-id "life-school"
                        :files ("~/cloud/.personal/agenda/life.org"
                                "~/cloud/.personal/agenda/school.org"
                                "~/cloud/.personal/agenda/shortTerm.org")
                        :inbox  "~/cloud/.personal/org-caldav/cal-life-school.org")

        (:calendar-id "appointments"
                        :files ("~/cloud/.personal/agenda/appointments.org")
                        :inbox "~/cloud/.personal/org-caldav/cal-appointments.org")
        (:calendar-id "geek"
                        :files ("~/cloud/.personal/agenda/geek.org")
                        :inbox "~/cloud/.personal/org-caldav/cal-geek.org")

        (:calendar-id "koios"
                        :files ("~/cloud/.personal/agenda/koios-repeat.org"
                                "~/cloud/.personal/agenda/koios.org")
                        :inbox "~/cloud/.personal/org-caldav/cal-koios-repeat.org")
        (:calendar-id "repeat"
                        :files ("~/cloud/.personal/agenda/repeat.org")
                        :inbox "~/cloud/.personal/org-caldav/cal-repeat.org")))

  (setq org-caldav-backup-file '("~/cloud/.personal/org-caldav/.caldav.bak"))
  (setq org-caldav-save-directory "~/.cal")
  (setq org-icalendar-alarm-time 1)
  (setq org-icalendar-include-todo t)
  (setq org-icalendar-use-deadline '(event-if-todo event-if-not-todo todo-due))
  (setq org-icalendar-use-scheduled '(todo-start event-if-todo event-if-not-todo)))
;; custom functions
(global-set-key (kbd "C-x p i") 'org-cliplink)
(use-package org-journal
  :after org
  :bind (("C-c T" . org-journal-new-entry)
         ("C-c Y" . journal-file-yesterday))
  :preface
  (defun get-journal-file-yesterday ()
    "Gets filename for yesterday's journal entry."
    (let* ((yesterday (time-subtract (current-time) (days-to-time 1)))
           (daily-name (format-time-string "%Y%m%d" yesterday)))
      (expand-file-name (concat org-journal-dir daily-name))))

  (defun journal-file-yesterday ()
    "Creates and load a file based on yesterday's date."
    (interactive)
    (find-file (get-journal-file-yesterday)))
  :custom
  (org-journal-date-format "%e %b %Y (%A)")
  (org-journal-dir (format "~/cloud/.personal/journal/" (format-time-string "%Y")))
  (org-journal-enable-encryption t)
  (org-journal-file-format "%Y%m%d")
  (org-journal-time-format ""))
(use-package org-faces
  :ensure nil
  :after org
  :custom
  (org-todo-keyword-faces
   '(("DONE" . (:foreground "cyan" :weight bold))
     ("SOMEDAY" . (:foreground "gray" :weight bold))
     ("TODO" . (:foreground "green" :weight bold))
     ("WAITING" . (:foreground "red" :weight bold)))))
(use-package org-contacts
  :ensure nil
  :after org
  :custom (org-contacts-files '("~/cloud/.personal/agenda/contacts.org")))
(use-package org-clock
  :preface
  (defun my/org-mode-ask-effort ()
    "Ask for an effort estimate when clocking in."
    (unless (org-entry-get (point) "Effort")
      (let ((effort
             (completing-read
              "Effort: "
              (org-entry-get-multivalued-property (point) "Effort"))))
        (unless (equal effort "")
          (org-set-property "Effort" effort)))))
  :hook (org-clock-in-prepare-hook . my/org-mode-ask-effort)
  :custom
  (org-clock-clocktable-default-properties
   '(:block day :maxlevel 2 :scope agenda :link t :compact t :formula %
            :step day :fileskip0 t :stepskip0 t :narrow 80
            :properties ("Effort" "CLOCKSUM" "CLOCKSUM_T" "TODO")))
  (org-clock-continuously nil)
  (org-clock-in-switch-to-state "STARTED")
  (org-clock-out-remove-zero-time-clocks t)
  (org-clock-persist t)
  (org-clock-persist-file "~/cloud/.personal/agenda/.clock")
  (org-clock-persist-query-resume nil)
  (org-clock-report-include-clocking-task t)
  (org-show-notification-handler (lambda (msg) (alert msg))))
;; global Effort estimate values
(setq org-global-properties
      '(("Effort_ALL" .
         "0:15 0:30 0:45 1:00 2:00 3:00 4:00 5:00 6:00 0:00")))
;; Set default column view headings: Task Priority Effort Clock_Summary
(setq org-columns-default-format "%50ITEM(Task) %2PRIORITY %10Effort(Effort){:} %10CLOCKSUM")

(use-package org-agenda
  :ensure nil
  :after org
  :bind (:map org-agenda-mode-map
              ("X" . my/org-agenda-mark-done-and-add-followup)
              ("x" . my/org-agenda-done))
  :preface
  (defun my/org-agenda-done (&optional arg)
    "Mark current TODO as done.
  This changes the line at point, all other lines in the agenda referring to
  the same tree node, and the headline of the tree node in the Org-mode file."
    (interactive "P")
    (org-agenda-todo "DONE"))

  (defun my/org-agenda-mark-done-and-add-followup ()
    "Mark the current TODO as done and add another task after it.
   Creates it at the same level as the previous task, so it's better to use
   this with to-do items than with projects or headings."
    (interactive)
    (org-agenda-todo "DONE")
    (org-agenda-switch-to)
    (org-capture 0 "t"))
  :custom
  (org-agenda-dim-blocked-tasks t)
  (org-agenda-files '("~/cloud/.personal/agenda"))
  (org-agenda-inhibit-startup t)
  (org-agenda-show-log t)
  (org-agenda-skip-deadline-if-done t)
  (org-agenda-skip-deadline-prewarning-if-scheduled 'pre-scheduled)
  (org-agenda-skip-scheduled-if-done t)
  (org-agenda-span 2)
  (org-agenda-start-on-weekday 6)
  (org-agenda-sticky nil)
  (org-agenda-tags-column -100)
  (org-agenda-time-grid '((daily today require-timed)))
  (org-agenda-use-tag-inheritance t)
  (org-columns-default-format "%14SCHEDULED %Effort{:} %1PRIORITY %TODO %50ITEM %TAGS")
  (org-default-notes-file "~/cloud/.personal/agenda/organizer.org")
  (org-directory "~/cloud/.personal")
  (org-enforce-todo-dependencies t)
  (org-habit-graph-column 80)
  (org-habit-show-habits-only-for-today nil)
  (org-track-ordered-property-with-tag t))
(use-package org-capture
  :ensure nil
  :after org
  :preface
  (defvar my/org-basic-task-template "* TODO %^{Task}
:PROPERTIES:
:Effort: %^{effort|1:00|0:05|0:15|0:30|2:00|4:00}
:END:
Captured %<%Y-%m-%d %H:%M>" "Template for basic task.")

  (defvar my/org-contacts-template "* %(org-contacts-template-name)
:PROPERTIES:
:ADDRESS: %^{289 Cleveland St. Brooklyn, 11206 NY, USA}
:BIRTHDAY: %^{yyyy-mm-dd}
:EMAIL: %(org-contacts-template-email)
:NOTE: %^{NOTE}
:END:" "Template for org-contacts.")

  (defvar my/org-ledger-card-template "%(org-read-date) %^{Payee}
  Expenses:%^{Account}  €%^{Amount}
  Liabilities:CreditsCards:Belfius" "Template for credit card transaction with ledger.")

  (defvar my/org-ledger-cash-template "%(org-read-date) * %^{Payee}
  Expenses:%^{Account}  €%^{Amount}
  Assets:Cash:Wallet" "Template for cash transaction with ledger.")
  :custom
  (org-capture-templates
   `(("B" "Book" checkitem (file+headline "~/.personal/other/books.org" "Books")
      "- [ ] %^{Book}"
      :immediate-finish t)

     ("L" "Learning" checkitem (file+headline "~/.personal/other/learning.org" "Things")
      "- [ ] %^{Thing}"
      :immediate-finish t)

     ("M" "Movie" checkitem (file+headline "~/.personal/other/movies.org" "Movies")
      "- [ ] %^{Movie}"
      :immediate-finish t)

     ("P" "Purchase" checkitem (file+headline "~/.personal/other/purchases.org" "Purchases")
      "- [ ] %^{Item}"
      :immediate-finish t)

     ("c" "Contact" entry (file+headline "~/.personal/agenda/contacts.org" "Friends"),
      my/org-contacts-template
      :empty-lines 1)

     ("l" "Ledger")

     ("lb" "Bank" plain (file ,(format "~/.personal/ledger/ledger-%s.dat" (format-time-string "%Y"))),
      my/org-ledger-card-template
      :empty-lines 1
      :immediate-finish t)

     ("lc" "Cash" plain (file ,(format "~/.personal/ledger/ledger-%s.dat" (format-time-string "%Y"))),
      my/org-ledger-cash-template
      :empty-lines 1
      :immediate-finish t)

     ("f" "FindMyCat" entry (file+headline "~/.personal/agenda/findmycat.org" "Tasks"),
      my/org-basic-task-template
      :empty-lines 1)

     ("p" "People" entry (file+headline "~/.personal/agenda/people.org" "Tasks"),
      my/org-basic-task-template
      :empty-lines 1)

     ("s" "School" entry (file+headline "~/.personal/agenda/school.org" "Tasks"),
      my/org-basic-task-template
      :empty-lines 1)

     ("t" "Task" entry (file+headline "~/.personal/agenda/organizer.org" "Tasks"),
      my/org-basic-task-template
      :empty-lines 1))))
(use-package org-mru-clock
  :ensure t
  :bind* (("C-c C-x i" . org-mru-clock-in)
          ("C-c C-x C-j" . org-mru-clock-select-recent-task))
  :init
  (setq org-mru-clock-how-many 100
        org-mru-clock-completing-read #'ivy-completing-read))
(setq org-clock-history-length 23)
(defun eos/org-clock-in ()
  (interactive)
  (org-clock-in '(4)))
(global-set-key (kbd "C-c I") #'eos/org-clock-in)
(global-set-key (kbd "C-c O") #'org-clock-out)
(org-clock-persistence-insinuate)
(setq org-clock-persist t)
(setq org-clock-in-resume t)
(setq org-clock-persist-query-resume nil)
(defun meeting-notes ()
  (interactive)
  (outline-mark-subtree)                              ;; Select org-mode section
  (narrow-to-region (region-beginning) (region-end))  ;; Only show that region
  (deactivate-mark)
  (delete-other-windows)                              ;; Get rid of other windows
  (text-scale-set 2)                                  ;; Text is now readable by others
  (fringe-mode 0)
  (message "When finished taking your notes, run meeting-done."))
(defun meeting-done ()
  (interactive)
  (widen)                                       ;; Opposite of narrow-to-region
  (text-scale-set 0)                            ;; Reset the font size increase
  (fringe-mode 1)
  (winner-undo))
(defun org-archive-done-tasks ()
  (interactive)
  (org-map-entries
   (lambda ()
     (org-archive-subtree)
     (setq org-map-continue-from (outline-previous-heading)))
   "/DONE" 'agenda))

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
(defun custom-org-cliplink ()
  (interactive)
  (org-cliplink-insert-transformed-title
   (org-cliplink-clipboard-content)     ;take the URL from the CLIPBOARD
   (lambda (url title)
     (let* ((parsed-url (url-generic-parse-url url)) ;parse the url
            (clean-title
             (cond
              ;; if the host is github.com, cleanup the title
              ((string= (url-host parsed-url) "github.com")
               (replace-regexp-in-string "GitHub - .*: \\(.*\\)" "\\1" title))
              ;; otherwise keep the original title
              (t title))))
       ;; forward the title to the default org-cliplink transformer
       (org-cliplink-org-mode-link-transformer url clean-title)))))
