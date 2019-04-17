;;; Code:
(unless (window-system)
  (menu-bar-mode nil)
  (global-hl-line-mode 0)
  ;; use xsel to copy/paste in emacs-nox
  (when (getenv "DISPLAY")
    (cond
     ((executable-find "xsel")
      (defun xsel-cut-function (text &optional push)
        (with-temp-buffer
          (insert text)
          (call-process-region (point-min) (point-max) "xsel" nil 0 nil "-b")))
      (defun xsel-paste-function()
        (let ((xsel-output (shell-command-to-string "xsel -o")))
          (unless (string= (car kill-ring) xsel-output)
            xsel-output )))
      (setq interprogram-cut-function 'xsel-cut-function)
      (setq interprogram-paste-function 'xsel-paste-function)
      )
     ((executable-find "xclip")
      ;; use xclip to copy/paste in emacs-nox
      (defun xclip-cut-function (text &optional push)
        (with-temp-buffer
          (insert text)
          (call-process-region (point-min) (point-max) "xclip" nil 0 nil "-i" "-selection" "clipboard")))
      (defun xclip-paste-function()
        (let ((xclip-output (shell-command-to-string "xclip -o -selection clipboard")))
          (unless (string= (car kill-ring) xclip-output)
            xclip-output )))
      (setq interprogram-cut-function 'xclip-cut-function)
      (setq interprogram-paste-function 'xclip-paste-function)
      ))
    )
  )
;;; 70_default.el ends here
