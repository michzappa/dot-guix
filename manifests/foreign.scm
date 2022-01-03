;; the packages I want in a foreign guix installation
(specifications->manifest
 (append
  ;; misc
  '("f1viewer"
    "guile"
    "glibc-locales"
    "haunt"
    "mpv"
    "nyxt"
    "ripgrep"
    "sbcl"
    "spotifyd"
    "stow"
    "texlive")

  ;; guile
  '("guile"
    "guile-readline"
    "guile-colorized")

  ;; emacs
  '("emacs-native-comp"
    "emacs-geiser"
    "emacs-guix"
    "emacs-pdf-tools"
    "emacs-vterm")))
