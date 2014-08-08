(add-hook 'sh-mode-hook
          (lambda ()
            (when (equal (point-min) (point-max))
              (insert-shell-shebang)
              (goto-char (point-max)))))

(defun insert-shell-shebang ()
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (insert "#!/bin/sh\n\n")))
