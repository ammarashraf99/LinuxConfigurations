(setq inhibit-startup-message t)
(scroll-bar-mode -1)	;; Disable visible scrollbar
(tool-bar-mode -1)		;; Disable the toolbar
(tooltip-mode -1)		;; Disable tooltips
(set-fringe-mode -1)	;; Give some breathing room
(menu-bar-mode -1)		;; Disable the menu bar
(blink-cursor-mode -1)
(setq tab-width 4)
(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)
(setq make-pointer-invisibile t)
(setq make-backup-files nil) ; stop creating ~ files
(setq backup-directory-alist            '((".*" . "~/.Trash")))

;;(global-hl-line-mode t)
;; This is to highlight the line you are on now

(setq display-time-default-load-average nil)
(display-time-mode 1)
(setq display-time-format " %a %I:%M %p ")


(show-paren-mode 0)






;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;  yas-snippet   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(yas-global-mode 1)
(add-hook 'yas-minor-mode-hook (lambda ()
				 (yas-activate-extra-mode 'fundamental-mode)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; the following is to prevent line highlight in these modes
(dolist (mode '(vterm-mode-hook
		term-mode-hook
		shell-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda () (global-hl-line-mode 0))))


;;Fixing scroll
(setq redisplay-dont-pause t
      scroll-margin 0     ;; This number defines how many lines to scroll on
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)

;; Set up the visible bell
(setq visible-bell t)


;; Set relative number
(setq display-line-numbers-type 'relative)
(display-line-numbers-mode)

;;(column-number-mode)
(global-display-line-numbers-mode t)

;; Font and size
(set-face-attribute 'default nil :font "HackNerdFont" :height 175)

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
;;(global-set-key (kbd "C-x j") 'counsel-switch-buffer)

;; Clear increase text size and decrease
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)


;; Comment line
(global-set-key (kbd "C-x c") 'comment-line)

;; Compile
(global-set-key (kbd "M-c") 'compile)



(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;; my favorite themes
;; [nork]=darktooth=doom-nord-aurora=creamsody=immaterial-dark=inverse-acme=kosmos=
;; labburn=mustang=doom-plain-dark=warm-night=gruber-darker

;;(set-background-color "SlateGrey")
(load-theme 'nord t)
;;flatland gruber-darker zenburn gruvbox-dark-medium  subdued  twilight 
;; mustang



;; Inixialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))


;; Buffers shit here

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))


;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
  package-install 'use-package)

(require 'use-package)
(setq use-package-always-ensure t)


;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
		term-mode-hook
		shell-mode-hook
		eshell-mode-hook
		vterm-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))




(use-package command-log-mode)

(use-package counsel
  :bind (("M-x" . counsel-M-x)
	 ("C-x b" . counsel-ibuffer)
	 ("C-x C-f" . counsel-find-file)
	 :map minibuffer-local-map
	 ("C-r" . 'counsel-minibuffer-history))
  :config
  (setq ivy-initial-inputs-alist nil )) ;; Don't start searches with ^




(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
	 :map ivy-minibuffer-map
	 ("TAB" . ivy-alt-done)
	 ("C-l" . ivy-alt-done)
	 ("C-j" . ivy-next-line)
	 ("C-k" . ivy-previous-line)
	 :map ivy-switch-buffer-map
	 ("C-k" . ivy-previous-line)
	 ("C-l" . ivy-done)
	 ("C-d" . ivy-switch-buffer-kill)
	 :map ivy-reverse-i-search-map
	 ("C-k" . ivy-previous-line)
	 ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

;;(use-package rainbow-delimiters
;;  :hook (prog-mode . rainbow-delimiters-mode))


(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 3))




(use-package ivy-rich
  :config
  (ivy-rich-mode 1))

(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-function-function #'helpful-variable)
  :bind
  ([remap describe-function] . #'helpful-callable)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))
(use-package general
  :config
  (general-create-definer rune/leader-keys
    :keymaps '(normal insert visual emacs)
    :prefix "SPC"
    :global-prefix "C-SPC")

  (rune/leader-keys
    "t"  '(:ignore t :which-key "toggles")
    "tt" '(counsel-load-theme :which-key "choose theme")
    "c" 'compile))
;; the line above makes you do a command "compile" after space-c
;; the line under makes the command empty when respawned
(setq compile-command nil)






;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



















;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Evil ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq evil-want-keybinding nil)
(use-package evil
  :config
  (setq evil-want-integration t)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)
  (evil-mode 1)
  ;; Use visual line motions even outside of visual-line-mode buffers
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))


(setq evil-insert-state-cursor '(box   "white")
      evil-normal-state-cursor '(box "white"))


(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; key-binding theft for seconds
(use-package hydra)

(defhydra hydra-text-scale (:timeout 4)
  "scale text"
  ("j" text-scale-increase "in")
  ("k" text-scale-decrease "out")
  ("f" nil "finished" :exit t))

(rune/leader-keys
  "ts" '(hydra-text-scale/body :which-key "scale text"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Add Magit and projectile here

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org Mode Configuration ------------
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun efs/org-font-setup ()
  ;; Replace list hyphen with dot
  (font-lock-add-keywords 'org-mode
                          '(("^ *\\([-]\\) "
                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

  ;; Set faces for heading levels
  (dolist (face '((org-level-1 . 1.2)
                  (org-level-2 . 1.1)
                  (org-level-3 . 1.05)
                  (org-level-4 . 1.0)
                  (org-level-5 . 1.1)
                  (org-level-6 . 1.1)
                  (org-level-7 . 1.1)
                  (org-level-8 . 1.1)))
    (set-face-attribute (car face) nil :font "FiraCodeNerdFont" :weight 'regular :height (cdr face)))

  ;; Ensure that anything that should be fixed-pitch in Org files appears that way
  ;;(set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-code nil   :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-table nil   :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch))

(use-package org
  :hook (org-mode . efs/org-mode-setup)
  :config
  (setq org-ellipsis " ▾")

  (setq org-agenda-start-with-log-mode t)
  (setq org-log-done 'time)
  (setq org-lot-into-drawer t)

  (setq org-agenda-files
	'("~/Org/myorg.org"))


  (efs/org-font-setup))

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
  ;;:custom
  ;;(org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))
  )
(defun efs/org-mode-visual-fill ()
  (setq visual-fill-column-width 100)
  (visual-fill-column-mode 1))

(use-package visual-fill-column
  :hook (org-mode . efs/org-mode-visual-fill))


(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (python . t)
   (C . t)))
















;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Learn to love the shell   [vterm]   ;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package term
  :config
  (setq explicit-shell-file-name "bash")
  )

(use-package vterm
  :ensure t
  :commands vterm
  :config
  (vterm--set-directory "/home/ammar")
  (setq default-directory "/home/ammar")
  (setq vterm-max-scrollback 10000)
  (setq vterm-kill-buffer-on-exit t))

(use-package multi-vterm)

;; vterm-toggle
(use-package vterm-toggle)
(global-set-key [f2] 'vterm-toggle)
(global-set-key (kbd "C-2") 'vterm-toggle-cd)

;; you can cd to the directory where your previous buffer file exists
;; after you have toggle to the vterm buffer with `vterm-toggle'.
(define-key vterm-mode-map [(control return)]   #'vterm-toggle-insert-cd)

;; show vterm buffer in current window
(setq vterm-toggle-fullscreen-p nil)
(add-to-list 'display-buffer-alist
             '((lambda (buffer-or-name _)
                 (let ((buffer (get-buffer buffer-or-name)))
                   (with-current-buffer buffer
                     (or (equal major-mode 'vterm-mode)
                         (string-prefix-p vterm-buffer-name (buffer-name buffer))))))
               (display-buffer-reuse-window display-buffer-same-window)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;; To make this you need to set it nil ...



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Dired

(use-package dired
  :ensure nil
  :commands (dired dired-jump)
  :bind (("C-x C-j" . dired-jump))
  :custom ((dired-listing-switches "-agho --group-directories-first"))
  :config
  (evil-collection-define-key 'normal 'dired-mode-map
    "h" 'dired-single-up-directory ;; uses single dired
    "l" 'dired-single-buffer))     ;; uses single dired
(use-package dired-single)   ;; It let you have only one dired buffer in the buffer list


;; The following makes it moves deleted files to trash folder
(setq delete-by-moving-to-trash 1) ;; dired related

(use-package dired-hide-dotfiles
  :hook (dired-mode . dired-hide-dotfiles-mode)
  :config
  (evil-collection-define-key 'normal 'dired-mode-map
    "H" 'dired-hide-dotfiles-mode))

(global-set-key (kbd "C-a") nil)
(global-set-key (kbd "C-a c") 'dired-create-empty-file)

;; Defined functions ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun increment-number-at-point ()
  (interactive)
  (skip-chars-backward "0-9")
  (or (looking-at "[0-9]+")
      (error "No number at point"))
  (replace-match (number-to-string (1+ (string-to-number (match-string 0))))))
(global-set-key (kbd "C-x +") 'increment-number-at-point)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; C++
;; (use-package flycheck
;;   :ensure t
;;   :init
;;   (global-flycheck-mode t))

(defun my-c-mode-common-hook ()
  ;; my customizations for all of c-mode, c++-mode, objc-mode, java-mode
  (c-set-offset 'substatement-open 0)
  ;; other customizations can go here

  (setq c++-tab-always-indent t)
  (setq c++-indent-level 4)
  (setq c-basic-offset 4)                  ;; Default is 2
  (setq c-indent-level 4)                  ;; Default is 2

  (setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60))
  (setq tab-width 4)
  (setq indent-tabs-mode t))  ; use spaces only if nil

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)



























;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Email [later]
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; lsp mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C-<tab>") 'completion-at-point)  ;; fricken gooooood (life saver)
(setq lsp-completion-provider :none) ;; make sure this shit is none

;; chick https://emacs-lsp.github.io/lsp-mode/tutorials/how-to-turn-off/
(setq lsp-keymap-prefix "C-c l")
(setq lsp-headerline-breadcrumb-enable nil)
(setq lsp-headerline-breadcrumb-enable-diagnostics nil)
;;(setq lsp-eldoc-enable-hover 1)
(setq lsp-signature-render-documentation nil)
(setq lsp-signature-auto-activate nil) ;; you could manually request them via `lsp-signature-activate`

(setq lsp-enable-symbol-highlighting nil)

(setq lsp-completion-show-detail nil)
(setq lsp-completion-show-kind nil)
(setq lsp-enable-links nil)
(setq lsp-enable-on-type-formatting nil)
(setq lsp-modeline-diagnostics-enable nil)
(setq lsp-diagnostics-provider :none)
;;(setq flycheck-check-syntax-automatically '(save))



(setq package-selected-packages '(lsp-mode yasnippet dap-mode
					   avy which-key ))

(when (cl-find-if-not #'package-installed-p package-selected-packages)
  (package-refresh-contents)
  (mapc #'package-install package-selected-packages))


(which-key-mode)
(add-hook 'c-mode-hook 'lsp)
(add-hook 'c++-mode-hook 'lsp)

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      treemacs-space-between-root-nodes nil
      company-idle-delay 0.0
      company-minimum-prefix-length 1
      lsp-idle-delay 0.1)  ;; clangd is fast

(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
  (yas-global-mode))


;; Clangd notes
;; you can add compile flags to clangd
;; go to ~/.config/clangd/config.yaml
;; and put that there

;; If:
;;   PathMatch: .*\.cpp
;; CompileFlags:
;;   Add: [-std=c++20]
;; ---
;; If:
;;   PathMatch: .*\.cc
;; CompileFlags:
;;   Add: [-std=c++20]

;; note: the three dashes --- are very important
;; The exact indentation is also important

;; try use two spaces only for indentation
;; every time you open a c++ project it will make a .clangd file
;; and put the flag in it.











(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("8bd35dc1843ca4f0ddf0a56e0f1a02b71af49ca3c68a075a27a53e4f3bd431f6" "3c7165ae3c29765af5a544d597be36292df073b7db0e95521492569ca74a7dbe" "2ff9ac386eac4dffd77a33e93b0c8236bb376c5a5df62e36d4bfa821d56e4e20" default))
 '(lsp-vetur-format-options-use-tabs t)
 '(package-selected-packages
   '(espresso-theme ujelly-theme spacemacs-theme twilight-anti-bright-theme twilight-theme grayscale-theme spacegray-theme color-theme-sanityinc-tomorrow clues-theme nezburn-theme modus-themes zenburn-theme phoenix-dark-pink-theme danneskjold-theme busybee-theme warm-night-theme ubuntu-theme subatomic-theme subatomic256-theme sourcerer-theme rimero-theme quasi-monochrome-theme purp-theme oceanic-theme nordic-night-theme northcode-theme nord-theme nordless-theme nofrils-acme-theme nimbus-theme mood-one-theme mustang-theme sexy-monochrome-theme monochrome-theme molokai-theme moe-theme metalheart-theme lavenderless-theme night-owl-theme labburn-theme kooten-theme kosmos-theme inverse-acme-theme immaterial-theme hippo-themes hickey-theme heroku-theme hamburg-theme gotham-theme foggy-night-theme less-theme flucui-themes flatland-black-theme helm-firefox eziam-themes minimal-theme standard-themes creamsody-theme cyberpunk-theme colonoscopy-theme brutalist-theme ample-theme alect-themes ahungry-theme tao-theme zeno-theme exotica-theme lsp-mode c++-mode company ccls arjen-grey-theme almost-mono-themes darkless-theme darktooth-theme constant-theme gruber-darker-theme atom-one-dark-theme kaolin-themes doom-themes doom-modeline timu-rouge-theme tron-legacy-theme timu-spacegrey-theme timu-caribbean-theme kuronami highlight-context-line vs-dark-theme sakura-theme kuronami-theme kanagawa-theme catppuccin-theme vterm-toggle ggtags flycheck multi-vterm shell-here dired-hide-dotfiles dired-open all-the-icons-dired dired-single dired-singl vterm visual-fill-column org-bullets projectile s which-key rainbow-delimiters ivy-rich hydra helpful gruvbox-theme general evil-collection dracula-theme counsel command-log-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'erase-buffer 'disabled nil)
