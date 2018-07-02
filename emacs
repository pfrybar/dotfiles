;; MELPA
;;   install packages: base16-theme, yaml-mode, markdown-mode, js2-mode
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
  (add-to-list 'package-archives (cons "melpa" url) t))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

;; move custom file to different location
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file :noerror)

;; set base16 theme (todo - only load if base16-theme package installed)
(setq base16-theme-256-color-source "base16-shell")
(load-theme 'base16-default-dark t)

;; disable menu bar
(menu-bar-mode -1)

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
