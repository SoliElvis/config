(elpy-enable)
(setq-default indent-tabs-mode nil)
(custom-set-variables
 '(python-guess-indent nil)
 '(python-indent-offset 2))

(add-hook 'python-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil)
            (setq tab-width 2)
            (setq py-indent-tabs-mode 2)
            (setq python-indent-offset 2)
            (add-to-list 'write-file-functions 'delete-trailing-whitespace)))

(add-hook 'elpy-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil)
            (setq tab-width 2)
            (setq py-indent-tabs-mode 2)
            (setq python-indent-offset 2)
            (add-to-list 'write-file-functions 'delete-trailing-whitespace)))

