(use-modules
 (gnu)
 (gnu services cups)
 (gnu services desktop)
 (gnu services xorg)
 (gnu services networking)
 (gnu services ssh)
 (gnu packages emacs)
 (gnu packages fontutils)
 (gnu packages fonts)
 (gnu packages ghostscript)
 (gnu packages gnome)
 (gnu packages gnuzilla)
 (gnu packages lisp)
 (gnu packages ssh)
 (gnu packages version-control)
 (gnu packages web-browsers)
 (gnu packages wm))

(operating-system
  (locale "en_US.utf8")
  (timezone "America/New_York")
  (keyboard-layout (keyboard-layout "us"
                                    #:options '("ctrl:nocaps")))
  (host-name "ordenagailua")
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
          ;; gnome-tweaks ;; at system level because gnome is at system level
          emacs
          fontconfig
          font-dejavu
          font-gnu-freefont
          font-adobe-source-han-sans
          gs-fonts ;; perhaps evaluate necessity of all the font packages
          openssh
          sbcl
          stumpwm
          `(,stumpwm "lib"))
    %base-packages))
  (services
   (append
    (list
     ;; (service gnome-desktop-service-type)
     (service slim-service-type)

     (bluetooth-service #:auto-enable? #t) ;; doesn't really work, at
     ;; least with GNOME
     (service cups-service-type)
     (set-xorg-configuration
      (xorg-configuration
       (keyboard-layout keyboard-layout))))
    (modify-services %desktop-services
      (delete gdm-service-type))))
  (bootloader
   (bootloader-configuration
    (bootloader grub-bootloader)
    ;; (target "/dev/sda") ;; not sure why target was deprecated, nothing in the docs about it
    (targets '("/dev/sda"))
    (keyboard-layout keyboard-layout)))
  (swap-devices
   (list "/dev/sda2"))
  (file-systems
   (cons* (file-system
            (mount-point "/")
            (device
             (file-system-label "root"))
            (type "ext4"))
          %base-file-systems)))
