;;; Code:
(use-package swoop
  :init
  (defvar swoop-use-migemo t)
  ;; Specify the migemo-dict place in your system.
  (defvar swoop-migemo-options
    "-q -e -d /usr/local/share/migemo/utf-8/migemo-dict -i \"\a\"")
  
  :config
  (defun isearch-forward-or-swoop-migemo (use-swoop)
    (interactive "P")
    (let (current-prefix-arg)
      (call-interactively (if use-swoop 'swoop-migemo 'isearch-forward))))
  (bind-key "C-s" 'isearch-forward-or-swoop-migemo)
  (bind-key "C-o" 'swoop-from-isearch isearch-mode-map)
  (bind-key "C-o" 'swoop-multi swoop-map)
  (setq swoop-minibuffer-input-dilay 0.1)
  (setq swoop-font-size: 0.5)
  )
;;; 04_search.el ends here
