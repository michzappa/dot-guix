(use-modules (gnu home)
             (gnu home services)
             (gnu home services shells)
             (gnu packages admin)
             (gnu packages agda)
             (gnu packages emacs-xyz)
             (gnu packages gnuzilla)
             (gnu packages package-management)
             (gnu packages rust-apps)
             (gnu packages web-browsers)
             (mz-guix packages rust-apps))

;; figure out symlink management for other config
;; add aliases to shell for common guix things (system/home reconfigure)
(home-environment
 (packages (list agda
                 emacs-agda2-mode
                 emacs-geiser
                 emacs-guix
                 emacs-vterm
                 flatpak
                 icecat
                 neofetch
                 nyxt
                 ripgrep
                 spotifyd))
 (services
  (list
   (service home-bash-service-type
            (home-bash-configuration
             (guix-defaults? #t)
             (environment-variables '(("EDITOR" . "\"emacsclient -t\"")
                                      ("VISUAL" . "\"emacsclient -c\"")
                                      ("EMACSLOADPATH" . "$HOME/.guix-home/profile/share/emacs/site-lisp:$EMACSLOADPATH")))

             ;; (bashrc '("\
;; alias reconfigure-system-xps=\"sudo guix system reconfigure $HOME/.config/guix/system/xps.scm\"
;; alias reconfigure-system-vbox=\"sudo guix system reconfigure $HOME/.config/guix/system/vbox.scm\"
;; alias reconfigure-home=\"guix home reconfigure $HOME/.config/guix/home/home.scm\""))
             )))))
