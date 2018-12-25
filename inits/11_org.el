;;; Code:
(use-package org
  :pin org
  :bind (:map org-mode-map
	          ("C-c a" . org-agenda)
	          ("TAB" . org-cycle)
	          ("<tab>" . org-cycle))
  :init
  (setq org-directory "~/Documents/junk")
  (setq org-agenda-files
	    (-flatten
	     (mapcar
	      (lambda (dir)
	        (directory-files dir t "\\.org\\'"))
	      (-flatten
	       (mapcar
	        (lambda (dir)
	          (directory-files dir t "[0-9][0-9]"))
	        (directory-files org-directory t "[0-9][0-9][0-9][0-9]"))))))
  (setq org-use-speed-commands t)
  (setq org-beamer-theme "metropolis")
  
  :config
  (defun org-mode-reftex-setup ()
    (load-library "reftex")
    (and (buffer-file-name)
         (file-exists-p (buffer-file-name))
         (reftex-parse-all))
    (define-key org-mode-map (kbd "C-c )") 'reftex-citation)
    )
  (add-hook 'org-mode-hook 'org-mode-reftex-setup)
  (defhydra my-hydra/org-heading (org-mode-map "C-c")
    "Move Heading"
    ("u" outline-up-heading "Parent")
    ("n" outline-next-visible-heading "Next")
    ("p" outline-previous-visible-heading "Previous"))  
  (with-eval-after-load 'ox-latex
    (add-to-list 'org-latex-classes
		         '("bxjsarticle"
		           "\\documentclass[a4paper,xelatex,ja=standard]{bxjsarticle}
\\usepackage{zxjatype}
\\usepackage{metalogo}
\\usepackage{graphicx}
\\usepackage{color,xcolor}
\\usepackage{hyperref}
\\usepackage{pdfpages}
\\usepackage[OT1]{fontenc}
\\usepackage{amsmath}
\\usepackage{ulem}
\\usepackage{ascmac}
\\usepackage{framed}
\\usepackage{tikz}
[NO-DEFAULT-PACKAGES]
[PACKAGES]
[EXTRA]"
                   ("\\section{%s}" . "\\section*{%s}")
                   ("\\subsection{%s}" . "\\subsection*{%s}")
                   ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                   ("\\paragraph{%s}" . "\\paragraph*{%s}")
                   ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
    (add-to-list 'org-latex-classes
                 '("bxjsreport"
                   "\\documentclass[a4paper,11pt,xelatex,ja=standard]{bxjsreport}
\\usepackage{zxjatype}
\\usepackage{metalogo}
\\usepackage{graphicx}
\\usepackage{color,xcolor}
\\usepackage{hyperref}
\\usepackage{pdfpages}
\\usepackage{amsmath}
\\usepackage{ulem}
\\usepackage{ascmac}
\\usepackage{framed}
\\usepackage{tikz}
\\usepackage[OT1]{fontenc} 
[NO-DEFAULT-PACKAGES]
[PACKAGES]
[EXTRA]"
                   ("\\chapter{%s}" . "\\chapter*{%s}")
                   ("\\section{%s}" . "\\section*{%s}")
                   ("\\subsection{%s}" . "\\subsection*{%s}")
                   ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                   ("\\paragraph{%s}" . "\\paragraph*{%s}")
                   ("\\subparagraph{%s}" . "\\subparagraph*{%s}")
                   )
                 )
    (add-to-list 'org-latex-classes
                 '("ltjsreport"
                   "\\documentclass[a4paper]{ltjsreport}
\\usepackage[no-math]{fontspec}
\\usepackage[unicode,hidelinks,pdfusetitle]{hyperref}
\\usepackage[ipa]{luatexja-preset}
\\usepackage{amsmath}
\\usepackage{txfonts}
\\usepackage{graphicx}
\\usepackage{color,xcolor}
\\usepackage{pdfpages}
[NO-DEFAULT-PACKAGES]
[PACKAGES]
[EXTRA]
"
                   ("\\chapter{%s}" . "\\chapter*{%s}")
                   ("\\section{%s}" . "\\section*{%s}")
                   ("\\subsection{%s}" . "\\subsection*{%s}")
                   ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                   ("\\paragraph{%s}" . "\\paragraph*{%s}")
                   ("\\subparagraph{%s}" . "\\subparagraph*{%s}")
                   )
                 )
    (add-to-list 'org-latex-classes
	             '("beamer"
	               "\\documentclass[14pt, cjk, xetex,xcolor=pdftex,dvipsnames,table]{beamer}
\\usepackage[cm-default]{fontspec}
\\usepackage{xltxtra}
\\usepackage{multicol}
\\usepackage[OT1]{fontenc} 
[NO-DEFAULT-PACKAGES]
[PACKAGES]
[EXTRA]
\\setmainfont{IPAPMincho}
\\setsansfont{IPAPGothic}
\\setmonofont{IPAGothic}
\\XeTeXlinebreaklocale \"ja\"
% \\AtBeginSection[]{% セクションスライドを入れる場合？
% \\begin{frame}
% \\tableofcontents[currentsection]
% \\end{frame}
% }
"

                   ("\\section\{%s\}" . "\\section*\{%s\}")
                   ("\\subsection\{%s\}" . "\\subsection*\{%s\}")
                   ("\\subsubsection\{%s\}" . "\\subsubsection*\{%s\}")
                   ))
    (setq org-latex-default-class "bxjsarticle")
    (setq org-latex-to-pdf-process (list "latexmk -f -pdf %f"))
    (setq org-latex-pdf-process (list "latexmk -f -pdf %f")))
  )

(use-package org-present
  :bind
  (:map org-present-mode-keymap
	    ("b" . org-present-big)
	    ("s" . org-present-small)
	    ("q" . org-present-quit))
  :config
  (defun my/org-present-hook ()
    "My setting for org-present."
    (org-present-big)
    (org-display-inline-images)
    (org-present-hide-cursor)
    (org-present-read-only)
    )
  (defun my/org-present-quit-hook ()
    "My setting for org-present escape."
    (org-present-small)
    (org-remove-inline-images)
    (org-present-show-cursor)
    (org-present-read-write))
  (add-hook 'org-present-mode-hook 'my/org-present-hook)
  (add-hook 'org-present-mode-quick-hook 'my/org-present-quit-hook)
  (setq org-present-text-scale 5)
  )

(use-package ox-pandoc
  :if (executable-find "pandoc")
  )
(use-package org-ref
  :config
  (if (file-exists-p (expand-file-name "~/.texmf/bibtex/bib/papers.bib"))
      (setq reftex-default-bibliography (expand-file-name "~/.texmf/bibtex/bib/papers.bib")))
  )

(let ((puml (expand-file-name "~/bin/plantuml.jar"))
      (ditaa (expand-file-name "~/bin/jditaa.jar")))
  (if (file-exists-p puml)
      (add-to-list 'org-babel-load-languages '(plantuml . t))
      (defvar my/plantuml-jar-path
        puml
        "Specify plantUML's jar path."
      )
    )
  (if (file-exists-p ditaa)
      (progn
        (add-to-list 'org-babel-load-languages '(ditaa . t))
        (setq org-ditaa-jar-path ditaa)
        )
      )
  )
(add-to-list 'org-babel-load-languages '(shell . t))
(add-to-list 'org-babel-load-languages '(ruby . t))
(add-to-list 'org-babel-load-languages '(python . t))

;;; 11_org.el ends here
