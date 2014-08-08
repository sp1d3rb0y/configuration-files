; Autopair
(require 'autopair)
(autopair-global-mode)

(add-to-list 'load-path (concat extensions-path "/auto-complete/"))
(require 'auto-complete-config nil t)
(add-to-list 'ac-dictionary-directories (concat extensions-path "/auto-complete/dict/"))
;; Do What I Mean mode
(setq ac-dwim t)
(ac-config-default)
(set-cursor-color "white")

;; custom keybindings to use tab, enter and up and down arrows
(define-key ac-complete-mode-map "\t" 'ac-expand)
(define-key ac-complete-mode-map "\r" 'ac-complete)
(define-key ac-complete-mode-map "\M-n" 'ac-next)
(define-key ac-complete-mode-map "\M-p" 'ac-previous)
