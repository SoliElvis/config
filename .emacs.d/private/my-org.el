(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

(use-package org
  :ensure t        ; But it comes with Emacs now!?
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
        org-books-file "~/org/my-list.org"
        org-hide-emphasis-markers t

        org-ref-bibliography-notes '("~/org/ref/notes.org")
        org-ref-default-bibliography '("~/org/ref/master.bib")
        org-ref-pdf-directory '("~/org/ref/pdfs")

        bibtex-completion-bibliography '("~/org/ref/master.bib")
        bibtex-completion-library-path '("~/org/ref/pdfs")
        bibtex-completion-notes-path '("~/org/ref/notes.org"))

  (add-hook 'org-mode-hook 'yas-minor-mode-on)
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  (define-key mode-specific-map [?a] 'org-agenda)

  (font-lock-add-keywords 'org-mode
                          '(("^ *\\([-]\\) "
                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))
  (defun org-archive-done-tasks ()
    (interactive)
    (org-map-entries
     (lambda ()
       (org-archive-subtree)
       (setq org-map-continue-from (outline-previous-heading)))
     "/DONE" 'agenda)))

;; Activate org-zotxt-mode in org-mode buffers
(add-hook 'org-mode-hook (lambda () (org-zotxt-mode 1)))
(define-key org-mode-map
  (kbd "C-c \" \"") (lambda () (interactive)
                      (org-zotxt-insert-reference-link '(4))))
(defconst zotxt-url-base
  "http://localhost:23119/zotxt")
(eval-after-load "zotxt"
  '(setq zotxt-default-bibliography-style "mkbehr-short"))

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
  (setq org-caldav-url "https://free01.thegood.cloud/remote.php/dav/calendars/frederic.boileau@protonmail.com")
  (setq org-caldav-calendars
        '((:calendar-id "org-test" :files ("~/org/tasks.org" "~/org/school.org" "~/org/life.org"
                                           "~/org/geek.org")
       :inbox "~/org/calendars/org-caldav-inbox.org")))

  (setq org-caldav-backup-file "~/org/org-caldav-backup.org")
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
  ;; (add-hook 'kill-emacs-hook 'org-caldav-sync-at-close)
  )
;; (use-package org-mime :ensure t)



