(eval-after-load "sgml-mode"
  '(progn
     (require 'tagedit)
     (tagedit-add-paredit-like-keybindings)
     (add-hook 'html-mode-hook (lambda () (tagedit-mode 1)))))

(define-key html-mode-map (kbd "C-)") 'tagedit-forward-slurp-tag)
(define-key html-mode-map (kbd "C-(") 'tagedit-forward-barf-tag)
(define-key html-mode-map (kbd "M-r") 'tagedit-raise-tag)
(define-key html-mode-map (kbd "C-k") 'tagedit-kill)
(define-key html-mode-map (kbd "s-k") 'tagedit-kill-attribute)
