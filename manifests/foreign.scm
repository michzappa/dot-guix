;; the packages I want in a foreign guix installation
(specifications->manifest
 (append
  ;; misc
  '("agda"
    "guile"
    "glibc-locales"
    "ripgrep"
    "spotifyd"
    "texlive")

  ;; emacs
  '("emacs-pgtk-native-comp"
    "emacs-agda2-mode"
    "emacs-geiser"
    "emacs-guix"
    "emacs-pdf-tools"
    "emacs-vterm")))
