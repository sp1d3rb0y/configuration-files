(fset 'yes-or-no-p 'y-or-n-p)

;; remove home page message
(setq inhibit-startup-message t)

;; do not ask confirmation when I want refresh buffer
(setq revert-without-query '(".*"))

;; remove insert shortcut, no more insertion mode
(global-set-key [insert] 'ignore)
(put 'overwrite-mode 'disabled t)
;;
;; disable shortcut C-PageUp & C-PageDown
(global-set-key (kbd "<C-next>") 'ignore)
(global-set-key (kbd "<C-prior>") 'ignore)

;; no more dialog boxes
(setq use-dialog-box nil)
;;
;; no more dialog boxes for files
(setq use-file-dialog nil)

;; no more tooltips (delay of 9999 seconds before displayed)
(setq tooltip-delay 9999)

;; enable up/down case region
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; enable narrow to region (C-x n n) (C-x n w)
;; you can display only the region and do not mess up with rest
(put 'narrow-to-region 'disabled nil)

;; enable goal column (C-x C-n) (C-u C-x C-n)
;; the point will stick with the set column when you go up/down
(put 'set-goal-column 'disabled nil)

;; preserve cursor when scrolling
(setq scroll-preserve-screen-position t)

;;;; NO BACKUP FILE
;(setq backup-inhibited t)
(when annoyances-no-backup-file
  ;; Turn off backup files.
  (setq backup-inhibited t)
  (setq make-backup-files nil)
)

;;;; ALL BACKUP FILE IN DIRECTORY
(when annoyances-backup-file-in-directory
  ;; All backup files goes in a directory.
  (if backup-directory
    (progn
      (setq backup-directory-alist
        `((".*" . ,backup-directory)))
      (setq auto-save-file-name-transforms
        `((".*" ,autosave-directory t)))
      ;;;; no more #foo.bar# files (auto-save file)
      ;;;; I don't want it
      ;; (auto-save-mode nil)
      ) ; (progn
    (progn
      ;; put all backup file in the temporary directory of the system
      (setq backup-directory-alist
        `((".*" . ,temporary-file-directory)))
      ;; put all auto-save file in the temporary directory of the system
      (setq auto-save-file-name-transforms
        `((".*" ,temporary-file-directory t)))
      ) ; (progn
    ) ; (if profile-backup-directory

  (setq backup-by-copying t   ; don't clobber symlinks
    version-control t         ; use version backups
    delete-old-versions t
    kept-new-versions 4
    kept-old-versions 1)
 )
