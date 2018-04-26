;;; Code:
(use-package cyphejor
  :config
  (custom-set-variables '(cyphejor-rules
	'(:upcase
	  ("bookmark" "→")
	  ("buffer" "β")
	  ("diff" "Δ")
	  ("dired" "δ")
	  ("emacs" "ε")
	  ("fundamental" "φ")
	  ("inferior"    "i" :prefix)
	  ("interaction" "i" :prefix)
	  ("interactive" "i" :prefix)
	  ("lisp"        "λ" :postfix)
	  ("menu" "μ")
	  ("mode" "")
	  ("package" "↓")
	  ("python" "π")
	  ("shell" "sh" :postfix)
	  ("text" "ξ")
	  ("wdired" "↯δ")
	  ("org" "Ω")
	  ("conf" "⚙")
	  ("java" "☕")
      ("eshell" "εsh")
	  )))
  (cyphejor-mode 1)
  )
;;; 41_cyphejor.el ends here
