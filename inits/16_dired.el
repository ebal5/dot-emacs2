;;; Code:
(custom-set-variables
 '(dired-recursive-copies 'always)
 '(dired-recursive-deletes 'top)
 '(dired-dwim-target t)
 )
(put 'dired-find-alternate-file 'disabled nil)
(bind-key "r" 'wdired-change-to-wdired-mode dired-mode-map)
(use-package dired-hacks-utils)
;;; 16_dired.el ends here
