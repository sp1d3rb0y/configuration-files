;; Yasnippets
(load "yasnippet/yasnippet.el")
(require 'yasnippet)
(yas/initialize)
(setq yas/root-directory (concat extensions-path "/yasnippet/snippets"))
(yas/load-directory yas/root-directory)
