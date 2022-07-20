;; MELPA
;;   install packages: base16-theme, yaml-mode, markdown-mode
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
;; run 'package-refresh-contents' to fetch latest package list

;; move custom file to different location
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file :noerror)

;; set base16 theme (todo - only load if base16-theme package installed)
(setq base16-theme-256-color-source "colors")
(load-theme 'base16-tomorrow-night t)

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
