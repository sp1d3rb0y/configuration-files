(defvar dotemacs-path (expand-file-name "~/.emacs.d/"))
(defvar backup-directory (concat (file-name-as-directory dotemacs-path) "backup/"))
(defvar temporary-file-directory (concat (file-name-as-directory dotemacs-path) "backup/"))
(defvar autosave-directory (concat (file-name-as-directory dotemacs-path) "cache/"))
(defvar annoyances-no-backup-file nil)
(defvar annoyances-backup-file-in-directory t)

(load-file (concat (file-name-as-directory dotemacs-path) "emacs.el"))
