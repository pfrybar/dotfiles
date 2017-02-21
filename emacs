;; my programming modes directory
(setq load-path (append load-path (list "~/.emacs_pkgs/")))

;; byte-compile changed files
(byte-recompile-directory (expand-file-name "~/.emacs_pkgs/") 0)

;; turn on clock in status bar (helps server timeouts)
(setq display-time-day-and-date t)
(display-time)

;; turn off tabs, use spaces instead
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; move backups (*~) to a separate directory, and store multiple versions
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
  backup-by-copying t    ; Don't delink hardlinks
  version-control t      ; Use version numbers on backups
  delete-old-versions t  ; Automatically delete excess backups
  kept-new-versions 20   ; how many of the newest versions to keep
  kept-old-versions 5    ; and how many of the old
  )

;; groovy mode
;; turn on syntax highlighting
(global-font-lock-mode 1)

;; use groovy-mode when file ends in .groovy or has #!/bin/groovy at start
(autoload 'groovy-mode "groovy-mode" "Major mode for editing Groovy code." t)
(add-to-list 'auto-mode-alist '("\.groovy$" . groovy-mode))
(add-to-list 'interpreter-mode-alist '("groovy" . groovy-mode))
;; end groovy mode

;; javascript mode
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(custom-set-variables
 '(js2-basic-offset 2)
)
;; end javascript mode

;; perl mode
(require 'cperl-mode)
(defun cperl-backward-to-start-of-continued-exp (lim)
  (goto-char containing-sexp)
  (let ((sexp-start (following-char)))
    (forward-char)
    (skip-chars-forward " \t\n")
    (if (memq sexp-start (append "([" nil)) ; this hack is for continued statements inside parentheses
        (backward-char cperl-continued-statement-offset))))

;; cperl-mode is preferred to perl-mode                                        
(defalias 'perl-mode 'cperl-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cperl-close-paren-offset -4)
 '(cperl-highlight-variables-indiscriminately t)
 '(cperl-indent-level 4)
 '(cperl-indent-parens-as-block t)
 '(send-mail-function (quote mailclient-send-it)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cperl-array-face ((((class color) (background light)) (:foreground "Blue"))))
 '(cperl-hash-face ((((class color) (background light)) (:foreground "Purple"))))
 '(js2-external-variable ((t (:foreground "orange" :weight bold)))))
;; end perl mode

;; go mode
(require 'go-mode-autoloads)
;; end go mode

;; rust mode
;; (add-to-list 'load-path "/path/to/rust-mode/")
(autoload 'rust-mode "rust-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))
;; end rust mode

;; markdown mode
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(autoload 'gfm-mode "markdown-mode"
   "Major mode for editing GitHub Flavored Markdown files" t)
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))
;; end markdown mode

;; yaml mode
(require 'yaml-mode)
    (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))

;; stop weird paste indentation issue:
;;     http://stackoverflow.com/questions/27736107/emacs-started-adding-extra-tabs-in-when-i-paste-into-it-on-os-x
(electric-indent-mode 0)
