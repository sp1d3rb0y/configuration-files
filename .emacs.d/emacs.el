(message "[+] Loading init file")

;; add to load path the .emacs directory
(defvar extensions-path (concat dotemacs-path "/extensions"))
(setq load-path (cons dotemacs-path load-path))
(setq load-path (cons extensions-path load-path))

;; Environment
(load "environment.el")

;; Functions
(load "doxy.el")
(load "snippets.el")

;; Completion
; (load "cedet.el")
(load "autocomplete.el")

;; Languages
(load "latex.el")
(load "cpp.el")
(load "sh.el")
(load "py.el")

;; Selection

;; Display, Interface
(load "interface.el")

;; Keybindings, shortcuts : See autocomplete and std-headers
(load "keys.el")

;; Mouse

;; Annoyances
(load "annoyances.el")

;; Misc
(load "misc.el")

;; Custom
(load "std-header.el")

;; End : If errors, switch to buffer
(when (get-buffer "*Warnings*")
  (switch-to-buffer "*Warnings*"))
