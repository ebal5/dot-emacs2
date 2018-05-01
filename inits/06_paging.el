;;; Code:
(require 'page-ext)
;; C-x C-p C-a
;; add-new-page (新しいページを追加する)
;; C-x C-p C-d
;; pages-directory (ページごとにアウトラインを作成する！)
;; C-x C-p C-l
;; set-page-delimiter (ページ区切りの正規表現を設定する)
;; C-x C-p RET
;; mark-page (現在のページをマークする)
;; C-x C-p C-n
;; next-page (次のページへナローイングしながら移動)
;; C-x C-p C-p
;; previous-page (前のページへナローイングしながら移動)
;; C-x C-p C-s
;; search-pages (現在位置から正規表現検索し、ナローイング表示)
;; C-x C-p d
;; pages-directory-for-addresses (アドレス帳を表示)
;; C-x C-p s
;; sort-pages-buffer (ページをソートする)
(use-package pp-c-l
  :config
  (pretty-control-l-mode 1))
;;; 06_paging.el ends here
