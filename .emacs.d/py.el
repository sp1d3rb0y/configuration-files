;; Custom Hooks : add Shebang at top of file
(add-hook 'python-mode-hook
          (lambda ()
            (when (equal (point-min) (point-max))
              (insert-python-shebang)
              (goto-char (point-max)))))

(defun insert-python-shebang ()
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (insert "#!/usr/bin/python\n\n")))

;; Autocomplete simple quotes
;; (add-hook 'python-mode-hook
;; 	  (lambda ()
;; 	    (define-key python-mode-map "'" 'skeleton-pair-insert-maybe)))

;; fgallina/python.el
(require 'python "python.el")

;; pymacs
;(require 'pymacs "pymacs.el")

;; Ropemacs
(defun setup-ropemacs ()
  "Setup the ropemacs harness"
  ;; If PYTHONPATH is set and not an empty string
  (if (and (getenv "PYTHONPATH") (not (string= (getenv "PYTHONPATH") "")))
      ;; append at the end with separator
      (setenv "PYTHONPATH"
	      (concat
	       (getenv "PYTHONPATH") path-separator
	       (concat dotemacs-path "/python-libs")))
    ;; else set it without separator
    (setenv "PYTHONPATH"
	    (concat dotemacs-path "/python-libs"))
  )

  (autoload 'jedi:setup "jedi" nil t)

  ;(pymacs-load "ropemacs" "rope-")

  ;; Stops from erroring if there's a syntax err
  ;(setq ropemacs-codeassist-maxfixes 3)

  ;; Configurations
  ;(setq ropemacs-guess-project t)
  ;; Fix Spiderboy : Autocreate project
  ;(setq ropemacs-autocreate-project t)
  ;(setq ropemacs-enable-autoimport t)

  ;(setq ropemacs-autoimport-modules '("os" "shutil" "logging"))

  ;; Adding hook to automatically open a rope project if there is one
  ;; in the current or in the upper level directory
   ;; (add-hook 'python-mode-hook
   ;;          (lambda ()
   ;;            (cond ((file-exists-p ".ropeproject")
   ;;                   (rope-open-project default-directory))
   ;;                  ((file-exists-p "../.ropeproject")
   ;;                   (rope-open-project (concat default-directory "..")))
   ;; 		    (t
   ;; 		     (rope-open-project default-directory))
   ;;                  )))
)

; IPython integration with fgallina/python.el
;; (defun epy-setup-ipython ()
;;   "Setup ipython integration with python-mode"
;;   (interactive)

;;   (setq
;;    python-shell-interpreter "ipython"
;;    python-shell-interpreter-args ""
;;    python-shell-prompt-regexp "In \[[0-9]+\]: "
;;    python-shell-prompt-output-regexp "Out\[[0-9]+\]: "
;;    python-shell-completion-setup-code ""
;;    python-shell-completion-string-code "';'.join(get_ipython().complete('''%s''')[1])\n")
;;   )

;; Python or python mode?
(eval-after-load 'python
  '(progn
     ;;==================================================
     ;; Ropemacs Configuration
     ;;==================================================
     (setup-ropemacs)

     ;; Virtualenv Commands

     ;; Flymake
   )
)

; Jedi
(setq jedi:setup-keys t)
(setq jedi:complete-on-dot t)
(add-hook 'python-mode-hook 'jedi:setup)

;; Cython Mode
(autoload 'cython-mode "cython-mode" "Mode for editing Cython source files")
(add-to-list 'auto-mode-alist '("\\.pyx\\'" . cython-mode))
(add-to-list 'auto-mode-alist '("\\.pxd\\'" . cython-mode))
(add-to-list 'auto-mode-alist '("\\.pxi\\'" . cython-mode))

;; Py3 files
(add-to-list 'auto-mode-alist '("\\.py3\\'" . python-mode))

(add-hook 'python-mode-hook '(lambda ()
     (define-key python-mode-map "\C-m" 'newline-and-indent)))
(add-hook 'ein:notebook-python-mode-hook
	  (lambda ()
	    (define-key python-mode-map "\C-m" 'newline)))

; ropemacs Integration with auto-completion
;; (defun ac-ropemacs-candidates ()
;;   (mapcar (lambda (completion)
;;       (concat ac-prefix completion))
;;     (rope-completions)))

;; (ac-define-source nropemacs
;;   '((candidates . ac-ropemacs-candidates)
;;     (symbol     . "p")))

;; (ac-define-source nropemacs-dot
;;   '((candidates . ac-ropemacs-candidates)
;;     (symbol     . "p")
;;     (prefix     . c-dot)
;;     (requires   . 0)))

;; (defun ac-nropemacs-setup ()
;;   (setq ac-sources (append '(ac-source-nropemacs
;;                              ac-source-nropemacs-dot) ac-sources)))
;; (defun ac-python-mode-setup ()
;;   (add-to-list 'ac-sources 'ac-source-yasnippet))

;; (add-hook 'python-mode-hook 'ac-python-mode-setup)
;; (add-hook 'rope-open-project-hook 'ac-nropemacs-setup)

;; Rope bindings
; enable_autoimport
; Rope project root folder
; Project not exists in
;; (add-hook 'python-mode-hook
;; 	  (lambda ()
;; 	    (define-key python-mode-map "\C-ci" 'rope-auto-import)
;; 	    (define-key python-mode-map "\C-c\C-d" 'rope-show-calltip)
;; 	    )
;; )

; Yasnippet integration
;; Disabling Yasnippet completion
;; (defun epy-snips-from-table (table)
;;   (with-no-warnings
;;     (let ((hashtab (ac-yasnippet-table-hash table))
;;           (parent (ac-yasnippet-table-parent table))
;;           candidates)
;;       (maphash (lambda (key value)
;;                  (push key candidates))
;;                hashtab)
;;       (identity candidates)
;;       )))

;; (defun epy-get-all-snips ()
;;   (require 'yasnippet) ;; FIXME: find a way to conditionally load it
;;   (let (candidates)
;;     (maphash
;;      (lambda (kk vv) (push (epy-snips-from-table vv) candidates)) yas/tables)
;;     (apply 'append candidates))
;;   )

;;(setq ac-ignores (concatenate 'list ac-ignores (epy-get-all-snips)))
