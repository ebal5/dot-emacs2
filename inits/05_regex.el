;;; Code:
(use-package visual-regexp-steroids
  :bind
  (("M-%" . vr/query-replace)
   :map esc-map
   ("C-s" . vr/isearch-forward)
   ("C-r" . vr/isearch-backward))
  :config
  (setq vr/engine 'python)
  )
;;; 05_regex.el ends here
