(defconst xzfred-packages
          '()
  "The list of Lisp packages required by the fidding layer.

Each entry is either:
          ")

(setq xzfred-packages
      '(
        dracula-theme
        )
      )

;; 配置包
;; use-package 装载包
;; :init 在包装载之前执行的代码
;; :config 在包装载之后执行的代码
;; :bind 自定义绑定包快捷键，例如:bind ("C-." . jumpweb-mode))
;; :defer t 自动推迟加载，在空闲时间加载
;; :disabled t 禁用

;; dracula-theme主题
(defun xzfred/init-dracula-theme ()
  (use-package dracula-theme
    :init
    :config
    ;(load-theme 'dracula t)
    ))

;; (setq <layer>-excluded-packages '(package1 package2 ...)
