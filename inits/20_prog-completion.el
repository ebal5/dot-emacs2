;;; Code:
(when (package-installed-p 'company)
  (use-package ycmd
    :config
    ;; (add-hook 'after-init-hook #'global-ycmd-mode)
    (add-hook 'c++-mode-hook 'ycmd-mode)
    (if (file-exists-p "/usr/share/ycmd/ycmd/")
        (progn
          (set-variable
           'ycmd-server-command '("python" "-u" "/usr/share/ycmd/ycmd/"))
          )
      (if (file-exists-p "/usr/share/vim/vimfiles/third_party/ycmd/ycmd/")
          (progn
            (set-variable 'ycmd-server-command '("python" "/usr/share/vim/vimfiles/third_party/ycmd/ycmd/"))
            (set-variable 'ycmd-global-config "/usr/share/vim/vimfiles/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py")
            ))
      )
    (use-package company-ycmd
      :init
      (company-ycmd-setup)
      ;; :config
      (add-to-list 'company-backends (company-mode/backend-with-yas 'company-ycmd))
      )
    (use-package flycheck-ycmd
      :config
      (flycheck-ycmd-setup)
      (when (not (display-graphic-p))
        (setq flycheck-indication-mode nil)))
    (require 'ycmd-eldoc)
    (add-hook 'ycmd-mode-hook 'ycmd-eldoc-setup)
    ))
;;; 20_prog-completion.el ends here
