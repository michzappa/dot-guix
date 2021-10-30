(use-modules (gnu home)
             (gnu home services)
             (gnu home services shells)
             (gnu packages admin)
             (gnu packages agda)
             (gnu packages ebook)
             (gnu packages emacs)
             (gnu packages emacs-xyz)
             (gnu packages gnome)
             (gnu packages gnuzilla)
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
             (mz-guix packages rust-apps))

(home-environment
 (packages (list agda
                 alsa-plugins
                 alsa-utils
                 calibre
                 emacs
                 emacs-pdf-tools
                 emacs-agda2-mode
                 emacs-bluetooth
                 emacs-geiser
                 emacs-guix
                 emacs-vterm
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
              '(("EDITOR" . "\"emacsclient -t\"")
                ("VISUAL" . "\"emacsclient -c\"")
                ("EMACSLOADPATH" . "$HOME/.guix-home/profile/share/emacs/site-lisp:$EMACSLOADPATH")
                ("XDG_DATA_DIRS" . "$HOME/.local/share/flatpak/exports/share:$XDG_DATA_DIRS")))
             (bashrc
              (list
               (local-file "bashrc"))))))))
