(use-modules (gnu home)
             (gnu home-services)
             (gnu home-services shells)
             (gnu packages admin)
             (gnu packages emacs-xyz)
             (gnu packages gnuzilla)
             (gnu packages package-management)
             (gnu packages rust-apps)
             (gnu packages web-browsers)
             (mz-guix packages agda)
             (mz-guix packages emacs-xyz))

;; figure out symlink management for other config
;; add aliases to shell for common guix things (system/home reconfigure)
(home-environment
 (packages (list agda-2.6.2
                 emacs-agda2-mode-2.6.2
                 emacs-geiser
                 emacs-guix
                 emacs-vterm
                 flatpak
                 icecat
                 neofetch
                 nyxt
                 ripgrep))
 (services
  (list
   (service home-bash-service-type
            (home-bash-configuration
             (guix-defaults? #t)
             (environment-variables '(("EDITOR" . "\"emacsclient -t\"")
                                      ("VISUAL" . "\"emacsclient -c\"")))
             (bash-profile '("\
export EMACSLOADPATH=$HOME/.guix-home/profile/share/emacs/site-lisp:$EMACSLOADPATH"))
             (bashrc '("\
alias reconfigure-system-xps=\"sudo guix system reconfigure $HOME/.config/guix/system/xps.scm\"
alias reconfigure-home=\"guix home reconfigure $HOME/.config/guix/home/home.scm\"")))))))
