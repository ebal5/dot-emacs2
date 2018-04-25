;;; Code::
(use-package counsel
  :diminish ivy-mode
  :init
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) ")
  :config
  (ivy-mode 1)
  (counsel-mode 1)
  :bind
  (("M-x" . counsel-M-x)
   ("C-x C-f" . counsel-find-file)
   ("C-x C-r" . counsel-recentf)
   ("C-c i" . counsel-imenu)
   ("C-," . counsel-company)
   ("M-y" . counsel-yank-pop)
   ("C-h f" . counsel-describe-function)
   ("C-h v" . counsel-describe-variable)
   ("C-h l" . counsel-describe-library)
   ("<f2> i" . counsel-info-lookup-symbol)
   ("<f2> u" . counsel-unicode-char)
   ("C-c k" . counsel-ag)
   ("C-x l" . counsel-locate)
   ("C-c C-r" . ivy-resume)
   :map read-expression-map
   ("C-r" . counsel-expression-history)
   )
  )
(use-package ivy-hydra
  :pin melpa-stable)
(use-package counsel-gtags
  :pin melpa-stable)
(use-package counsel-projectile
  :config
  (counsel-projectile))
;; 02_completion.el ends here
