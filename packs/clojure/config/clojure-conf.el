;; Config taken from
;; https://github.com/ghoseb/dotemacs/tree/master/packs/clojure
(require 'rainbow-delimiters)
(require 'paredit)
(eval-after-load 'paredit
  '(progn
     (define-key paredit-mode-map (kbd "M-)") 'paredit-forward-slurp-sexp)
     (define-key paredit-mode-map (kbd "M-(") 'paredit-wrap-round)
     (define-key paredit-mode-map (kbd "M-[") 'paredit-wrap-square)))


(dolist (mode '(magit-log-edit-mode
                log-edit-mode
                org-mode
                text-mode
                sass-mode
                yaml-mode
                csv-mode
                espresso-mode
                haskell-mode
                html-mode
                nxml-mode
                sh-mode
                clojure-mode
                lisp-mode
                textile-mode
                markdown-mode
                nrepl-mode)))

(live-add-pack-lib "clojure-mode")
(require 'clojure-mode)

(eval-after-load 'clojure-mode
  '(font-lock-add-keywords
    'clojure-mode `(("(\\(fn\\)[\[[:space:]]"
                     (0 (progn (compose-region (match-beginning 1)
                                               (match-end 1) "λ")
                               nil))))))

(eval-after-load 'clojure-mode
  '(font-lock-add-keywords
    'clojure-mode `(("\\(#\\)("
                     (0 (progn (compose-region (match-beginning 1)
                                               (match-end 1) "ƒ")
                               nil))))))

(eval-after-load 'clojure-mode
  '(font-lock-add-keywords
    'clojure-mode `(("\\(#\\){"
                     (0 (progn (compose-region (match-beginning 1)
                                               (match-end 1) "∈")
                               nil))))))

(eval-after-load 'find-file-in-project
  '(add-to-list 'ffip-patterns "*.clj"))

(add-hook 'clojure-mode-hook
          (lambda ()
            (enable-paredit-mode)
            (rainbow-delimiters-mode)
            (setq buffer-save-without-query t)))

;;Treat hyphens as a word character when transposing words
(defvar clojure-mode-with-hyphens-as-word-sep-syntax-table
  (let ((st (make-syntax-table clojure-mode-syntax-table)))
    (modify-syntax-entry ?- "w" st)
    st))

(defun transpose-words-with-hyphens (arg)
  "Treat hyphens as a word character when transposing words"
  (interactive "*p")
  (with-syntax-table clojure-mode-with-hyphens-as-word-sep-syntax-table
    (transpose-words arg)))

(define-key clojure-mode-map (kbd "M-t") 'transpose-words-with-hyphens)

(setq auto-mode-alist (append '(("\\.cljs$" . clojure-mode))
                              auto-mode-alist))

(live-add-pack-lib "nrepl")
(require 'nrepl)
(add-hook 'nrepl-interaction-mode-hook
          'nrepl-turn-on-eldoc-mode)

(setq nrepl-hide-special-buffers t)
(setq nrepl-tab-command 'indent-for-tab-command)
(setq nrepl-popup-stacktraces-in-repl t)
(add-to-list 'same-window-buffer-names "*nrepl*")
(add-hook 'nrepl-mode-hook 'enable-paredit-mode)
(add-hook 'nrepl-mode-hook (lambda ()
                                  (define-key nrepl-mode-map
                                    (kbd "DEL") 'paredit-backward-delete)
                                  (define-key nrepl-mode-map
                                    (kbd "{") 'paredit-open-curly)
                                  (define-key nrepl-mode-map
                                    (kbd "}") 'paredit-close-curly)
                                  (modify-syntax-entry ?\{ "(}")
                                  (modify-syntax-entry ?\} "){")
                                  (modify-syntax-entry ?\[ "(]")
                                  (modify-syntax-entry ?\] ")[")))



(setq nrepl-port "4005")

(provide 'clojure-config)
