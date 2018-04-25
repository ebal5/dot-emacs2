;;; Code::
(use-package counsel
  :diminish ivy-mode
  :init
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) ")
  :config
  (ivy-mode 1)
  (counsel-mode 1)
  (setq ivy-use-virtual-buffers t
	ivy-count-format "%d/%d ")  
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

(use-package company
  :pin melpa-stable
  :diminish company-mode
  :demand t
  :bind (("C-c /" . company-files)
	 ("C-M-i" . company-complete)
	 :map company-active-map
	 ("C-s" . company-filter-candidates)
	 ("C-n" . company-select-next)
	 ("C-p" . company-select-previous)
	 ("C-i" . company-complete-selection)
	 :map company-search-map
	 ("C-n" . company-select-next)
	 ("C-p" . company-select-previous))
  :config
  (global-company-mode +1)
  (setq company-dabbrev-downcase nil)
  (custom-set-variables
   '(company-minimum-prefix-length 3)
   '(company-idle-delay 0)
   '(company-selection-wrap-around t)
   '(company-dabbrev-downcase nil)
   '(company-dabbrev-ignore-case 'nil))
  )
;; backends for company
(use-package company-shell
  :config
  (add-to-list 'company-backends 'company-shell))
(use-package company-web
  :config
  (add-to-list 'company-backends 'company-web-html))
(use-package company-quickhelp
  :bind
  (:map company-active-map
	("C-c h" . company-quickhelp-manual-begin))
  :config
  (company-quickhelp-mode)
  )
;; 02_completion.el ends here
