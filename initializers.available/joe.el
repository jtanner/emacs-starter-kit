;; ----------------------------------------
;; Start with org todo
;; ----------------------------------------
(find-file "~/org/work.org")


;; ----------------------------------------
;;
;; Visual tweaks
;;
;; ----------------------------------------

(color-theme-ir-black)

;; highlight current line
(global-hl-line-mode 1)

;; font size
(set-face-attribute 'default nil :height 130) ;; 13pt

;; set default screen size
(defun set-frame-size-according-to-resolution()
  (interactive)
  (if window-system
      (progn
        ;; when on a larger display than my 15" screen
        (if (> (x-display-pixel-width) 1680)
            (setq default-frame-alist
                  '((left . 80) (width . 223) (height . 63)))
          (setq default-frame-alist
                '((left . 56) (width . 198) (height . 58))))
        )))
(set-frame-size-according-to-resolution)




;; ----------------------------------------
;;
;; Custom mappings
;;
;; ----------------------------------------

(global-set-key (kbd "<C-tab>") 'other-window)

;; fast buffer switching
(global-set-key (kbd "s-{") 'next-buffer)
(global-set-key (kbd "s-}") 'previous-buffer)






;; ----------------------------------------
;;
;; Custom functions
;;
;; ----------------------------------------

;; save all buffers
(defun force-save-all ()
  "Unconditionally saves all unsaved buffers."
  (interactive)
  (save-some-buffers t))
;; option-command-s
(global-set-key (kbd "M-s-ß") 'force-save-all)

;;
;; Scroller: scrolling without moving the cursor
;;
(defun scroll-down-keep-cursor () 
   ;; Scroll the text one line down while keeping the cursor 
   (interactive) 
   (scroll-down 1)) 

(defun scroll-up-keep-cursor () 
   ;; Scroll the text one line up while keeping the cursor 
   (interactive) 
   (scroll-up 1)) 

;; control command p
(global-set-key (kbd "C-s-<268632080>") 'scroll-down-keep-cursor)
;; control command n
(global-set-key (kbd "C-s-<268632078>") 'scroll-up-keep-cursor)


(defun kill-buffer-and-delete-window ()
  (interactive)
  (kill-this-buffer)
  (unless (= 1 (count-windows)) (delete-window)))
(global-set-key [(control super k)] 'kill-buffer-and-delete-window)
(global-set-key [(control super clear)] 'kill-buffer-and-delete-window)


;; go to Magit status for an LMP project
(defun lmp-project-dir (project-abbrev)
  (file-name-as-directory
   (expand-file-name
    (format "~/lmp/%s"
            (cadr (assoc project-abbrev '(("ad" "admin")
                                          ("da" "duplicateapi")
                                          ("ds" "degreesearch")
                                          ("ld" "lead_delivery")
                                          ("le" "leadgen_events")
                                          ("lg" "lead_gateway")
                                          ("lr" "lead_resale")
                                          ("om" "offer_match")
                                          ("rp" "reports")
                                          ("tx" "transporter")
                                          ("mk" "market"))))))))
(defun lmp-magit-status (project-abbrev)
  (interactive (list (read-from-minibuffer "Project abbreviation: " nil)))
  (magit-status (lmp-project-dir project-abbrev)))
;; key binding
(global-set-key (kbd "C-x G") 'lmp-magit-status)
