;;; Code:
(use-package swoop
  :config
  (defun isearch-forward-or-swoop-migemo (use-swoop)
  (interactive "P")
  (let (current-prefix-arg)
    (call-interactively (if use-swoop 'swoop-migemo 'isearch-forward))))
  (bind-key "C-s" 'isearch-forward-or-swoop-migemo)
  (bind-key :map isearch-mode-map "C-o" 'swoop-from-isearch)
  (setq swoop-minibuffer-input-dilay 0.4)
  (setq swoop-font-size: 0.5)
  )
;;; 04_search.el ends here
