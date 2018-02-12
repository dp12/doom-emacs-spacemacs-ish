;;; private/spacemacs-ish/init.el -*- lexical-binding: t; -*-

;; I've swapped these keys on my keyboard
(setq x-super-keysym 'alt
      x-alt-keysym   'meta

      doom-font (font-spec :family "Input Mono Narrow" :size 14 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "Fira Sans")
      doom-unicode-font (font-spec :family "Input Mono Narrow" :size 14)
      doom-big-font (font-spec :family "Fira Mono" :size 21)

      org-ellipsis " ▼ ")

(add-hook! doom-big-font-mode
           (setq +doom-modeline-height (if doom-big-font-mode 37 29)))
