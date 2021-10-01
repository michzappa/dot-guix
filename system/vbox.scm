(use-modules
 (gnu)
 (gnu services desktop)
 (gnu services xorg)
 (gnu services networking)
 (gnu services ssh)
 (gnu packages version-control)
 (gnu packages gnuzilla)
 (gnu packages emacs)
 (gnu packages emacs-xyz)
 (gnu packages web-browsers))

(operating-system
 (locale "en_US.utf8")
 (timezone "America/New_York")
 (keyboard-layout (keyboard-layout "us"
                                   #:options '("ctrl:nocaps")))
 (host-name "corgi")
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
         emacs-guix
         emacs-vterm
         emacs-geiser
         nyxt)
   %base-packages))
 (services
  (append
   (list (service gnome-desktop-service-type)
         (set-xorg-configuration
          (xorg-configuration
           (keyboard-layout keyboard-layout))))
   %desktop-services))
 (bootloader
  (bootloader-configuration
   (bootloader grub-bootloader)
   ;; (target "/dev/sda") ;; not sure why target was deprecated, nothing in the docs about it
   (targets '("/dev/sda"))
   (keyboard-layout keyboard-layout)))
 ;; TODO device by label to make more portable, then need to figure out how to label devices on
 ;; install
 (swap-devices
  (list (uuid "6bb1960f-ff60-4053-8f72-5b4b77eedb48")))
 (file-systems
  (cons* (file-system
          (mount-point "/")
          (device
           (uuid "d3f30dbb-b006-42f4-9089-21bb2dc685a5"
                 'ext4))
          (type "ext4"))
         %base-file-systems)))
