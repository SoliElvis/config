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
        org-hide-emphasis-markers t)

        org-ref-bibliography-notes "~/org/ref/notes.org"
        org-ref-default-bibliography '("~/org/ref/master.bib")
        org-ref-pdf-directory "~/org/ref/pdfs/"

        bibtex-completion-bibliography "~/org/ref/master.bib"
        bibtex-completion-library-path "~/org/ref/pdfs"
        bibtex-completion-notes-path "~/org/ref/notes.org"

  (add-to-list 'auto-mode-alist '("\\.txt\\'" . org-mode))
  (add-to-list 'auto-mode-alist '(".*/[0-9]*$" . org-mode))   ;; Journal entries
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
     "/DONE" 'agenda))

  ;; Activate org-zotxt-mode in org-mode buffers
  (add-hook 'org-mode-hook (lambda () (org-zotxt-mode 1)))
  (define-key org-mode-map
    (kbd "C-c \" \"") (lambda () (interactive)
                        (org-zotxt-insert-reference-link '(4))))
  (defconst zotxt-url-base
    "http://localhost:23119/zotxt")
  (eval-after-load "zotxt"
    '(setq zotxt-default-bibliography-style "mkbehr-short"))

  )

(use-package org-journal
  :ensure t
  :init
  (setq org-journal-dir "~/org/journal/")
  (setq org-journal-date-format "#+TITLE: Journal Entry- %e %b %Y (%A)")
  (setq org-journal-time-format ""))

(defun get-journal-file-today ()
  "Return filename for today's journal entry."
  (let ((daily-name (format-time-string "%Y%m%d")))
    (expand-file-name (concat org-journal-dir daily-name))))

(defun journal-file-today ()
  "Create and load a journal file based on today's date."
  (interactive)
  (find-file (get-journal-file-today)))

(global-set-key (kbd "C-c f j") 'journal-file-today)
(defun get-journal-file-yesterday ()
  "Return filename for yesterday's journal entry."
  (let* ((yesterday (time-subtract (current-time) (days-to-time 1)))
         (daily-name (format-time-string "%Y%m%d" yesterday)))
    (expand-file-name (concat org-journal-dir daily-name))))

(defun journal-file-yesterday ()
  "Creates and load a file based on yesterday's date."
  (interactive)
  (find-file (get-journal-file-yesterday)))

(global-set-key (kbd "C-c f y") 'journal-file-yesterday)


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
  (setq org-caldav-url
  "https://us.hostiso.cloud/remote.php/dav/calendars/frederic.boileau@protonmail.com")
  (setq org-caldav-calendars
    '((:calendar-id "org-test" :files ("~/org/tasks.org")
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
  (add-hook 'kill-emacs-hook 'org-caldav-sync-at-close))

(use-package org-drill :ensure org-plus-contrib)
(use-package org-mime :ensure t)

;; (defun org-text-bold () "Wraps the region with asterisks."
;;        (interactive)
;;        (surround-text "*"))
;; (defun org-text-italics () "Wraps the region with slashes."
;;        (interactive)
;;        (surround-text "/"))
;; (defun org-text-code () "Wraps the region with equal signs."
;;        (interactive)
;;        (surround-text "="))

;; (use-package org
;;   :config
;;   (bind-keys :map org-mode-map
;;              ("A-b" . (surround-text-with "+"))
;;              ("s-b" . (surround-text-with "*"))
;;              ("A-i" . (surround-text-with "/"))
;;              ("s-i" . (surround-text-with "/"))
;;              ("A-=" . (surround-text-with "="))
;;              ("s-=" . (surround-text-with "="))
;;              ("A-`" . (surround-text-with "~"))
;;              ("s-`" . (surround-text-with "~"))

;;              ("C-s-f" . forward-sentence)
;;              ("C-s-b" . backward-sentence)))
