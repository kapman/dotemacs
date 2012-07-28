(require 'ibuffer-git)

;;nicely format the ibuffer and include git-status
(setq ibuffer-formats '((mark modified read-only git-status-mini " "
      (name 18 18 :left :elide)
      " "
      (size 9 -1 :right)
      " "
      (git-status 8 8 :left :elide)
      " "
      (mode 16 16 :left :elide)
      " " filename-and-process)))

;; Hide empty buffer groups
(setq ibuffer-show-empty-filter-groups nil)

;; ;; Switch to specified buffer groups
;; (add-hook 'ibuffer-mode-hook
;;           (lambda ()
;;             (ibuffer-switch-to-saved-filter-groups "default")))

;; My own config for ibuffer.
;; (setq ibuffer-saved-filter-groups
;;       (quote (("default"
;;                ("Zulu"
;;                 (filename . "zulu"))
;;                ("Moby"
;;                 (filename . "moby"))
;;                ("Programming"
;;                 (or
;;                  (mode . c-mode)
;;                  (mode . c++-mode)
;;                  (mode . erlang-mode)
;;                  (mode . perl-mode)
;;                  (mode . python-mode)
;;                  (mode . clojure-mode)
;;                  (mode . makefile-gmake-mode)
;;                  (mode . js-mode)))
;;                ("Org"
;;                 (or
;;                  (mode . org-mode)
;;                  (mode . markdown-mode)))
;;                ("Emacs"
;;                 (mode . emacs-lisp-mode))
;;                ("Magit"
;;                 (mode . magit-mode))
;;                ("Documents"
;;                 (or
;;                  (mode . LaTeX-mode)
;;                  (mode . fundamental-mode)))))))
