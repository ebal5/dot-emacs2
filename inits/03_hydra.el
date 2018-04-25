;;; Code:
(use-package hydra
  :config
  (defhydra my-hydra/zoom (global-map "<f3>")
    "zoom"
    ("g" text-scale-increase "zoom in")
    ("l" text-scale-decrease "zoom out"))
  )
;;; 03_hydra.el ends here
