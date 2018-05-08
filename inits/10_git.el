;;; Code:
(if (executable-find "git")
    (progn
      (use-package magit
        :bind
        (("C-x g" . magit-status))
        )
      (use-package magit-gitflow
        :commands (turn-on-magit-gitflow)
        :init
        (add-hook 'magit-mode-hook 'turn-on-magit-gitflow)
        )
      (use-package orgit)
      (use-package gist)
      )
  )
;;; 10_git.el ends here
