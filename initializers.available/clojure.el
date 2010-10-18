(add-hook 'clojure-mode-hook (lambda ()
                               (define-clojure-indent
                                 (describe 1)
                                 (it 1)
                                 (def 1)
                                 (condp 2)
                                 (cond 0))))

(add-hook 'clojure-mode-hook (lambda ()
                               (highlight-parentheses-mode)))

(add-hook 'emacs-lisp-mode-hook (lambda () (highlight-parentheses-mode)))
