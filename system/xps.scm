(use-modules
 (gnu)
 (gnu services cups)
 (gnu services desktop)
 (gnu services xorg)
 (gnu services networking)
 (gnu services ssh)
 (gnu packages version-control)
 (gnu packages gnuzilla)
 (gnu packages emacs)
 (gnu packages emacs-xyz)
 (gnu packages web-browsers)
 (nongnu packages linux))

(operating-system
 (kernel linux)
 (firmware (list linux-firmware))
  (locale "en_US.utf8")
  (timezone "America/New_York")
  (keyboard-layout (keyboard-layout "us"
                                    #:options '("ctrl:nocaps")))
  (host-name "ordenagailu")
  (users (cons* (user-account
                  (name "michael")
                  (comment "Michael Zappa")
                  (group "users")
                  (home-directory "/home/michael")
                  (supplementary-groups
                    '("wheel" "netdev" "audio" "video")))
                %base-user-accounts))
  (packages
    (append
     (list (specification->package "nss-certs")
           git
           icecat
           emacs
           emacs-geiser
           emacs-guix
           emacs-vterm
           nyxt)
      %base-packages))
  (services
    (append
      (list (service gnome-desktop-service-type)
            (service cups-service-type)
            (set-xorg-configuration
              (xorg-configuration
                (keyboard-layout keyboard-layout))))
      %desktop-services))
  (bootloader
    (bootloader-configuration
      (bootloader grub-efi-bootloader)
      (targets (list "/boot/efi"))
      (keyboard-layout keyboard-layout)))
  (swap-devices
    (list (uuid "ad923e3a-6955-4319-869d-57e6aa257806")))
  (file-systems
    (cons* (file-system
             (mount-point "/boot/efi")
             (device (uuid "D85D-8718" 'fat32))
             (type "vfat"))
           (file-system
             (mount-point "/")
             (device
               (uuid "cf8566b3-1937-4362-a2e6-358177c96907"
                     'ext4))
             (type "ext4"))
           %base-file-systems)))
