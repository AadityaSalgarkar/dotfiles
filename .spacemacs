;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+disotribution'. For now available distributions are `spacemacs-base'
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

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(csv
     python
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     (unicode-fonts :variables
                    )

     ;; yasnippet
     (auto-completion :variables
                      auto-completion-enable-sort-by-usage t
                      auto-completion-return-key-behavior 'complete
                      auto-completion-tab-key-behavior 'complete
                      auto-completion-idle-delay 0.0
                      auto-completion-minimum-prefix-length 2
                      auto-completion-enable-snippets-in-popup t)

     pdf

     better-defaults
     emacs-lisp
     git
     helm
     ;;lsp
     markdown
     multiple-cursors
     org
     (shell :variables
            shell-default-height 30
            shell-default-position 'right)
     ;;pdf related
     bibtex
     latex
     ;; spelling etc
     c-c++
     spell-checking
     syntax-checking
     version-control
     treemacs)


   ;; List of additional packages that will be installed without being wrapped
   ;; in a layer (generally the packages are installed only and should still be
   ;; loaded using load/require/use-package in the user-config section below in
   ;; this file). If you need some configuration for these packages, then
   ;; consider creating a layer. You can also put the configuration in
   ;; `dotspacemacs/user-config'. To use a local version of a package, use the
   ;; `:location' property: '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(
                                      xclip
                                      (use-package gruvbox-theme
                                        :ensure nil
                                        :config
                                        (progn
                                          (defvar after-load-theme-hook nil
                                            "Hook run after a color theme is loaded using `load-theme'.")
                                          (defadvice load-theme (after run-after-load-theme-hook activate)
                                            "Run `after-load-theme-hook'."
                                            (run-hooks 'after-load-theme-hook))
                                          (defun customize-gruvbox ()
                                            "Customize gruvbox theme"
                                            (if (member 'gruvbox custom-enabled-themes)
                                                (custom-theme-set-faces
                                                 'gruvbox
                                                 '(cursor                 ((t (:foreground "#928374"))))
                                                 '(org-block              ((t (:foreground "#ebdbb2":background "#1c2021" :extend t))))
                                                 '(org-block-begin-line   ((t (:inherit org-block :background "#1d2021" :foreground "#665c54" :extend t))))
                                                 '(org-block-end-line     ((t (:inherit org-block-begin-line))))
                                                 '(org-document-info      ((t (:foreground "#d5c4a1" :weight bold))))
                                                 '(org-document-info-keyword    ((t (:inherit shadow))))
                                                 '(org-document-title     ((t (:foreground "#fbf1c7" :weight bold :height 1.4))))
                                                 '(org-meta-line          ((t (:inherit shadow))))
                                                 '(org-target             ((t (:height 0.7 :inherit shadow))))
                                                 '(org-link               ((t (:foreground "#b8bb26" :background "#32302f" :overline nil))))  ;;
                                                 '(org-indent             ((t (:inherit org-hide))))
                                                 '(org-indent             ((t (:inherit (org-hide fixed-pitch)))))
                                                 '(org-footnote           ((t (:foreground "#8ec07c" :background "#32302f" :overline nil))))
                                                 '(org-ref-cite-face      ((t (:foreground "#fabd2f" :background "#32302f" :overline nil))))  ;;
                                                 '(org-ref-ref-face       ((t (:foreground "#83a598" :background "#32302f" :overline nil))))
                                                 '(org-ref-label-face     ((t (:inherit shadow :box t))))
                                                 '(org-drawer             ((t (:inherit shadow))))
                                                 '(org-property-value     ((t (:inherit org-document-info))) t)
                                                 '(org-tag                ((t (:inherit shadow))))
                                                 '(org-date               ((t (:foreground "#83a598" :underline t))))
                                                 '(org-verbatim           ((t (:inherit org-block :background "#3c3836" :foreground "#d5c4a1"))))
                                                 '(org-code               ((t (:inherit org-verbatim :background "#3c3836" :foreground "#fe8019"))))
                                                 '(org-quote              ((t (:inherit org-block :slant italic))))
                                                 '(org-level-1            ((t (:foreground "#83a598" :background "#282828" :weight bold :height 1.1 :overline nil :extend t)))) ;; Blue
                                                 '(org-level-2            ((t (:foreground "#8ec07c" :background "#282828" :weight bold :height 1.1 :overline nil :extend t)))) ;; Aqua
                                                 '(org-level-3            ((t (:foreground "#b8bb26" :background "#282828" :weight bold :height 1.1 :overline nil :extend t)))) ;; Green
                                                 '(org-level-4            ((t (:foreground "#fabd2f" :background "#282828" :weight bold :height 1.1 :overline nil :extend t)))) ;; Yellow
                                                 '(org-level-5            ((t (:foreground "#fe8019" :background "#282828" :weight bold :height 1.1 :overline nil :extend t)))) ;; Orange
                                                 '(org-level-6            ((t (:foreground "#fb4934" :background "#282828" :weight bold :height 1.1 :overline nil :extend t)))) ;; Red
                                                 '(org-level-7            ((t (:foreground "#d3869b" :background "#282828" :weight bold :height 1.1 :overline nil :extend t)))) ;; Blue
                                                 '(org-headline-done      ((t (:foreground "#928374" :background "#282828" :weight bold :overline nil :extend t)))) ;; Gray
                                                 '(org-ellipsis           ((t (:inherit shadow :height 1.0 :weight bold :extend t))))
                                                 '(org-table              ((t (:foreground "#d5c4a1" :background "#3c3836"))))

                                                 ;; Doom-modeline settings
                                                 '(doom-modeline-evil-insert-state   ((t (:foreground "#b8bb26" :weight bold)))) ;; Green
                                                 '(doom-modeline-evil-emacs-state    ((t (:foreground "#b16286" :weight bold)))) ;; Purple
                                                 '(doom-modeline-evil-normal-state   ((t (:foreground "#83a598" :weight bold)))) ;; Blue
                                                 '(doom-modeline-evil-visual-state   ((t (:foreground "#fbf1c7" :weight bold)))) ;; Beige
                                                 '(doom-modeline-evil-replace-state  ((t (:foreground "#fb4934" :weight bold)))) ;; Red
                                                 '(doom-modeline-evil-operator-state ((t (:foreground "#fabd2f" :weight bold)))) ;; Yellow
                                                 '(mode-line                         ((t (:background "#504945" :foreground "#d5c4a1"))))
                                                 '(mode-line-inactive                ((t (:background "#3c3836" :foreground "#7c6f64"))))
                                                 '(link                              ((t (:foreground "#b8bb26" :overline t))))

                                                 '(line-number                       ((t (:background "#32302f" :foreground "#665c54"))))
                                                 ;; Mu4E mail client faces
                                                 '(mu4e-header-face                  ((t (:foreground "#d5c4a1" :background "#282828"))))
                                                 '(mu4e-replied-face                 ((t (:inherit mu4e-header-face :foreground "#b8bb26"))))
                                                 '(mu4e-draft-face                   ((t (:inherit mu4e-header-face :foreground "#fabd2f"))))
                                                 '(mu4e-link-face                    ((t (:inherit mu4e-face :foreground "#8ec07c" :underline t))))
                                                 '(mu4e-forwarded-face               ((t (:inherit mu4e-header-face :foreground "#80c07c"))))
                                                 '(mu4e-flagged-face                 ((t (:inherit mu4e-header-face))))
                                                 '(mu4e-header-highlight-face        ((t (:underline nil :background "#3c3836"))))
                                                 '(mu4e-unread-face                  ((t (:foreground "#fbf1c7" :weight bold))))  ;; Originally #83a598
                                                 '(mu4e-cited-1-face                 ((t (:foreground "#458588" :slant italic))))
                                                 '(mu4e-cited-2-face                 ((t (:foreground "#689d6a" :slant italic))))
                                                 '(mu4e-cited-3-face                 ((t (:foreground "#98971a" :slant italic))))
                                                 '(mu4e-cited-4-face                 ((t (:foreground "#d79921" :slant italic))))
                                                 '(mu4e-cited-5-face                 ((t (:foreground "#d65d0e" :slant italic))))
                                                 '(mu4e-cited-6-face                 ((t (:foreground "#cc241d" :slant italic))))
                                                 '(mu4e-cited-7-face                 ((t (:foreground "#b16286" :slant italic))))
                                                 '(mu4e-cited-8-face                 ((t (:foreground "#458588" :slant italic))))
                                                 '(mu4e-cited-9-face                 ((t (:foreground "#689d6a" :slant italic))))
                                                 '(mu4e-cited-10-face                 ((t (:foreground "#98971a" :slant italic))))
                                                 '(mu4e-cited-11-face                 ((t (:foreground "#d79921" :slant italic))))
                                                 '(mu4e-cited-12-face                 ((t (:foreground "#d65d0e" :slant italic))))
                                                 '(mu4e-cited-13-face                 ((t (:foreground "#cc241d" :slant italic))))
                                                 '(mu4e-cited-14-face                 ((t (:foreground "#b16286" :slant italic))))
                                                 '(pdf-view-midnight-colors           '("#d5c4a1" . "#282828"))
                                                 )
                                              (setq org-n-level-faces 8)
                                              ) ;; test
                                            )
                                          (add-hook 'after-load-theme-hook 'customize-gruvbox)
                                          )
                                        (load-theme 'gruvbox t)
                                        (enable-theme 'gruvbox)
                                        )

                                      )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only)
  dotspacemacs-configuration-layers
  '((org :variables
         org-enable-hugo-support t))
  )

(defun dotspacemacs/init ()
  (setq compilation-ask-about-save nil)
  (setq custom-theme-directory "~/.emacs.d/themes")
  (setq org-latex-listings 'minted
        org-latex-packages-alist '(("" "minted"))
        org-latex-pdf-process
        '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
          "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
          "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))
  (setq org-latex-minted-options '(("breaklines" "true")
                                   ;;("fontsize" "\\scriptsize")
                                   ("frame" "lines")
                                   ("linenos" "")
                                   ("numbers" "left")
                                   ("numberstyle" "\\tiny")
                                   ("breakanywhere" "true")))
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq compile-command "uv run main.py")
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need to
   ;; compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;;
   ;; WARNING: pdumper does not work with Native Compilation, so it's disabled
   ;; regardless of the following setting when native compilation is in effect.
   ;;
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil
   ;; map kj to esc
   evil-escape-key-sequence "kj"

   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=$HOME/.emacs.d/.cache/dumps/spacemacs-27.1.pdmp
   ;; (default (format "spacemacs-%s.pdmp" emacs-version))
   dotspacemacs-emacs-dumper-dump-file (format "spacemacs-%s.pdmp" emacs-version)

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; Set `read-process-output-max' when startup finishes.
   ;; This defines how much data is read from a foreign process.
   ;; Setting this >= 1 MB should increase performance for lsp servers
   ;; in emacs 27.
   ;; (default (* 1024 1024))
   dotspacemacs-read-process-output-max (* 1024 1024)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. Spacelpa is currently in
   ;; experimental state please use only for testing purposes.
   ;; (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non-nil show the version string in the Spacemacs buffer. It will
   ;; appear as (spacemacs version)@(emacs version)
   ;; (default t)
   dotspacemacs-startup-buffer-show-version t

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; Scale factor controls the scaling (size) of the startup banner. Default
   ;; value is `auto' for scaling the logo automatically to fit all buffer
   ;; contents, to a maximum of the full image height and a minimum of 3 line
   ;; heights. If set to a number (int or float) it is used as a constant
   ;; scaling factor for the default logo size.
   dotspacemacs-startup-banner-scale 'auto

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `recents-by-project' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   ;; The exceptional case is `recents-by-project', where list-type must be a
   ;; pair of numbers, e.g. `(recents-by-project . (7 .  5))', where the first
   ;; number is the project limit and the second the limit on the recent files
   ;; within a project.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Show numbers before the startup list lines. (default t)
   dotspacemacs-show-startup-list-numbers t

   ;; The minimum delay in seconds between number key presses. (default 0.4)
   dotspacemacs-startup-buffer-multi-digit-delay 0.4

   ;; If non-nil, show file icons for entries and headings on Spacemacs home buffer.
   ;; This has no effect in terminal or if "all-the-icons" package or the font
   ;; is not installed. (default nil)
   dotspacemacs-startup-buffer-show-icons nil

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; If non-nil, *scratch* buffer will be persistent. Things you write down in
   ;; *scratch* buffer will be saved and restored automatically.
   dotspacemacs-scratch-buffer-persistent nil

   ;; If non-nil, `kill-buffer' on *scratch* buffer
   ;; will bury it instead of killing.
   dotspacemacs-scratch-buffer-unkillable nil

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(;;tangotango
                         ;;base16-theme
                         gruvbox-dark-hard
                         spacemacs-dark
                         spacemacs-light)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts. The `:size' can be specified as
   ;; a non-negative integer (pixel size), or a floating-point (point size).
   ;; Point size is recommended, because it's device independent. (default 10.0)
   dotspacemacs-default-font '(;;"Fira code"
                               "Fira code"
                               :size 14.0
                               :weight normal
                               :width normal
                               :powerline-scale 1.2)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
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
   ;; (default "C-M-m" for terminal mode, "<M-return>" for GUI mode).
   ;; Thus M-RET should work as leader key in both GUI and terminal modes.
   ;; C-M-m also should work in terminal mode, but not in GUI mode.
   dotspacemacs-major-mode-emacs-leader-key (if window-system "<M-return>" "C-M-m")

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default t) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' to obtain fullscreen
   ;; without external boxes. Also disables the internal border. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes the
   ;; transparency level of a frame background when it's active or selected. Transparency
   ;; can be toggled through `toggle-background-transparency'. (default 90)
   dotspacemacs-background-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Show the scroll bar while scrolling. The auto hide time can be configured
   ;; by setting this variable to a number. (default t)
   dotspacemacs-scroll-bar-while-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but only visual lines are counted. For example, folded lines will not be
   ;; counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers 'relative

   ;; Code folding method. Possible values are `evil', `origami' and `vimish'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'origami

   ;; If non-nil and `dotspacemacs-activate-smartparens-mode' is also non-nil,
   ;; `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil smartparens-mode will be enabled in programming modes.
   ;; (default t)
   dotspacemacs-activate-smartparens-mode t

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; If nil then Spacemacs uses default `frame-title-format' to avoid
   ;; performance issues, instead of calculating the frame title by
   ;; `spacemacs/title-prepare' all the time.
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Color highlight trailing whitespace in all prog-mode and text-mode derived
   ;; modes such as c++-mode, python-mode, emacs-lisp, html-mode, rst-mode etc.
   ;; (default t)
   dotspacemacs-show-trailing-whitespace nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; If non-nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfere with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; Accept SPC as y for prompts if non-nil. (default nil)
   dotspacemacs-use-SPC-as-y t

   ;; If non-nil shift your number row to match the entered keyboard layout
   ;; (only in insert state). Currently supported keyboard layouts are:
   ;; `qwerty-us', `qwertz-de' and `querty-ca-fr'.
   ;; New layouts can be added in `spacemacs-editing' layer.
   ;; (default nil)
   dotspacemacs-swap-number-row nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil

   ;; If nil the home buffer shows the full path of agenda items
   ;; and todos. If non-nil only the file name is shown.
   dotspacemacs-home-shorten-agenda-source nil

   ;; If non-nil then byte-compile some of Spacemacs files.
   dotspacemacs-byte-compile nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env)
  )

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  (yas-global-mode 1)

  )


(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  (require 'pet)
  (add-hook 'python-base-mode-hook 'pet-mode -10)
  )


(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."
  (xclip-mode 1)
  (setq split-height-threshold 0)
  (setq split-width-threshold 120)
  )


;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
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
   '(package-selected-packages
     '(ace-jump-helm-line ace-link ace-window afternoon-theme aggressive-indent
                          alect-themes all-the-icons all-the-icons-gnus
                          ample-theme ample-zen-theme annalist anti-zenburn-theme
                          anzu apropospriate-theme async auctex auctex-latexmk
                          auto-compile auto-highlight-symbol autothemer avy
                          badwolf-theme base16-theme biblio biblio-core
                          bibtex-completion bind-key bind-map
                          birds-of-paradise-plus-theme bubbleberry-theme bui
                          busybee-theme ccls centered-cursor-mode cfrs
                          cherry-blossom-theme chocolate-theme citeproc
                          clang-format clean-aindent-mode clues-theme
                          color-theme-sanityinc-solarized
                          color-theme-sanityinc-tomorrow column-enforce-mode
                          company-auctex company-c-headers company-math
                          company-reftex company-rtags company-statistics
                          company-ycmd compat cpp-auto-include csv-mode
                          cyberpunk-theme dakrone-theme dap-mode darkmine-theme
                          darkokai-theme darktooth-theme dash define-word devdocs
                          diminish dired-quick-sort disaster django-theme
                          doom-themes dotenv-mode dracula-theme drag-stuff
                          dumb-jump editorconfig elisp-def elisp-slime-nav emr epl
                          espresso-theme eval-sexp-fu evil evil-anzu evil-args
                          evil-cleverparens evil-collection evil-easymotion
                          evil-escape evil-evilified-state evil-exchange
                          evil-goggles evil-iedit-state evil-indent-plus evil-lion
                          evil-lisp-state evil-matchit evil-mc evil-nerd-commenter
                          evil-numbers evil-surround evil-tex evil-textobj-line
                          evil-tutor evil-unimpaired evil-vimish-fold
                          evil-visual-mark-mode evil-visualstar exotica-theme
                          expand-region eyebrowse eziam-themes f fancy-battery
                          farmhouse-themes flatland-theme flatui-theme flx flx-ido
                          flycheck flycheck-elsa flycheck-package flycheck-rtags
                          flycheck-ycmd font-lock+ font-utils gandalf-theme
                          gendoxy golden-ratio google-c-style google-translate
                          gotham-theme goto-chg grandshell-theme
                          gruber-darker-theme gruvbox-theme hc-zenburn-theme helm
                          helm-ag helm-bibtex helm-core helm-descbinds helm-lsp
                          helm-make helm-mode-manager helm-org helm-projectile
                          helm-purpose helm-rtags helm-swoop helm-themes helm-xref
                          help-fns+ hemisu-theme heroku-theme hide-comnt
                          highlight-indentation highlight-numbers
                          highlight-parentheses hl-todo holy-mode ht hungry-delete
                          hybrid-mode hydra iedit imenu-list indent-guide info+
                          inkpot-theme inspector ir-black-theme jazz-theme
                          jbeans-theme kaolin-themes ligature light-soap-theme
                          link-hint list-utils lorem-ipsum lsp-docker lsp-mode
                          lsp-origami lsp-pyright lsp-python-ms lsp-treemacs
                          lsp-ui lush-theme lv macrostep madhat2r-theme
                          material-theme math-symbol-lists memoize minimal-theme
                          modus-themes moe-theme molokai-theme monochrome-theme
                          monokai-theme multi-line mustang-theme nameless
                          naquadah-theme noctilux-theme obsidian-theme
                          occidental-theme oldlace-theme omtose-phellack-theme
                          open-junk-file org-ref org-superstar organic-green-theme
                          origami overseer ox-pandoc package-lint pandoc-mode
                          paradox paredit parent-mode parsebib password-generator
                          pcache pcre2el pdf-tools pdf-view-restore
                          persistent-soft persp-mode pfuture
                          phoenix-dark-mono-theme phoenix-dark-pink-theme pkg-info
                          planet-theme popup popwin posframe powerline
                          professional-theme projectile purple-haze-theme queue
                          quickrun railscasts-theme rainbow-delimiters
                          rebecca-theme request request-deferred restart-emacs
                          reverse-theme rtags s seti-theme shut-up smartparens
                          smyx-theme soft-charcoal-theme soft-morning-theme
                          soft-stone-theme solarized-theme soothe-theme space-doc
                          spacegray-theme spaceline spaceline-all-the-icons
                          spacemacs-purpose-popwin spacemacs-whitespace-cleanup
                          spinner string-edit-at-point string-inflection
                          subatomic-theme subatomic256-theme sublime-themes
                          sunny-day-theme symbol-overlay symon tablist
                          tango-2-theme tango-plus-theme tangotango-theme
                          tao-theme term-cursor toc-org toxi-theme treemacs
                          treemacs-evil treemacs-icons-dired treemacs-persp
                          treemacs-projectile twilight-anti-bright-theme
                          twilight-bright-theme twilight-theme ucs-utils
                          ujelly-theme underwater-theme undo-tree unicode-fonts
                          use-package uuidgen vi-tilde-fringe vim-powerline
                          vimish-fold visual-fill-column volatile-highlights
                          which-key white-sand-theme window-purpose winum
                          writeroom-mode ws-butler xclip ycmd zen-and-art-theme
                          zenburn-theme zonokai-emacs))
   '(warning-suppress-log-types '((comp))))
  (custom-set-faces
   ;; custom-set-faces was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   )
  )
