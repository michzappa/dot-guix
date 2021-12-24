(use-modules
 (gnu bootloader)
 (guix gexp)
 (gnu bootloader grub)
 (gnu packages certs)
 (gnu packages emacs)
 (gnu packages fontutils)
 (gnu packages fonts)
 (gnu packages ibus)
 (gnu packages ssh)
 (gnu packages version-control)
 (gnu services base)
 (gnu services desktop)
 (gnu services xorg)
 (gnu system keyboard)
 (gnu system file-systems)
 (nongnu packages linux)
 (nongnu system linux-initrd))

(operating-system
  (kernel linux)
  (firmware
   (list linux-firmware))
  (initrd microcode-initrd)
  (locale "en_US.utf8")
  (timezone "America/New_York")
  (keyboard-layout
   (keyboard-layout "us"
                    #:options
                    '("ctrl:nocaps")))
  (host-name "ordenagailu")
  (users
   (cons*
    (user-account
     (name "michael")
     (comment "Michael Zappa")
     (group "users")
     (home-directory "/home/michael")
     (supplementary-groups
      '("wheel" "netdev" "audio" "video" "lp")))
    %base-user-accounts))
  (packages
   (cons*
    emacs
    fontconfig
    font-gnu-freefont
    font-google-noto
    git
    ibus
    ibus-libpinyin
    ibus-rime
    nss-certs
    openssh
    %base-packages))
  (services
   (cons*
    (service gnome-desktop-service-type)
    ;; FIXME noting this bluetooth setup does not seem to be sufficient on my
    ;; xps9570
    (bluetooth-service #:auto-enable? #t)
    (set-xorg-configuration
     (xorg-configuration
      (keyboard-layout keyboard-layout)))
    (modify-services %desktop-services
      ;; add a substitute server for a subset of nonguix
      (guix-service-type config =>
                         (guix-configuration
                          (inherit config)
                          (substitute-urls
                           (append
                            %default-substitute-urls
                            (list "https://mirror.brielmaier.net")))
                          (authorized-keys
                           (append
                            (list
                             (local-file "mirror.brielmaier.net.pub"))
                            %default-authorized-guix-keys)))))))
  (bootloader
   (bootloader-configuration
    (bootloader grub-efi-bootloader)
    (targets
     (list "/boot/efi"))
    (keyboard-layout keyboard-layout)))
  (swap-devices
   (list
    (swap-space
     (target (file-system-label "swap")))))
  (file-systems
   (cons*
    (file-system
      (mount-point "/boot/efi")
      (device
       (file-system-label "boot"))
      (type "vfat"))
    (file-system
      (mount-point "/")
      (device
       (file-system-label "root"))
      (type "ext4"))
    %base-file-systems)))
