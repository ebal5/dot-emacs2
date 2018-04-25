;;; Code:
(when (package-installed-p 'company)
  (use-package ycmd
    :config
    (add-hook 'after-init-hook #'global-ycmd-mode)
    (set-variable 'ycmd-server-command '("python" "/usr/share/vim/vimfiles/third_party/ycmd/ycmd/"))
    (set-variable 'ycmd-global-config "/usr/share/vim/vimfiles/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py")
    (use-package company-ycmd
      :init
      (company-ycmd-setup)
      :config
      (add-to-list 'company-backends (company-mode/backend-with-yas 'company-ycmd))
      )
    ))
;;; 20_prog-completion.el ends here
