(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(setq org-agenda-files '("~/org"))
(setq org-books-file "~/org/my-list.org")
(setq org-hide-emphasis-markers t)
(define-key mode-specific-map [?a] 'org-agenda)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
;; (setq org-format-latex-options (plist-put org-format-latex-options :scale 2.0))

;; Activate org-zotxt-mode in org-mode buffers
(add-hook 'org-mode-hook (lambda () (org-zotxt-mode 1)))
(define-key org-mode-map
  (kbd "C-c \" \"") (lambda () (interactive)
                        (org-zotxt-insert-reference-link '(4))))
(defconst zotxt-url-base
  "http://localhost:23119/zotxt")
(eval-after-load "zotxt"
  '(setq zotxt-default-bibliography-style "mkbehr-short"))



(setq org-ref-bibliography-notes "~/org/ref/notes.org"
      org-ref-default-bibliography '("~/org/ref/master.bib")
      org-ref-pdf-directory "~/org/ref/pdfs/")

(setq bibtex-completion-bibliography "~/org/ref/master.bib"
      bibtex-completion-library-path "~/org/ref/pdfs"
      bibtex-completion-notes-path "~/org/ref/notes.org")


(font-lock-add-keywords 'org-mode
                        '(("^ *\\([-]\\) "
                            (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

(defun org-archive-done-tasks ()
  (interactive)
  (org-map-entries
    (lambda ()
      (org-archive-subtree)
      (setq org-map-continue-from (outline-previous-heading)))
    "/DONE" 'agenda))

;; (require 'org-gcal)
;; (setq org-gcal-client-id "fred.boileau@gmail.com"
;;       org-gcal-client-secret "https://calendar.google.com/calendar/ical/fred.boileau%40gmail.com/\
;;         private-bd2a7815d818600f905476a0a77d6467/basic.ics"
;;       org-gcal-file-alist '(("fred.boileau@gmail.com" .  "~/org/tasks.org")))

(use-package org-caldav
  :init
  ;; This is the sync on close function; it also prompts for save after syncing so
  ;; no late changes get lost
  (defun org-caldav-sync-at-close ()
    (org-caldav-sync)
    (save-some-buffers))

  ;; This is the delayed sync function; it waits until emacs has been idle for
  ;; "secs" seconds before syncing.  The delay is important because the caldav-sync
  ;; can take five or ten seconds, which would be painful if it did that right at save.
  ;; This way it just waits until you've been idle for a while to avoid disturbing
  ;; the user.
  (defvar org-caldav-sync-timer nil
     "Timer that `org-caldav-push-timer' used to reschedule itself, or nil.")
  (defun org-caldav-sync-with-delay (secs)
    (when org-caldav-sync-timer
      (cancel-timer org-caldav-sync-timer))
    (setq org-caldav-sync-timer
	  (run-with-idle-timer
	   (* 1 secs) nil 'org-caldav-sync)))

  ;; Actual calendar configuration edit this to meet your specific needs
  (setq org-caldav-url "https://us.hostiso.cloud/remote.php/dav/calendars/\
                        frederic.boileau@protonmail.com@us.hostiso.cloud")
  (setq org-caldav-calendars
    '((:calendar-id "desk-org"
	    	:files ("~/tasks.org"))))
  ;; (setq org-caldav-backup-file "~/org-caldav/org-caldav-backup.org")
  (setq org-caldav-save-directory "~/org/org-caldav/")

  :config
  (setq org-icalendar-alarm-time 1)
  ;; This makes sure to-do items as a category can show up on the calendar
  (setq org-icalendar-include-todo t)
  ;; This ensures all org "deadlines" show up, and show up as due dates
  (setq org-icalendar-use-deadline '(event-if-todo event-if-not-todo todo-due))
  ;; This ensures "scheduled" org items show up, and show up as start times
  (setq org-icalendar-use-scheduled '(todo-start event-if-todo event-if-not-todo))
  ;; Add the delayed save hook with a five minute idle timer
  (add-hook 'after-save-hook
	    (lambda ()
	      (when (eq major-mode 'org-mode)
		(org-caldav-sync-with-delay 300))))
  ;; Add the close emacs hook
  (add-hook 'kill-emacs-hook 'org-caldav-sync-at-close))
