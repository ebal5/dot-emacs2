;;; Code:
(use-package flycheck
  :diminish flycheck-mode
  :init (global-flycheck-mode)
  :config
  (when (package-installed-p 'hydra)
    (defhydra my-hydra/flycheck (flycheck-mode-map "C-c !")
      "Flycheck Commands"
      ("b" flycheck-buffer "Buf")
      ("C" flycheck-clear "Clr")
      ("n" flycheck-next-error "Next")
      ("p" flycheck-previous-error "Prev")
      ("l" flycheck-list-errors "List")
      ("s" flycheck-select-checker)
      ("x" flycheck-disable-checker)
      ("?" flycheck-describe-checker)
      ("h" flycheck-display-error-at-point "Here")
      ("e" flycheck-explain-error-at-point "Expl")
      )
    )
  (when (window-system)
    (use-package flycheck-pos-tip
      :config
      (with-eval-after-load 'flycheck
	(flycheck-pos-tip-mode)))
    )
  
  (if (executable-find "textlint")
      (progn
        (flycheck-define-checker textlint
          "A linter for prose."
          :command ("textlint" "--format" "unix" source-inplace)
          :error-patterns
          ((warning line-start (file-name) ":" line ":" column ": "
                    (id (one-or-more (not (any " "))))
                    (message (one-or-more not-newline)
                             (zero-or-more "\n" (any " ") (one-or-more not-newline)))
                    line-end))
          :modes (text-mode markdown-mode gfm-mode tex-mode yatex-mode))
        (add-to-list 'flycheck-checkers 'textlint)
        )
    )
  )
;;; 20_flycheck.el ends here
