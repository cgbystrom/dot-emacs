(add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0")
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-vibrant-ink)))

(add-to-list 'load-path "~/.emacs.d")
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

(setq inhibit-splash-screen t)


(add-to-list 'load-path "~/.emacs.d/yasnippet-0.6.1c")
(require 'yasnippet) ;; not yasnippet-bundle

(yas/initialize)
(yas/load-directory "~/.emacs.d/yasnippet-0.6.1c/snippets")

(add-to-list 'load-path "~/.emacs.d/auto-complete")
(when (require 'auto-complete nil t)
   (require 'auto-complete-yasnippet)
   ;(require 'auto-complete-ruby)
   (require 'auto-complete-css)
 
   (global-auto-complete-mode t)
   ;(set-face-background 'ac-menu-face "lightgray")
   ;(set-face-underline 'ac-menu-face "darkgray")
   ;(set-face-background 'ac-selection-face "steelblue")
   (define-key ac-complete-mode-map "\t" 'ac-expand)
   (define-key ac-complete-mode-map "\r" 'ac-complete)
   (define-key ac-complete-mode-map "\M-n" 'ac-next)
   (define-key ac-complete-mode-map "\M-p" 'ac-previous)
   (setq ac-auto-start 3)
   (setq ac-dwim t)
   (set-default 'ac-sources '(ac-source-yasnippet ac-source-abbrev ac-source-words-in-buffer))
 
   (setq ac-modes
         (append ac-modes
                 '(eshell-mode
                   ;org-mode
                   )))
   ;(add-to-list 'ac-trigger-commands 'org-self-insert-command)
 
   (add-hook 'emacs-lisp-mode-hook
             (lambda ()
               (setq ac-sources '(ac-source-yasnippet ac-source-abbrev ac-source-words-in-buffer ac-source-symbols))))
 
   (add-hook 'eshell-mode-hook
             (lambda ()
               (setq ac-sources '(ac-source-yasnippet ac-source-abbrev ac-source-files-in-current-dir ac-source-words-in-buffer))))
 
   (add-hook 'ruby-mode-hook
             (lambda ()
               (setq ac-omni-completion-sources '(("\\.\\=" ac-source-rcodetools))))))

(set-default-font
     "-outline-Consolas-normal-r-normal-normal-14-97-96-96-c-*-iso8859-1")

;; Turn off word wrap
(setq default-truncate-lines 1)

; Set the window title to Emacs
(setq frame-title-format "Emacs")
; Hide the tool bar
(tool-bar-mode 0)

; Start server (for opening files from the shell in a running Emacs instance)
(server-start)



; Remove word wrap, trunace
; Fix line nubmers http://www.emacswiki.org/emacs/LineNumbers
; Fix auto-save directory