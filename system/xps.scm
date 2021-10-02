(use-modules
 (gnu)
 (gnu services cups)
 (gnu services desktop)
 (gnu services networking)
 (gnu services ssh)
 (gnu services xorg)
 (gnu packages emacs)
 (gnu packages emacs-xyz)
 (gnu packages fontutils)
 (gnu packages fonts)
 (gnu packages ghostscript)
 (gnu packages gnuzilla)
 (gnu packages linux)
 (gnu packages ssh)
 (gnu packages version-control)
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
                  '("wheel" "netdev" "audio" "video" "lp")))
                %base-user-accounts))
  (packages
   (append
    (list (specification->package "nss-certs")
          git
          emacs
          fontconfig
          font-dejavu
          font-gnu-freefont
          font-adobe-source-han-sans
          gs-fonts
          openssh)
    %base-packages))
  (services
   (append
    (list (service gnome-desktop-service-type)
          (bluetooth-service #:auto-enable? #t) ;; doesn't really work, at
                                                ;; least with GNOME
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
