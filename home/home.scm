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
             (flat packages emacs)
             (mz-guix packages rust-apps))

(home-environment
 (packages (list agda
                 alsa-plugins
                 alsa-utils
                 calibre
                 emacs-native-comp
                 emacs-agda2-mode
                 emacs-bluetooth
                 emacs-geiser
                 emacs-guix
                 emacs-pdf-tools
                 emacs-vterm
                 flatpak
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
                ("EMACSLOADPATH" . "$HOME/.guix-home/profile/share/emacs/site-lisp:$EMACSLOADPATH")
                ("XDG_DATA_DIRS" . "$HOME/.local/share/flatpak/exports/share:$XDG_DATA_DIRS")
                ("GUIX_GTK3_IM_MODULE_FILE" . "$HOME/.guix-profile/lib/gtk-3.0/3.0.0/immodules-gtk3.cache")
                ("GTK_IM_MODULE" . "xim")
                ("QT_IM_MODULE" . "xim")
                ("XMODIFIERS" . "@im=ibus")))
             (bashrc
              (list
               (local-file "bashrc"))))))))
