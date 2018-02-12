;;; private/spacemacs-ish/autoload.el -*- lexical-binding: t; -*-

;;;###autoload (autoload '+spacemacs-ish/find-in-dotfiles "private/spacemacs-ish/autoload/spacemacs-ish" nil t)
(+default--def-find-in!   dotfiles (expand-file-name "~/.dotfiles") +spacemacs-ish)
;;;###autoload (autoload '+spacemacs-ish/browse-dotfiles "private/spacemacs-ish/autoload/spacemacs-ish" nil t)
(+default--def-browse-in! dotfiles (expand-file-name "~/.dotfiles") +spacemacs-ish)
