;;; Code:
(use-package avy
  :chords (("jj" . avy-goto-char)
	   ("jl" . avy-goto-line)
	   ("jk" . avy-goto-word-1))
  :bind (("C-:" . avy-goto-char)
	 ("C-'" . avy-goto-char-2)
	 ("M-g l" . avy-goto-line)
     ("M-g g" . avy-goto-line)
	 ("M-g w" . avy-goto-word-1)
	 ("M-g e" . avy-goto-word-0))
  :config
  (avy-setup-default)
  (use-package avy-migemo
    :if (executable-find "cmigemo")
    :config
    (avy-migemo-mode 1)
    )
  )
(use-package zop-to-char
  :bind (("M-z" . zop-up-to-char)))
(use-package ace-window
  ;; x - delete window
  ;; m - swap (move) window
  ;; v - split window vertically
  ;; b - split window horizontally
  ;; n - select the previous window
  ;; i - maximize window (select which window)
  ;; o - maximize current window
  :bind (("C-x o" . ace-window))
  :config
    (setq aw-keys '(?a ?s ?d ?f ?h ?j ?k ?l))
    )
;;; 15_jumping.el ends here
