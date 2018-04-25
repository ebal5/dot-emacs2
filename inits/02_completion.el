;;; Code::
(use-package counsel
  :diminish ivy-mode
  :init
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) ")
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
  :config
  (ivy-mode 1)
  (counsel-mode 1)
  (setq ivy-use-virtual-buffers t
        ivy-count-format "%d/%d ")    
  (use-package ivy-hydra
    :pin melpa-stable)
  (use-package counsel-gtags
    :pin melpa-stable)
  (use-package counsel-projectile
    :config
    (counsel-projectile))
  )

(use-package yasnippet
  :diminish yas-minor-mode
  :bind (:map yas-minor-mode-map
	      ("C-x i i" . yas-insert-snippet)
	      ("C-x i n" . yas-new-snippet)
	      ("C-x i v" . yas-visit-snippet-file)
	      ("C-x i g" . yas-reload-all))
  :init
  (use-package yasnippet-snippets)
  :config
  (yas-reload-all)
  (yas-global-mode 1)
  )

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
  ;; Add yasnippet support for all company backends
  ;; https://github.com/syl20bnr/spacemacs/pull/179
  (defvar company-mode/enable-yas t
    "Enable yasnippet for all backends.")
  (defun company-mode/backend-with-yas (backend)
    (if (or (not company-mode/enable-yas) (and (listp backend) (member 'company-yasnippet backend)))
	backend
      (append (if (consp backend) backend (list backend))
	      '(:with company-yasnippet))))
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
(use-package hippie-exp
  :config
  (add-to-list 'hippie-expand-try-functions-list 'yas-hippie-try-expand)
  )
;; 02_completion.el ends here
