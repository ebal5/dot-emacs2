;;; Code:
(use-package perspeen
  :init
  (setq perspeen-use-tab t)
  :config
  (perspeen-mode)
  (defhydra my-hydra/perspeen-tab (perspeen-mode-map "C-z t")
    "Perspeen TAB"
    ("c" perspeen-tab-create-tab "Create")
    ("n" perspeen-tab-next "Next")
    ("p" perspeen-tab-prev "Prev")
    ("k" perspeen-tab-del "Delete")
    ("d" perspeen-tab-del "Delete")
    )
  )
;;; 17_workspace.el
