(use-modules
 (guix gexp)
 (flat packages emacs)
 (gnu home services)
 (gnu home services shells)
 (gnu packages agda)
 (gnu packages admin)
 (gnu packages ebook)
 (gnu packages emacs)
 (gnu packages emacs-xyz)
 (gnu packages gnome)
 (gnu packages pdf)
 (gnu packages rust-apps)
 (mz-guix packages spotifyd)
 (nongnu packages mozilla))

(home-environment
 (packages
  (list agda
        calibre
        emacs-native-comp
        emacs-agda2-mode
        emacs-geiser
        emacs-guix
        emacs-pdf-tools
        emacs-vterm
        firefox
        gnome-tweaks
        ripgrep
        spotifyd
        tree
        xournalpp))
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
