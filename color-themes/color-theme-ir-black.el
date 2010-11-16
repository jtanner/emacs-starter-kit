;; MIT License Copyright (c) 2009 Burke Libbey <burke@burkelibbey.org>

(defun color-theme-ir-black ()
  (interactive)

  (let ((*normal*       "#F6F3E8")
        (*background*   "#000000")
        (*cursor*       "#FFA560")
        (*mouse*        "sienna1")
        (*region*       "#66B5FF")
        (*current-line* "#2E2E2E")
        (*string*       "#A8FF60")
        (*keyword*      "#66B5FF")
        (*method*       "#FFB774")
        (*comment*      "#7C7C7C")
        (*constant*     "#99CC99")
        (*red*          "#FF6C60")
        (*operator*     "#FFFFFF")
        (*class*        "#FFFFB6")
        (*variable*     "#C6C5FE"))

    (flet ((color (fgcolor &optional (bgcolor nil) (bold nil) (italic nil) (underline nil))
                  `((t (,@(if fgcolor   `(:foreground ,fgcolor))
                        ,@(if bgcolor   `(:background ,bgcolor))
                        ,@(if bold      '(:bold       t))
                        ,@(if italic    '(:italic     t))
                        ,@(if underline '(:underline  t))))))
           (face (face &rest args)
                 `(,(intern (concat "font-lock-" face "-face"))
                   ,(apply #'color args))))

      (color-theme-install
       `(color-theme-ir-black
         ((background-color . ,*background*)
          (background-mode  . dark)
          (border-color     . ,*background*)
          (cursor-color     . ,*cursor*)
          (foreground-color . ,*normal*)
          (mouse-color      . ,*mouse*))
         (default ,(color *normal* *background*))
         (blue ,(color "blue"))
         (border-glyph ((t (nil))))
         (buffers-tab ,(color *normal* *background*))
         ,(face "builtin" *normal*)
         ,(face "comment" *comment*)
         ,(face "constant" *constant*)
         ,(face "doc-string" *string*)
         ,(face "function-name" *method*)
         ,(face "keyword" *keyword*)
         ,(face "preprocessor" *keyword*)
         ,(face "reference" "#99CC99")
         ,(face "regexp-grouping-backslash" *red*)
         ,(face "regexp-grouping-construct" *red*)
         ,(face "string" *string*)
         ,(face "type" "#FFB774")
         ,(face "variable-name" *variable*)
         ,(face "warning" "white" *red*)
         (gui-element ,(color *background* "#D4D0C8"))
         (region ,(color "black" *region*))
         (mode-line ,(color "black" "#FFFF77"))
         (highlight ,(color nil *current-line*))
         (highline-face ,(color nil *current-line*))
         (italic ((t (nil))))
         (left-margin ((t (nil))))
         (text-cursor ,(color *background* "yellow"))
         (toolbar ((t (nil))))
         (bold ((t (:bold t))))
         (bold-italic ((t (:bold t))))
         (underline ((nil (:underline nil)))))))))

(provide 'color-theme-ir-black)
