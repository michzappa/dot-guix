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
    "stow"
    "texlive")

  ;; emacs
  '("emacs-native-comp"
    "emacs-agda2-mode"
    "emacs-auctex"
    "emacs-geiser"
    "emacs-guix"
    "emacs-pdf-tools"
    "emacs-vterm")))
