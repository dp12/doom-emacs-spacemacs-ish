;;; private/spacemacs-ish/config.el -*- lexical-binding: t; -*-

(defvar xdg-data (getenv "XDG_DATA_HOME"))
(defvar xdg-bin (getenv "XDG_BIN_HOME"))
(defvar xdg-cache (getenv "XDG_CACHE_HOME"))
(defvar xdg-config (getenv "XDG_CONFIG_HOME"))

(setq +doom-modeline-buffer-file-name-style 'relative-from-project
      show-trailing-whitespace t

      mu4e-maildir        (expand-file-name "mail" xdg-data)
      mu4e-attachment-dir (expand-file-name "attachments" mu4e-maildir))

(add-hook! minibuffer-setup (setq-local show-trailing-whitespace nil))


;;
;; Keybindings
;;

(map!
 (:leader
   (:prefix "b"
     :desc "bookmark"              :n "j" #'counsel-bookmark
     :desc "buffer delete"         :n "d" #'evil-delete-buffer)
   (:prefix "f"
     :desc "Find file in dotfiles" :n "d" #'+spacemacs-ish/find-in-dotfiles
     :desc "Browse dotfiles"       :n "D" #'+spacemacs-ish/browse-dotfiles
     :desc "dired jump"            :n "j" #'dired-jump
     :desc "save file"             :n "s" #'save-buffer)
   (:prefix "g"
     :desc "magit"                 :n "s" #'magit-status)
   (:prefix "i"
     :desc "Find in git files" :n "g" #'counsel-git
     :desc "Recentf" :n "f" #'counsel-recentf)
   (:prefix "s"
     :desc "imenu"                 :n "j" #'counsel-imenu)
   ))


;;
;; Modules
;;

(after! smartparens
  ;; Auto-close pairs more conservatively
  (let ((unless-list '(sp-point-before-word-p
                       sp-point-after-word-p
                       sp-point-before-same-p)))
    (sp-pair "'"  nil :unless unless-list)
    (sp-pair "\"" nil :unless unless-list))

  ;; ...and expand braces on RET
  (sp-pair "{" nil :post-handlers '(("||\n[i]" "RET"))
           :unless '(sp-point-before-word-p sp-point-before-same-p))
  (sp-pair "(" nil :post-handlers '(("||\n[i]" "RET"))
           :unless '(sp-point-before-word-p sp-point-before-same-p))
  (sp-pair "[" nil :unless '(sp-point-before-word-p sp-point-before-same-p)))

;; feature/evil
(after! evil-mc
  ;; Make evil-mc resume its cursors when I switch to insert mode
  (add-hook! 'evil-mc-before-cursors-created
    (add-hook 'evil-insert-state-entry-hook #'evil-mc-resume-cursors nil t))
  (add-hook! 'evil-mc-after-cursors-deleted
    (remove-hook 'evil-insert-state-entry-hook #'evil-mc-resume-cursors t)))

;; completion/helm
(after! helm
  ;; Hide header lines in helm. I don't like them
  (set-face-attribute 'helm-source-header nil :height 0.1))

;; lang/org
(after! org-bullets
  ;; The standard unicode characters are usually misaligned depending on the
  ;; font. This bugs me. Personally, markdown #-marks for headlines are more
  ;; elegant, so we use those.
(setq org-bullets-bullet-list '("#")))
