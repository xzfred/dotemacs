(setq phpplus-packages
      '(
        company
        flycheck
        company-php
        php-mode
        ))
(defun phpplus/post-init-company ()
  (condition-case nil
      (spacemacs|add-company-hook php-mode )
    (error
     ;; try this one:
     (spacemacs|add-company-backends
       :modes php-mode
       :variables
       company-minimum-prefix-length 1000
       :backends  company-ac-php-backend
       )
     )))


(defun phpplus/post-init-company-php ()
  (push 'company-ac-php-backend  company-backends-php-mode)
)



(defun phpplus/post-init-flycheck ()
  ;(spacemacs/enable-flycheck 'php-mode)
  )



(defun phpplus/init-php-mode ()
  (use-package php-mode
    :defer t
    :mode ("\\.php\\'" . php-mode)))

(defun phpplus/init-company-php ()
  (use-package company-php
    :defer t
    :init
    (progn
      ;(add-hook 'php-mode-hook  'ac-php-core-eldoc-setup  )
      (add-hook 'php-mode-hook
            '(lambda ()
               ;(auto-complete-mode t)
               ;(require 'ac-php)
               ;(setq ac-sources  '(ac-source-php ) )
               ;(yas-global-mode 1)

               (ac-php-core-eldoc-setup ) ;; enable eldoc
               (define-key php-mode-map  (kbd "C-]") 'ac-php-find-symbol-at-point)   ;goto define
               (define-key php-mode-map  (kbd "C-t") 'ac-php-location-stack-back)    ;go back
               ))
      )
    )
  )
