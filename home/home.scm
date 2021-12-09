(use-modules
 (gnu home)
 (gnu home services)
 (gnu home services shells)
 (gnu packages admin)
 (gnu packages agda)
 (gnu packages ebook)
 (gnu packages emacs)
 (gnu packages emacs-xyz)
 (gnu packages gnome)
 (gnu packages ibus)
 (gnu packages libreoffice)
 (gnu packages linux)
 (gnu packages lisp-xyz)
 (gnu packages package-management)
 (gnu packages pdf)
 (gnu packages rust-apps)
 (gnu packages vpn)
 (gnu packages web-browsers)
 (gnu packages wm)
 (gnu packages xorg)
 (guix gexp)
 (flat packages emacs)
 (mz-guix packages rust-apps)
 (nongnu packages mozilla))

(home-environment
 (packages
  (list agda
        calibre
        emacs-native-comp
        emacs-agda2-mode
        emacs-all-the-icons
        emacs-auctex
        ;; emacs-auto-compile
        emacs-avy
        emacs-bluetooth
        ;; emacs-clipetty
        ;; emacs-company-ctags
        emacs-company
        emacs-consult
        emacs-ctrlf
        emacs-dashboard
        emacs-default-text-scale
        emacs-exec-path-from-shell
        emacs-expand-region
        ;; emacs-format-all
        emacs-geiser
        emacs-general
        emacs-git-gutter
        emacs-go-mode
        emacs-guix
        emacs-hl-todo
        emacs-kbd
        emacs-magit
        emacs-marginalia
        emacs-markdown-mode
        emacs-minions
        emacs-modus-themes
        emacs-nix-mode
        emacs-no-littering
        emacs-nov-el
        emacs-org-bullets
        emacs-pdf-tools
        emacs-rainbow-delimiters
        emacs-selectrum
        ;; emacs-selectrum-prescient
        emacs-sly
        emacs-smartparens
        ;; tree-sitter? maybe someday
        emacs-undo-tree
        emacs-use-package
        emacs-vterm
        emacs-web-mode
        emacs-which-key
        ;; emacs-whole-line-or-region
        emacs-yaml-mode
        firefox
        flatpak
        gnome-tweaks
        libreoffice
        neofetch
        nyxt
        protonvpn-cli
        ripgrep
        spotifyd
        stow
        tree
        xournalpp
        xterm))
 (services
  (list
   (service home-bash-service-type
            (home-bash-configuration
             (guix-defaults? #t)
             (environment-variables
              '(("EDITOR" . "\"emacsclient -t -a \"")
                ("VISUAL" . "\"emacsclient -c -a \"")
                ;; load emacs packages installed with guix home
                ("EMACSLOADPATH" . "$HOME/.guix-home/profile/share/emacs/site-lisp:$EMACSLOADPATH")
                ;; flatpak variables
                ("XDG_DATA_DIRS" . "$HOME/.local/share/flatpak/exports/share:$XDG_DATA_DIRS")
                ("XDG_DATA_DIRS" . "/var/lib/flatpak/exports/share:$XDG_DATA_DIRS")
                ;; ibus variables. some may be unnecessary
                ("GUIX_GTK3_IM_MODULE_FILE" . "$HOME/.guix-profile/lib/gtk-3.0/3.0.0/immodules-gtk3.cache")
                ("GTK_IM_MODULE" . "xim")
                ("QT_IM_MODULE" . "xim")
                ("XMODIFIERS" . "@im=ibus")))
             (bashrc
              (list
               (local-file "bashrc"))))))))
