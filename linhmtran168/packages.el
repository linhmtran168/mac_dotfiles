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

(setq linhmtran168-packages
  '(
    ;; package linhmtran168s go here
    sml-mode
    julia-mode
    fsharp-mode
    yaml-mode
    helm-ag
    ag
    ))

(setq linhmtran168-excluded-packages '())

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

(defun linhmtran168/init-julia-mode ())
(defun linhmtran168/init-fsharp-mode ())
(defun linhmtran168/init-yaml-mode ())
(defun linhmtran168/init-ag ())
(defun linhmtran168/init-helm-ag ())
