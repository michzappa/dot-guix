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
 (gnu packages ibus)
 (gnu packages linux)
 (gnu packages lisp)
 (gnu packages pulseaudio)
 (gnu packages ssh)
 (gnu packages version-control)
 (gnu packages web-browsers)
 (gnu packages wm)
 (gnu packages xorg)
 (gnu services base)
 (gnu services desktop)
 (gnu services linux)
 (gnu services networking)
 (gnu services ssh)
 (gnu services xorg)
 (gnu system keyboard)
 (gnu system file-systems)
 (guix gexp)
 (guix transformations)
 (nongnu packages linux)
 (nongnu packages nvidia)
 (nongnu system linux-initrd))

;; graft and rename the `nvidia-driver' package, has to have the same number
;; of characters as `mesa' (4)
(define transform
  (options->transformation
   '((with-graft . "mesa=nvda"))))

(operating-system
  ;; nonfree kernel and nvidia drivers
  (kernel linux-lts)
  (kernel-arguments
   (cons
    "modprobe.blacklist=nouveau"
    %default-kernel-arguments))
  (kernel-loadable-modules
   (list nvidia-driver))
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
    ;; nvidia services
    (simple-service
     'custom-udev-rules udev-service-type
     (list nvidia-driver))
    (service kernel-module-loader-service-type
             '("ipmi_devintf"
               "nvidia"
               "nvidia_modeset"
               "nvidia_uvm"))
    (modify-services %desktop-services
      ;; nvidia on gdm
      (gdm-service-type config =>
                        (gdm-configuration
                         (xorg-configuration
                          (xorg-configuration
                           (modules
                            (cons nvidia-driver %default-org-modules))
                           (server
                            (transform xorg-server))
                           (drivers
                            '("nvidia"))))))
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
    (file-system-label "swap")))
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
