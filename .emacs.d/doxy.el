; Doxymacs
(add-to-list 'load-path (concat extensions-path "/doxymacs"))
(require 'doxymacs)
(add-hook 'c-mode-common-hook 'doxymacs-mode)
(add-hook 'c++-mode-common-hook 'doxymacs-mode)
;(add-hook 'python-mode-common-hook 'doxymacs-mode)

(defun my-doxymacs-font-lock-hook ()
  (if ;(or (eq major-mode 'python-mode)
      (or (eq major-mode 'c-mode) (eq major-mode 'c++-mode))
      (doxymacs-font-lock)))
(add-hook 'font-lock-mode-hook 'my-doxymacs-font-lock-hook)
