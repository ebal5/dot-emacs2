;;; Code:
;; use system environment variables in Emacs
(use-package exec-path-from-shell
  :ensure t
  :config
  (exec-path-from-shell-initialize))
;;; 01_environment.el ends here
