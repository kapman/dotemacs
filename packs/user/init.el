(setq user-full-name "Aamir Kapasi")
(setq user-mail-address "aamirkapasi89@gmail.com")

;; Use M-return to switch between windowed and full-screen modes
(global-set-key (kbd "M-RET") 'ns-toggle-fullscreen)

;; Pop to last mark
(global-set-key (kbd "M-j") 'pop-to-mark-command)

(global-set-key (kbd "C-c r") 'revert-buffer)
(global-set-key (kbd "C-c C-r") 'revert-all-buffers)

(windmove-default-keybindings) ;; Shift+direction
(global-set-key (kbd "C-x O") (lambda () (interactive) (other-window -1))) ;; back one
(global-set-key (kbd "C-x C-o") (lambda () (interactive) (other-window 2))) ;; forward two
