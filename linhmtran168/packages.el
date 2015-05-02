;;; packages.el --- linhmtran168 Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2014 Sylvain Benner
;; Copyright (c) 2014-2015 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defvar linhmtran168-packages
  '(
    ;; package linhmtran168s go here
    sml-mode
    fsharp-mode
    julia-mode
    yaml-mode
    helm-ag
    ag
    )
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(defvar linhmtran168-excluded-packages '()
  "List of packages to exclude.")

;; For each package, define a function linhmtran168/init-<package-linhmtran168>
;;
;; (defun linhmtran168/init-my-package ()
;;   "Initialize my package"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
(defun linhmtran168/init-sml-mode ()
  (use-package sml-mode
    :defer t
    :config
    (progn
      (add-hook 'sml-mode-hook
                (function (lambda ()
                            (setq evil-shift-width 4)))))))

(defun linhmtran168/init-fsharp-mode ())
(defun linhmtran168/init-julia-mode ())
(defun linhmtran168/init-yaml-mode ())
(defun linhmtran168/init-ag ())
(defun linhmtran168/init-helm-ag ())
