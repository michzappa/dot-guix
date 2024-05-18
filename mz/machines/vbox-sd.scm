(define-module (mz machines vbox-sd)
  #:use-module (gnu bootloader)
  #:use-module (gnu bootloader grub)

  #:use-module (gnu packages admin)
  #:use-module (gnu packages lsof)
  #:use-module (gnu packages certs)
  #:use-module (gnu packages emacs)
  #:use-module (gnu packages emacs-xyz)
  #:use-module (gnu packages shells)
  #:use-module (gnu packages shellutils)
  #:use-module (gnu packages gnuzilla)
  #:use-module (gnu packages version-control)

  #:use-module (gnu services)
  #:use-module (gnu services base)
  #:use-module (gnu services networking)
  #:use-module (gnu services ssh)
  #:use-module (gnu services xorg)

  #:use-module (gnu system)
  #:use-module (gnu system accounts)
  #:use-module (gnu system file-systems)
  #:use-module (gnu system shadow)

  #:use-module (guix gexp)

  #:use-module (mz system keyboard))

(define-public vbox-sd
  (operating-system
   (locale "en_US.utf8")
   (timezone "America/New_York")
   (host-name "vbox")

   (keyboard-layout ctrl-no-caps-keyboard)

   (users (cons* (user-account
                  (name "michael")
                  (comment "Michael")
                  (group "users")
                  (home-directory "/home/michael")
                  (shell #~(string-append #$fish "/bin/fish"))
                  (supplementary-groups '("wheel" "netdev" "audio" "video")))
                 %base-user-accounts))

   (packages (append `(,git
                       ,emacs
                       ,tree
                       ,lsof
                       ,direnv)
                     %base-packages))

   (services
    (append (list (service openssh-service-type)
                  (service network-manager-service-type)
                  (service wpa-supplicant-service-type))
            %base-services))

   (bootloader (bootloader-configuration
                (bootloader grub-bootloader)
                (targets (list "/dev/sda"))
                (keyboard-layout keyboard-layout)))

   ;; TODO: Make separate hardware config module and import in this
   ;; configuration (and in theory others). Need to not use uuids for
   ;; that though, is it worth it?
   (swap-devices (list (swap-space
                        (target (uuid
                                 "0649f9ac-4912-40ed-862c-420e8a2bab67")))))

   (file-systems (cons* (file-system
                         (mount-point "/")
                         (device (uuid
                                  "053cb242-909a-43bd-89d2-1b6610408a74"
                                  'ext4))
                         (type "ext4")) %base-file-systems))))

vbox-sd
