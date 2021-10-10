;; the packages I want in a foreign guix installation
(specifications->manifest
 (append
  ;; misc
  '("agda"
    "guile"
    "glibc-locales"
    "nyxt"
    "ripgrep"
    "spotifyd"
    "stow")

  ;; emacs
  '("emacs"
    "emacs-agda2-mode"
    "emacs-guix"
    "emacs-geiser"
    "emacs-vterm")))
