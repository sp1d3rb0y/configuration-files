;;;;;;;;;;;;;;;;;;;;;;;;;
;; CEDET Configuration ;;
;;;;;;;;;;;;;;;;;;;;;;;;;
;; Load cedet
(load "cedet/common/cedet.el")
(global-ede-mode t)
;;;; Semantic ;;;;
(semantic-load-enable-excessive-code-helpers)
;; Name completion
(require 'semantic-ia)
;; Completion on include files
(require 'semantic-gcc)
;; Remove system symbols from list of objects to search
(setq-mode-local c-mode semanticdb-find-default-throttle
		 '(project unloaded system recursive))
;; Key bindings
(defun my-cedet-hook ()
  (local-set-key [(control return)] 'semantic-ia-complete-symbol-menu)
  (local-set-key "." 'semantic-complete-self-insert)
  (local-set-key ">" 'semantic-complete-self-insert)
  (local-set-key "\C-c?" 'semantic-ia-complete-symbol))
 ;;(local-set-key "\C-c>" 'semantic-complete-analyze-inline)
 ;;(local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle))
(add-hook 'c-mode-common-hook 'my-cedet-hook)

; (custom-set-variables
 ;'(global-semantic-tag-folding-mode t nil (semantic-util-modes))
 ;; FIX FOR BETTER COMPLETION
 ;'(semantic-self-insert-show-complete-function (lambda nil
;						 (semantic-ia-complete-symbol-menu (point)))
 ;)
 ;'(semantic-tag-folding-mode-hook nil))
