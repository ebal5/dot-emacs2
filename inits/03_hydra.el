;;; Code:
(use-package hydra
  :config
  (defhydra my-hydra/org-heading (org-mode-map "C-c")
    "Move Heading"
    ("u" outline-up-heading "Parent")
    ("n" outline-next-visible-heading "Next")
    ("p" outline-previous-visible-heading "Previous"))
  (defhydra my-hydra/zoom (global-map "<f3>")
    "zoom"
    ("g" text-scale-increase "zoom in")
    ("l" text-scale-decrease "zoom out"))
  )
;;; 03_hydra.el ends here
