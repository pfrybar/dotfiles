;; my programming modes directory
(setq load-path (append load-path (list "~/.emacs_pkgs/")))

;; turn on clock in status bar
(setq display-time-day-and-date t)
(display-time)

;; turn off tabs, use spaces instead
(setq-default indent-tabs-mode nil)

;; javascript mode (js2-mode)
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(custom-set-variables
 '(js2-basic-offset 2)
)

;; cperl mode
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
