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

        org-agenda-files '("~/org")
        org-books-file "~/cloud/org-next/my-list.org"
        org-hide-emphasis-markers t

        org-ref-default-bibliography '("~/cloud/bibstuff/bib-next.bib")
        org-ref-pdf-directory '("~/cloud/zotf_ile")

        helm-bibtex-bibliography '("~/cloud/bibstuff/bib-next.bib")
        helm-bibtex-library-path '("~/cloud/zotf_ile")

        bibtex-completion-bibliography '("~/cloud/bibstuff/bib-next.bib")
        bibtex-completion-library-path '("~/cloud/zotf_ile")))
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(font-lock-add-keywords 'org-mode
                        '(("^ *\\([-]\\) "
                            (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

;;agenda stuff
(define-key mode-specific-map [?a] 'org-agenda)

;;Latex and zot stuff
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
  '(
;;  (:calendar-id "org-test"
;;    :files ("~/org/life.org" "~/org/appointments.org")
;;    :inbox "~/org/inbox-text.org")
    (:calendar-id "next"
      :files ("~/cloud/org-next/life.org" "~/cloud/org-next/school.org")
      :inbox "~/cloud/org-next/org-caldav/next-test.org")))

  ;; (setq org-caldav-backup-file '("/home/sole/org/org-caldav-backup.org"))
  ;; (setq org-caldav-save-directory '("/home/sole/org/org-caldav/"))
  (setq org-icalendar-alarm-time 1)
  (setq org-icalendar-include-todo t)
  (setq org-icalendar-use-deadline '(event-if-todo event-if-not-todo todo-due))
  (setq org-icalendar-use-scheduled '(todo-start event-if-todo event-if-not-todo)))
;; custom functions
(defun meeting-notes ()
  "Call this after creating an org-mode heading for where the notes for the
  meeting should be. After calling this function, call 'meeting-done' to reset the
  environment."
  (interactive)
  (outline-mark-subtree)                              ;; Select org-mode section
  (narrow-to-region (region-beginning) (region-end))  ;; Only show that region
  (deactivate-mark)
  (delete-other-windows)                              ;; Get rid of other windows
  (text-scale-set 2)                                  ;; Text is now readable by others
  (fringe-mode 0)
  (message "When finished taking your notes, run meeting-done."))
(defun meeting-done ()
  "Attempt to 'undo' the effects of taking meeting notes."
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
