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

;; Switch to the most recently selected buffer
(global-set-key (kbd "M-`") 'mode-line-other-buffer)

(defmacro align-on (str)
  `(lambda (b e)
     (interactive "r")
     (align-regexp b e (concat "\\(\\s-*\\)" ,str) 1 1)))

;; align on =
(global-set-key (kbd "C-M-=") (align-on "="))

;; align on :
(global-set-key (kbd "C-M-;") (align-on ":"))

(defun refer-window ()
  "Clears other windows, split current window horizontally
 and set focus in the new frame"
  (interactive)
  (let ((num (window-number)))
    (delete-other-windows)
    (split-window-horizontally)
    (when (equal num (window-number))
      (other-window 1))))

(global-set-key (kbd "C-x C-1") 'refer-window)

(global-set-key (kbd "C-S-k") 'kill-whole-line)
