(add-to-list 'load-path "elpa/full-ack-0.2.1/full-ack")
(autoload 'ack-same "full-ack" nil t)
(autoload 'ack "full-ack" nil t)
(autoload 'ack-find-same-file "full-ack" nil t)
(autoload 'ack-find-file "full-ack" nil t)

(global-set-key [(shift super a)] 'ack)
