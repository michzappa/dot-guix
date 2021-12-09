(define-module (mz-guix packages wm)
  #:use-module (gnu packages wm)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages))

(define-public sbcl-stumpwm-stump-volume-control
  (package
    (inherit sbcl-stumpwm-wifi) ;; this is a hack since stumpwm-contrib isn't
                                ;; public
    (name "sbcl-stumpwm-stump-volume-control")
    (arguments
     '(#:asd-systems '("stump-volume-control")
       #:tests? #f
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'chdir (lambda _ (chdir "media/stump-volume-control") #t)))))
    (home-page
     "https://github.com/stumpwm/stumpwm-contrib/tree/master/media/stump-volume-control")
    (synopsis "Minimalistic amixer-based volume control for StumpWM")
    (description "Minimalistic amixer-based volume control for StumpWM.")))
