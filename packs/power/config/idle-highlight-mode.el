(live-add-pack-lib "idle-highlight-mode")
(require 'idle-highlight-mode)
(defun idle-highlight-on ()
  (idle-highlight-mode t))

(add-hook 'js-mode-hook 'idle-highlight-on)
(add-hook 'js2-mode-hook 'idle-highlight-on)
(add-hook 'clojure-mode-hook 'idle-highlight-on)
(add-hook 'html-mode-hook 'idle-highlight-on)
