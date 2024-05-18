(define-module (mz machines vbox-home)
  #:use-module (gnu home services shells)
  #:use-module (gnu home services)
  #:use-module (gnu home)
  #:use-module (gnu packages emacs)
  #:use-module (gnu packages emacs-xyz)
  #:use-module (gnu packages)
  #:use-module (gnu services)
  #:use-module (guix gexp))

(define-public vbox-home
  (home-environment
   (packages
    `(,emacs-next
      ,emacs-vterm))

   (services
    (list
     ;; Set universal environment variables.
     (simple-service 'env-vars
                     home-environment-variables-service-type
                     `(("EDITOR" . "emacsclient -t -a \"\"")))
     ;; Configuration for Fish shell.
     (service home-fish-service-type
              (home-fish-configuration
               (abbreviations
                '(("ec" . "emacsclient -t -a \\\"\\\"")
                  ("gimme" . "guix shell")
                  ("lookup" . "guix search")))
               (aliases
                '())
               (config `(,(plain-file "" "
# Don't show a greeting.
set fish_greeting \"\"

# Disable the annoying $EDITOR keybindings by remapping to NOP.
bind \\ee true
bind \\ev true")))))))))

vbox-home
