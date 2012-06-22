;;; Global bindings

(global-set-key "\C-w" 'clipboard-kill-region)
(global-set-key "\M-w" 'clipboard-kill-ring-save)
(global-set-key "\C-y" 'clipboard-yank)

(global-set-key (kbd "C-x m") 'multi-term)
(global-set-key (kbd "C-c t") 'multi-term-next)
(global-set-key (kbd "C-c T") 'multi-term) ;; create a new one

(global-set-key (kbd "<f5>") 'revert-all-buffers)
(global-set-key (kbd "C-c r") 'revert-buffer)
(global-set-key (kbd "<f11>") 'full-screen-toggle)

(global-set-key "\C-xk" 'kill-current-buffer)
(global-set-key (kbd "C-c y") 'bury-buffer)

(global-set-key (kbd "C-x r") 'rgrep)
(global-set-key (kbd "M-g") 'goto-line)

;; Window switching. (C-x o goes to the next window)
(windmove-default-keybindings) ;; Shift+direction
(global-set-key (kbd "C-x O") (lambda () (interactive) (other-window -1))) ;; back one
(global-set-key (kbd "C-x C-o") (lambda () (interactive) (other-window 2))) ;; forward two

;; Font size
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

(eval-after-load "magit"
  (progn '(global-set-key (kbd "C-x g") 'magit-status)))

;; Ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)
