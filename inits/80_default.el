;;; Code:
(when (window-system)
  (custom-set-variables
   '(use-file-dialog nil)
   '(scroll-bar-mode nil)
   '(menu-bar-mode nil)
   '(tool-bar-mode nil)
   '(column-number-mode 1)
   '(auto-image-file-mode 1)
   )
  (use-package madhat2r-theme
    :config
    (load-theme 'madhat2r t)
    )
  (use-package beacon
    :pin melpa-stable
    :config
    (custom-set-variables
     '(beacon-lighter "")
     )
    (hl-line-mode nil)
    (beacon-mode 1)
    )
  (use-package telephone-line
    :config
    (setq telephone-line-lhs
      '((evil   . (telephone-line-evil-tag-segment))
        (accent . (telephone-line-vc-segment
                   telephone-line-erc-modified-channels-segment
                   telephone-line-process-segment))
        (nil    . (telephone-line-minor-mode-segment
                   telephone-line-buffer-segment))))
    (setq telephone-line-rhs
	  '((evil   . (telephone-line-airline-position-segment))
	    (accent . (telephone-line-major-mode-segment))
	    (nil    . (telephone-line-misc-info-segment))))
    (telephone-line-mode 1)
    )
  ;; font settings
  (defun my/font-exists-p (font)
    "Return true if font exists."
    (if (null (x-list-fonts font)) nil t))
  (defun my/use-font (size afont jpfont)
    "Use font"
    (let* ((asciifont afont)
          (jpfont jpfont)
          (h (* size 10))
          (fontspec (font-spec :family asciifont))
          (jp-fontspec (font-spec :family jpfont)))
      (set-face-attribute 'default nil :family asciifont :height h)
      (set-fontset-font (frame-parameter nil 'font)
                        'japanese-jisx0213.2004-1 jp-fontspec)
      (set-fontset-font (frame-parameter nil 'font)
                        'japanese-jisx0213-2 jp-fontspec)
      (set-fontset-font (frame-parameter nil 'font)
                        'katakana-jisx0201 jp-fontspec)
      (set-fontset-font (frame-parameter nil 'font)
                        'japanese-jisx0208 jp-fontspec)
      (set-fontset-font (frame-parameter nil 'font)
                        'japanese-jisx0212 jp-fontspec)
      (set-fontset-font nil '(#x0080 . #x024F) fontspec) 
      (set-fontset-font nil '(#x0370 . #x03FF) fontspec)
      ))
  (cond
   ((my/font-exists-p "Cica")
    (my/use-font 12 "Cica" "Cica"))
   ((my/font-exists-p "Ricty Discord")
    (my/use-font 14 "Ricty Discord" "Ricty Discord"))
   ((my/font-exists-p "Ricty Diminished")
    (my/use-font 14 "Ricty Diminished" "Ricty Diminished"))
   ((my/font-exists-p "Migu 1M")
    (my/use-font 14 "Migu 1M" "Migu 1M"))
   ((my/font-exists-p "Migu 2M")
    (my/use-font 14 "Migu 2M" "Migu 2M"))
   ((my/font-exists-p "Myrica")
    (my/use-font 14 "Myrica" "Myrica"))
   )
  (use-package emojify)
  )
;;; 80_default.el ends here
