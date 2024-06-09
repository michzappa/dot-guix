(define-module (mz machines xps)
  #:use-module (guix gexp)

  #:use-module (gnu packages base)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages emacs)
  #:use-module (gnu packages emacs-xyz)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages rust-apps)
  #:use-module (gnu packages shells)
  #:use-module (gnu packages shellutils)
  #:use-module (nongnu packages mozilla)
  #:use-module (nongnu packages linux)

  #:use-module (gnu bootloader)
  #:use-module (gnu bootloader grub)

  #:use-module (gnu services)
  #:use-module (gnu services base)
  #:use-module (gnu services desktop)
  #:use-module (gnu services docker)
  #:use-module (gnu services ssh)
  #:use-module (gnu services xorg)

  #:use-module (gnu system)
  #:use-module (gnu system file-systems)
  #:use-module (gnu system keyboard)
  #:use-module (gnu system shadow)
  #:use-module (nongnu system linux-initrd)

  #:use-module (gnu home)
  #:use-module (gnu home services)
  #:use-module (gnu home services shells)
  #:export (system-config home-config))

;; SYSTEM

;; SUBSTITUTE is a (url . keyfile).
(define (add-additional-substitute config substitute)
  (guix-configuration
   (inherit config)
   (substitute-urls
    (append (list (car substitute)) %default-substitute-urls))
   (authorized-keys
    (append (list (cdr substitute)) %default-authorized-guix-keys))))

(define nonguix-substitute
  `("https://substitutes.nonguix.org" .
    ,(plain-file "nonguix-signing-key.pub" "(public-key (ecc (curve Ed25519) (q #C1FD53E5D4CE971933EC50C9F307AE2171A2D3B52C804642A7A35F84F3A4EA98#)))")))

(define-public system-config
  (operating-system
   (host-name "xps")
   (timezone "America/New_York")
   (locale "en_US.utf8")
   (keyboard-layout (keyboard-layout "us" #:options '("ctrl:nocaps")))

   (kernel linux)
   (initrd microcode-initrd)
   (firmware `(,linux-firmware))

   (packages (append `(,git
                       ,gnome-terminal
                       ,emacs
                       ,emacs-vterm
                       ,firefox)
                     %base-packages))

   (services (append
              (list (service gnome-desktop-service-type)
                    (service openssh-service-type)
                    (service docker-service-type)
                    (set-xorg-configuration (xorg-configuration (keyboard-layout keyboard-layout))))
              (modify-services %desktop-services
                               (guix-service-type config =>
                                                  (add-additional-substitute config nonguix-substitute)))))

   (bootloader (bootloader-configuration
                (bootloader grub-efi-bootloader)
                (targets '("/boot/efi"))
                (keyboard-layout keyboard-layout)))

   (file-systems (append
                  `(,(file-system
                      (device (file-system-label "root"))
                      (mount-point "/")
                      (type "ext4"))
                    ,(file-system
                      (device (file-system-label "boot"))
                      (mount-point "/boot/efi")
                      (type "vfat")))
                  %base-file-systems))

   (swap-devices `(,(swap-space
                     (target (file-system-label "swap")))))

   (users (cons (user-account
                 (name "michael")
                 (group "users")
                 (shell #~(string-append #$fish "/bin/fish"))
                 (supplementary-groups '("wheel" "netdev" "audio" "video" "docker")))
                %base-user-accounts))))

;; HOME

;; PLUGIN is a normal zsh plugin package.
(define (source-zsh-plugin plugin)
  #~(string-append ". " #$plugin "/share/zsh/plugins/*/*.zsh\n"))

;; PLUGIN is a zsh plugin which provides site-functions.
(define (add-zsh-site-functions plugin)
  #~(string-append "fpath+=(" #$plugin "/share/zsh/site-functions" ")\n"))

(define-public home-config
  (home-environment
   (packages `(,direnv
               ,gnu-make
               ,ncurses
               ,ripgrep))
   (services
    (list
     (service home-fish-service-type
              (home-fish-configuration
               ;; TODO add support for writing fish functions?
               (abbreviations
                '(("ec" . "emacsclient -t -a \\\"\\\"")
                  ("gimme" . "guix shell --check")
                  ("lookup" . "guix search")))
               (aliases
                '())
               (config `(,(mixed-text-file "fish_config"
                                           "set fish_greeting \"\"\n"
                                           "bind \\ee true\n"
                                           "bind \\ev true\n")))))
     (service home-zsh-service-type
              (home-zsh-configuration
               ;; TODO use gexps for emacs and direnv references?
               (environment-variables '(("EDITOR" . "emacsclient -t -a ''")))
               (zshenv '())
               (zprofile '())
               (zshrc `(,(mixed-text-file "zshrc"
                          "PS1='%n@%m:%/$ '\n"
                          "SAVEHIST=10000\n"
                          "HISTFILE=\"$HOME/.zsh_history\"\n"
                          ;; Small hack to treat sub-paths as words.
                          "WORDCHARS=${WORDCHARS//[\\/-]}\n"
                          "eval \"$(direnv hook zsh)\"\n"
                          (source-zsh-plugin zsh-autosuggestions)
                          (source-zsh-plugin zsh-autopair)
                          (source-zsh-plugin zsh-history-substring-search)
                          (source-zsh-plugin zsh-syntax-highlighting)
                          (add-zsh-site-functions zsh-completions))))
               (zlogin '())
               (zlogout '())))

     (service home-files-service-type `())
     (service home-xdg-configuration-files-service-type `())))))
