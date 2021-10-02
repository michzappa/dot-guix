(use-modules (gnu home)
             (gnu home-services)
             (gnu home-services shells)
             (gnu packages admin)
             (gnu packages package-management)
             (gnu packages web-browsers)
             (mz-guix packages agda))

;; figure out symlink management for other config
(home-environment
 (packages '(
             agda-2.6.2
             ;; TODO emacs-agda2-mode-2.6.2 -- figure out how to add guix-home to EMACSLOADPATH
             flatpak
             icecat
             neofetch
             nyxt
             ripgrep
             ))
 (services
  (list
   (service home-bash-service-type
            (home-bash-configuration
             (guix-defaults? #t))))))
