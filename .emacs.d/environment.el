;; For console
;(normal-erase-is-backspace-mode nil)

;(setq auto-save-default nil)

;; increase the size of the log *Messages*
(custom-set-variables
  '(message-log-max 1000))

(column-number-mode t)

(show-paren-mode t)

;; ignore case when reading a file name completion
(setq read-file-name-completion-ignore-case t)
;; ignore case when reading a buffer name
(setq read-buffer-completion-ignore-case t)

; Auto-fill-mode
;(add-hook 'text-mode-hook 'turn-on-auto-fill)
;(setq-default auto-fill-function 'do-auto-fill)

; les tab font 2 espaces
(setq tab-width 4)
; indentation par pas de 2 espaces
(setq standard-indent 4)

; Delete trailing whitespaces on save
(add-hook 'write-file-hooks 'delete-trailing-whitespace)
(add-hook 'text-mode-hook (lambda ()
                            (remove-hook 'write-file-hooks 'delete-trailing-whitespace)))
(add-hook 'fundamental-mode-hook (lambda ()
                            (remove-hook 'write-file-hooks 'delete-trailing-whitespace)))
