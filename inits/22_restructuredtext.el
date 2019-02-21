;;; Code:
(use-package sphinx-mode
  :config
  (setq frame-background-mode 'dark)
  )
(use-package sphinx-doc)
(add-to-list 'auto-mode-alist '("\\.rst\\'" . rst-mode))
;;; 22_restructuredtext.el ends here
