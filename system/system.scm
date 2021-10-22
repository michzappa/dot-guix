(use-modules
 (gnu bootloader)
 (gnu bootloader grub)
 (gnu packages)
 (gnu packages audio)
 (gnu packages admin)
 (gnu packages certs)
 (gnu packages emacs)
 (gnu packages fontutils)
 (gnu packages fonts)
 (gnu packages gnuzilla)
 (gnu packages linux)
 (gnu packages lisp)
 (gnu packages pulseaudio)
 (gnu packages ssh)
 (gnu packages version-control)
 (gnu packages web-browsers)
 (gnu packages wm)
 (gnu packages xorg)
 (gnu services desktop)
 (gnu services networking)
 (gnu services ssh)
 (gnu services xorg)
 (gnu system keyboard)
 (gnu system file-systems)
 (nongnu packages linux)
 (nongnu system linux-initrd))

(operating-system
  (kernel linux)
  (firmware (list linux-firmware))
  (initrd microcode-initrd)
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
    ;; TODO check if any of these packages are included from the services
    (list fontconfig
          font-gnu-freefont
          font-google-noto
          git
          nss-certs
          openssh
          pulseaudio
          stumpwm+slynk)
    %base-packages))
  (services
   (append
    (list (service gnome-desktop-service-type)
          ;; FIXME noting this does not seem to be sufficient on my xps9570
          (bluetooth-service #:auto-enable? #t)
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
   (list (file-system-label "swap")))
  (file-systems
   (cons* (file-system
            (mount-point "/boot/efi")
            (device (file-system-label "boot"))
            (type "vfat"))
          (file-system
            (mount-point "/")
            (device
             (file-system-label "root"))
            (type "ext4"))
          %base-file-systems)))
