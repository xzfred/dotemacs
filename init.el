;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     go
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or

     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
;;     xzfred
     helm
     yaml
     vimscript
     sql
     python
     (ruby :variables
           ruby-test-runner 'rspec
           ;; ruby-enable-enh-ruby-mode t
           )
     ruby-on-rails
     ibuffer
     rust
     lsp
     (debug :variables debug-additional-debuggers '("remake"))

     (javascript :variables
                 tern-command '("node" "/usr/local/bin/tern")
                 javascript-disable-tern-port-files nil)
     emacs-lisp
     git
     (org :variables
          org-projectile-file nil
          org-tag-alist '(
                          ("#突破" . ?a)
                          ("#挖掘" . ?b)
                          ("#接触" . ?c)
                          ("#测试" . ?t)
                          ("@work" . ?w)
                          ("@home" . ?h)
                          ("laptop" . ?l)
                          ("kindle" . ?k)
                          ("book" . ?z)
                          ("phone" . ?P)
                          ("read" . ?r)
                          ("study" . ?s)
                          ("plan" . ?p)
                          )
          org-todo-keywords '(
                              (sequence "TODO(t!)" "|" "DONE(d@/!)")
                              (sequence "NEXT(n!)" "WAITTING(w!)" "SOMEDAY(s!)" "|" "ABORT(a@/!)")
                              ;; (sequence "REPORT(r)" "BUG(b)" "KNOWNCAUSE(k)" "|" "FIXED(f)")
                              (sequence "|" "CANCELED(c)")
                              ;; (type "进程(p)" "线程(t)" "纤程(q)" "协程(x)" "|")
                              )
          ;; org-bbdb org-bibtex org-gnus org-habit org-info org-irc org-mu4e org-mhe org-rmail org-w3m org-mac-link org-protocol
          org-modules '(org-habit org-float org-w3m org-bbdb org-bibtex org-docview org-gnus org-info org-irc org-mhe org-rmail org-mac-link org-protocol)
          org-directory "~/my/org"
          org-refile-targets (quote (("~/my/org/trash.org" :maxlevel . 1)
                                     ("~/my/org/future.org" :level . 1)))
          org-default-notes-file "~/my/org/note.org"
          org-capture-templates
          '(
            ("n" "New(n)" entry (file+headline "~/my/org/inbox.org" "Inbox") "** %? \nCaptured On: %U \n  %i\n %a" :empty-lines 1) ;
            ("t" "Tasks" entry (file+headline "~/my/org/task.org" "Tasks") "** TODO %^{Task} \n   SCHEDULED: %t\n")
            ("c" "Calendar(c)" entry (file+headline "~/my/org/task.org" "Calendar") "** TODO %? %T\n  %i\n" :empty-lines 1)
            ("i" "Idea(i)" entry (file+headline "~/my/org/note.org" "Ideas") "** %? \nCaptured On: %U\n  %i\n" :empty-lines 1)
            ("r" "Note(r)" entry (file+headline "~/my/org/note.org" "Notes") "** %? \nCaptured On: %U\n  %i\n" :empty-lines 1)
            ("p" "Project(p)" entry (file+headline "~/my/org/project.org" "project/Inbox") "*** TODO  %?\nCaptured On: %U\n  %i\n" :empty-lines 1)

            ("j" "Journal" entry (file+olp+datetree "~/my/org/journal.org") "* %?\nEntered on %U\n  %i\n  %a")
            ;; ("J" "Journal with date" plain (file+olp+datetree+prompt "~/my/org/journal.org") "%K - %a\n%i\n%?\n" :unnarrowed t)
            ;; ("s" "Journal with date, scheduled" entry (file+olp+datetree+prompt "~/my/org/journal.org") "* \n%K - %a\n%t\t%i\n%?\n" :unnarrowed t)

            ("l" "Protocol" entry (file+headline "~/my/org/inbox.org" "Inbox") "** %^{Title}\nSource: %u, %c\n #+BEGIN_QUOTE\n%i\n#+END_QUOTE\n\n\n%?")
            ("L" "Protocol Link" entry (file+headline "~/my/org/inbox.org" "Inbox") "** TODO %? [[%:link][%:description]] \nCaptured On: %U")

            ("b" "Blog" plain (file (concat "~/my/org/wiki/" (format-time-string "%Y-%m-%d.org")))
             (concat "#+startup: showall\n"
                      "#+options: toc:nil\n"
                      "#+begin_export html\n"
                      "---\n"
                      "layout     : post\n"
                      "title      : %^{标题}\n"
                      "categories : %^{类别}\n"
                      "tags       : %^{标签}\n"
                      "---\n"
                      "#+end_export\n"
                      "#+TOC: headlines 2\n"))
            )
          org-publish-project-alist
                '(("blog-org"
                   :base-directory "~/my/org/wiki/"
                   :base-extension "org"
                   :publishing-directory "~/my/home/"
                   :recursive t
                   :htmlized-source t
                   :section-numbers nil
                   :publishing-function org-html-publish-to-html
                   :headline-levels 4
                   :html-extension "html"
                   :body-only t     ; Only export section between <body> </body>
                   :table-of-contents nil
                   )
                  ("blog-static"
                   :base-directory "~/my/org/wiki/"
                   :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|php"
                   :publishing-directory "~/my/home/"
                   :recursive t
                   :publishing-function org-publish-attachment
                   )
                  ("blog" :components ("blog-org" "blog-static")))
          )
     dash markdown emoji gnus imenu-list ibuffer sql html
     (better-defaults :variables better-defaults-move-to-end-of-code-first t)
     ;; keyboard-layout

     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     ;; spell-checking
     ;; syntax-checking
     ;ivy
     ;; (evil-snipe :variables evil-snipe-enable-alternate-f-and-t-behaviors t)
     (osx :variables
          osx-dictionary-dictionary-choice "English"
          osx-use-dictionary-app t)
     ;; themes-megapack
     ;; colors-enable-nyan-cat-progress-bar t 
     (colors :variables colors-enable-rainbow-identifiers t)
     ;; (spacemacs-layouts :variables layouts-enable-autosave t layouts-autosave-delay 300)
     ;; A中文支持
    (chinese :variables
             chinese-default-input-method 'fcitx
             chinese-enable-youdao-dict t
             chinese-enable-fcitx t
             ;; chinese-enable-avy-pinyin nil
             )
     ;; 代码跳转
     (gtags :variables gtags-enable-by-default t)

     (auto-completion :variables
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-sort-by-usage t
                      auto-completion-private-snippets-directory "~/.spacemacs.d/snippets"
                      auto-completion-return-key-behavior 'complete
                      auto-completion-tab-key-behavior 'cycle
                      auto-completion-complete-with-key-sequence nil
                      auto-completion-complete-with-key-sequence-delay 0.1
                      auto-completion-idle-delay 0.2
                      ;; company-show-numbers t

                      ;; auto-completion-complete-with-key-sequence "jk"
                      ;; 
                      spacemacs-default-company-backends '(company-files
                                                           (company-dabbrev-code
                                                            company-gtags
                                                            company-etags
                                                            company-keywords)
                                                            ;; company-capf
                                                            company-dabbrev)
                      )
                      ;; :disabled-for "org"

     ;; 版本控制
     (version-control :variables
                      version-control-diff-tool 'diff-hl
                      version-control-global-margin t
                      version-control-diff-side 'left)
     ;; phpplus
     php
     ycmd
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      yasnippet-snippets
                                      w3m
                                      org-mime
                                      dracula-theme
                                      symbol-overlay
                                      lsp-rust
                                      ;; lsp-php
                                      )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 9)
                                (projects . 9)
                                (bookmarks . 5)
                                (agenda . 5)
                                (todos . 5))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         zenburn
                         spacemacs-light
                         spacemacs-dark
                         leuven
                         ;; dracula
                         )
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Menlo"
                                ;; "Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "home"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 8
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.3
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers t
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (setq tramp-ssh-controlmaster-options
        "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")

  (add-to-list 'load-path "~/.spacemacs.d/my")

(setq configuration-layer--elpa-archives
      '(("melpa-cn" . "http://elpa.zilongshanren.com/melpa/")
        ("org-cn"   . "http://elpa.zilongshanren.com/org/")
        ;; ("SC"   . "http://joseito.republika.pl/sunrise-commander/")
        ("gnu-cn"   . "http://elpa.zilongshanren.com/gnu/")))

)

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  (require 'php-doc-block)
  (setq calendar-week-start 1)            ;设置星期一为每周的第一天
  (with-eval-after-load 'helm
    (setq helm-display-function 'helm-default-display-buffer)) ;;
  (setq org-agenda-files (list "~/my/org/"))
  ;; (setq face-font-rescale-alist '(("Menlo" . 1.2) ("苹方-简" . 1.2)))
  (spacemacs//set-monospaced-font "Menlo" "苹方-简" 13 16)
  ;; (global-set-key (kbd "SPC-v") 'youdao-dictionary-search-at-point+)
  (spacemacs/set-leader-keys "xh" 'youdao-dictionary-search-at-point+)
  (spacemacs/declare-prefix "xx" "youdao-dictionary")
  (spacemacs/set-leader-keys "xyh" 'youdao-dictionary-search-at-point+)
  (spacemacs/set-leader-keys "xyy" 'youdao-dictionary-search-at-point)
  (spacemacs/set-leader-keys "xyv" 'youdao-dictionary-play-voice-at-point)
  (global-pangu-spacing-mode -1)

  (spacemacs/set-leader-keys "si" 'symbol-overlay-put)
  (spacemacs/declare-prefix "sm" "symbol-overlay")
  (spacemacs/set-leader-keys "sma" 'symbol-overlay-remove-all)
  (spacemacs/set-leader-keys "smn" 'symbol-overlay-switch-forward)
  (spacemacs/set-leader-keys "smp" 'symbol-overlay-switch-backward)
  (spacemacs/set-leader-keys "smt" 'symbol-overlay-mode)

  (global-company-mode)
  (setq mm-text-html-renderer 'w3m)

  (with-eval-after-load 'lsp-mode
    (setq lsp-rust-rls-command '("rustup" "run" "nightly" "rls"))
    (require 'lsp-rust)
    )
  (require 'lsp-rust)
  ;; (setq lsp-rust-rls-command '("rustup" "run" "nightly" "rls"))
  (add-hook 'rust-mode-hook #'lsp-rust-enable)
  (add-hook 'rust-mode-hook #'flycheck-mode)

  ;; (require 'lsp-php)
  ;; (add-hook 'php-mode-hook #'lsp-php-enable)
  ;; (add-hook 'php-mode-hook #'flycheck-mode)
  ;; (setq lsp-php-language-server-command '("/usr/local/bin/php" "/Users/xuzhi/php/vendor/bin/php-language-server.php"))


  ;; (setq ycmd-server-command '("python" '(file-truename "~/my/vim/plugged/YouCompleteMe/third_party/ycmd/ycmd/")))
  ;(setq ycmd-global-config (file-truename "~/ycmd_global_config.py"))
  ;;                             ;; "/User/fred/my/vim/plugged/YouCompleteMe/third_party/ycmd/ycmd"))
  ;; (setq ycmd-force-semantic-completion t)
  ;(add-hook 'rust-mode-hook 'ycmd-mode)

  ;;; 设置等待server的时间，默认是3s
  ;(setq ycmd-startup-timeout 45)
  ;;; show debug info to *Messages* buffer
  (setq url-show-status t)
  (setq exec-path-from-shell-check-startup-files nil)

  ;; (set-variable 'ycmd-global-config "")
  ;; (set-variable
  ;;  'ycmd-server-command
  ;;  '("python" "/Users/fred/my/vim/plugged/YouCompleteMe/third_party/ycmd/ycmd/"))
  ;; (set-variable 'ycmd-global-modes 'all)
  ;; (set-variable 'ycmd-parse-conditions
  ;;               '(save new-line mode-enabled idle-change buffer-focus))
  ;; (set-variable 'ycmd-rust-src-path "/User/fred/.rustup/toolchains/nightly-x86_64-apple-darwin/lib/rustlib/src/rust/src")
  (spacemacs/helm-gtags-define-keys-for-mode 'php-mode)
  ;(set-variable 'ycmd-global-config "")
  ;(set-variable 'ycmd-server-command '("python" "/Users/fred/my/vim/plugged/YouCompleteMe/third_party/ycmd/ycmd/"))
  
  ;(setq ycmd-server-command '())
  ;(push (file-truename "~/my/vim/plugged/YouCompleteMe/third_party/ycmd/ycmd/") ycmd-server-command)
  ;(push "python" ycmd-server-command)
  ;; (set-variable 'ycmd-extra-conf-whitelist '("~/repos/*"))
  ;; (set-variable 'ycmd-global-modes 'all)
  ;; (set-variable 'ycmd-parse-conditions '(save new-line mode-enabled idle-change buffer-focus))
  ;; (setq ycmd-rust-src-path (file-truename "~/.rustup/toolchains/nightly-x86_64-apple-darwin/lib/rustlib/src/rust/src"))

  (setq gnus-secondary-select-methods
        '(
          (nnimap "mxtrip"
                  (nnimap-address
                   "imap.exmail.qq.com")
                  (nnimap-server-port 993)
                  (nnimap-stream ssl))
          ))

  ;; Send email via Gmail:
  (setq message-send-mail-function 'smtpmail-send-it
        smtpmail-stream-type 'ssl
        ;; smtpmail-starttls-credentials '(("smtp.qq.com" 465 "xxx" "yyy"))
        ;; smtpmail-auth-credentials '(("smtp.qq.com" 465 "xxx" "yyy"))
        smtpmail-smtp-server "hwsmtp.exmail.qq.com"
        smtpmail-smtp-service 465
        smtpmail-default-smtp-server "hwsmtp.exmail.qq.com")

  ;; Archive outgoing email in Sent folder on imap.gmail.com:
  (setq gnus-message-archive-method '(nnimap "imap.exmail.qq.com")
        gnus-message-archive-group "[mxtrip]/Sent Mail")

  ;; set return email address based on incoming email address
  (setq gnus-posting-styles
        '(((header "to" "address@mxtrip.cn")
           (address "address@mxtrip.cn"))
          ((header "to" "address@gmail.com")
           (address "address@gmail.com"))))

  ;; store email in ~/gmail directory
  (setq nnml-directory "~/Mail/mxtrip")
  (setq message-directory "~/Mail/mxtrip")
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#d2ceda" "#f2241f" "#67b11d" "#b1951d" "#3a81c3" "#a31db1" "#21b8c7" "#655370"])
 '(custom-safe-themes
   (quote
    ("fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" default)))
 '(evil-want-Y-yank-to-eol nil)
 '(fci-rule-column 100)
 '(org-agenda-files (quote ("~/my/org/TODO.org")))
 '(package-selected-packages
   (quote
    (lsp-rust lsp-php lsp-mode go-guru go-eldoc company-go go-mode tiny symbol-overlay company-ycmd ycmd projectile-rails inflections feature-mode enh-ruby-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake minitest chruby bundler inf-ruby company-dict flycheck-ycmd request-deferred deferred toml-mode racer flycheck-rust cargo rust-mode sunrise-x-buttons sunrise-x-tree sunrise-x-tabs sunrise-commander zenburn-theme zen-and-art-theme underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme seti-theme reverse-theme railscasts-theme purple-haze-theme professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme naquadah-theme mustang-theme monokai-theme monochrome-theme moe-theme minimal-theme material-theme majapahit-theme madhat2r-theme lush-theme light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme heroku-theme hemisu-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gandalf-theme flatui-theme flatland-theme farmhouse-theme espresso-theme django-theme darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme apropospriate-theme ample-zen-theme ample-theme alect-themes afternoon-theme helm-w3m w3m xpm org-mime youdao-dictionary names chinese-word-at-point pangu-spacing find-by-pinyin-dired fcitx ace-pinyin pinyinlib hc-zenburn-theme anti-zenburn-theme evil-multiedit ncl-mode molokai-theme yasnippet-snippets yapfify yaml-mode xterm-color ws-butler winum which-key web-mode web-beautify volatile-highlights vimrc-mode vi-tilde-fringe uuidgen use-package unfill toc-org tagedit sql-indent spaceline smeargle slim-mode shell-pop scss-mode sass-mode reveal-in-osx-finder restart-emacs rainbow-mode rainbow-identifiers rainbow-delimiters pyvenv pytest pyenv-mode py-isort pug-mode popwin pip-requirements persp-mode pcre2el pbcopy paradox osx-trash osx-dictionary orgit org-projectile org-present org-pomodoro org-download org-bullets open-junk-file neotree mwim multi-term move-text mmm-mode markdown-toc magit-gitflow macrostep lorem-ipsum livid-mode live-py-mode linum-relative link-hint less-css-mode launchctl json-mode js2-refactor js-doc info+ indent-guide imenu-list ibuffer-projectile hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-gtags helm-gitignore helm-flx helm-descbinds helm-dash helm-css-scss helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gh-md ggtags fuzzy flycheck-pos-tip flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help emoji-cheat-sheet-plus emmet-mode elisp-slime-nav dumb-jump dracula-theme diminish diff-hl dash-at-point dactyl-mode cython-mode company-web company-tern company-statistics company-php company-emoji company-anaconda column-enforce-mode color-identifiers-mode coffee-mode clean-aindent-mode auto-yasnippet auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(paradox-github-token t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:foreground "#DCDCCC" :background "#3F3F3F")))))
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#d2ceda" "#f2241f" "#67b11d" "#b1951d" "#3a81c3" "#a31db1" "#21b8c7" "#655370"])
 '(custom-safe-themes
   (quote
    ("fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" default)))
 '(evil-want-Y-yank-to-eol nil)
 '(fci-rule-column 100)
 '(magit-git-executable "/usr/local/bin/git")
 '(org-agenda-files (quote ("~/my/org/TODO.org")))
 '(package-selected-packages
   (quote
    (seeing-is-believing prettier-js lsp-go helm-org-rifle helm-git-grep doom-modeline eldoc-eval shrink-path chinese-conv lsp-rust lsp-php lsp-mode go-guru go-eldoc company-go go-mode tiny symbol-overlay company-ycmd ycmd projectile-rails inflections feature-mode enh-ruby-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake minitest chruby bundler inf-ruby company-dict flycheck-ycmd request-deferred deferred toml-mode racer flycheck-rust cargo rust-mode sunrise-x-buttons sunrise-x-tree sunrise-x-tabs sunrise-commander zenburn-theme zen-and-art-theme underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme seti-theme reverse-theme railscasts-theme purple-haze-theme professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme naquadah-theme mustang-theme monokai-theme monochrome-theme moe-theme minimal-theme material-theme majapahit-theme madhat2r-theme lush-theme light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme heroku-theme hemisu-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gandalf-theme flatui-theme flatland-theme farmhouse-theme espresso-theme django-theme darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme apropospriate-theme ample-zen-theme ample-theme alect-themes afternoon-theme helm-w3m w3m xpm org-mime youdao-dictionary names chinese-word-at-point pangu-spacing find-by-pinyin-dired fcitx ace-pinyin pinyinlib hc-zenburn-theme anti-zenburn-theme evil-multiedit ncl-mode molokai-theme yasnippet-snippets yapfify yaml-mode xterm-color ws-butler winum which-key web-mode web-beautify volatile-highlights vimrc-mode vi-tilde-fringe uuidgen use-package unfill toc-org tagedit sql-indent spaceline smeargle slim-mode shell-pop scss-mode sass-mode reveal-in-osx-finder restart-emacs rainbow-mode rainbow-identifiers rainbow-delimiters pyvenv pytest pyenv-mode py-isort pug-mode popwin pip-requirements persp-mode pcre2el pbcopy paradox osx-trash osx-dictionary orgit org-projectile org-present org-pomodoro org-download org-bullets open-junk-file neotree mwim multi-term move-text mmm-mode markdown-toc magit-gitflow macrostep lorem-ipsum livid-mode live-py-mode linum-relative link-hint less-css-mode launchctl json-mode js2-refactor js-doc info+ indent-guide imenu-list ibuffer-projectile hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-gtags helm-gitignore helm-flx helm-descbinds helm-dash helm-css-scss helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gh-md ggtags fuzzy flycheck-pos-tip flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help emoji-cheat-sheet-plus emmet-mode elisp-slime-nav dumb-jump dracula-theme diminish diff-hl dash-at-point dactyl-mode cython-mode company-web company-tern company-statistics company-php company-emoji company-anaconda column-enforce-mode color-identifiers-mode coffee-mode clean-aindent-mode auto-yasnippet auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(paradox-github-token t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:foreground "#DCDCCC" :background "#3F3F3F")))))
)
