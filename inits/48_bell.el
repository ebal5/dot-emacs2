;;; Code:
(use-package echo-bell
  :disabled
  :config
  (setq echo-bell-string "♪♪♪♪")
  (setq echo-bell-background "Aquamarine") ;背景色
  (setq echo-bell-delay 0.4)              ;表示時間
  (echo-bell-mode 1)
)
;;; 49_bell.el ends here
