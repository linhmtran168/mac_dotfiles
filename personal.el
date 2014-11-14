;;; Default settings
(prelude-require-packages '(color-theme-sanityinc-tomorrow evil-nerd-commenter
                          evil-matchit evil-leader evil-jumper emmet-mode
                          paradox sml-mode))

;; Default theme
(load-theme 'sanityinc-tomorrow-eighties t)

;;; Slime
(setq slime-default-lisp 'clisp)


;;; Evil settings
(setq evil-shift-width 2)

;; Cursor color
(setq evil-emacs-state-cursor '("slate blue" box))
(setq evil-normal-state-cursor '("deep sky blue" box))
(setq evil-visual-state-cursor '("orange" box))
(setq evil-insert-state-cursor '("red" bar))
(setq evil-replace-state-cursor '("firebrick" bar))
(setq evil-operator-state-cursor '("lime green" hollow))

;; Setup leader
(setq evil-leader/in-all-states 1)
(global-evil-leader-mode)
(evil-leader/set-leader ",")


;;; Helm
(helm-mode 1)
(evil-leader/set-key "f" 'helm-recentf)
(eval-after-load 'helm
  '(progn
     (define-key helm-map (kbd "M-o") 'helm-previous-source)))


;; Browsing wrapped lines
(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

;;; Evil nerd commenter
(evilnc-default-hotkeys)

;;; Evil Ace Jump
(evil-leader/set-key "," 'evil-ace-jump-word-mode) ; ,e for Ace Jump (word)
(evil-leader/set-key "l" 'evil-ace-jump-line-mode) ; ,l for Ace Jump (line)
(evil-leader/set-key "x" 'evil-ace-jump-char-mode) ; ,x for Ace Jump (char)


;;; Haskell Mode
(eval-after-load "haskell-mode"
  '(progn
     (define-key haskell-mode-map (kbd "C-x C-d") nil)
     (define-key haskell-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
     (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-file)
     (define-key haskell-mode-map (kbd "C-c C-b") 'haskell-interactive-switch)
     (define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
     (define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)
     (define-key haskell-mode-map (kbd "C-c M-.") nil)
     (define-key haskell-mode-map (kbd "C-c C-d") nil)))

(add-hook 'haskell-mode-hook
          (function (lambda ()
            (setq evil-shift-width 4))))

;;; SML mode
(add-hook 'sml-mode-hook
          (function (lambda ()
            (setq indent-tabs-mode nil)
            (setq evil-shift-width 4))))


;;; Emmet mode
(evil-leader/set-key "e" 'emmet-expand-line)
(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook 'emmet-mode)

;;; personal.el ends here
