;; (add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/rails-minor-mode"))
;; (require 'rails)

(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/rhtml-minor-mode/"))
(require 'rhtml-mode)
(add-to-list 'auto-mode-alist '("\\.erb$" . rhtml-mode))
