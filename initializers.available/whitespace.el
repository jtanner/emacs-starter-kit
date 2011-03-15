;; makes trailing whitespace and tabs obvious
(global-whitespace-mode t)
(setq whitespace-style (quote (trailing tabs tab-mark)))

;; adds a hook to strip trailing whitespace automatically on save
(add-hook 'ruby-mode-hook
          (lambda()
            (add-hook 'before-save-hook
                      'delete-trailing-whitespace nil t)))
