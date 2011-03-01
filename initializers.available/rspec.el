(add-to-list 'load-path "~/.emacs.d/vendor/rspec-mode/")

(require 'rspec-mode)

;; bind to CMD-r and CMD-R like in Textmate
(define-key rspec-mode-keymap [(super r)] 'rspec-verify)
(define-key rspec-mode-keymap [(super R)] 'rspec-verify-single)


(setq rspec-opts "--drb --color --diff")
;;
;; redefine rspec-core-options to include rspec-opts when running
;;
(defun rspec-core-options (&optional default-options)
  "Returns string of options that instructs spec to use spec.opts file if it exists, or sensible defaults otherwise"
  (if (file-readable-p (rspec-spec-opts-file))
      (concat "--options " (rspec-spec-opts-file) " " rspec-opts)
    (if default-options
        default-options
        (concat "--format specdoc " "--reverse"))))
