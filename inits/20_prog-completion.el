;;; Code:
(when (package-installed-p 'company)
  (use-package ycmd
    :config
    (add-hook 'after-init-hook #'global-ycmd-mode)
    (use-package company-ycmd
      :init
      (company-ycmd-setup)
      :config
      (add-to-list 'company-backends (company-mode/backend-with-yas 'company-ycmd))
      )
    ))
;;; 20_prog-completion.el ends here
