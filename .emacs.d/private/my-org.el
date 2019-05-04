(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(setq org-agenda-files '("~/org"))
(setq org-books-file "~/org/my-list.org")
(setq org-hide-emphasis-markers t)
(define-key mode-specific-map [?a] 'org-agenda)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(setq org-format-latex-options (plist-put org-format-latex-options :scale 2.0))

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
