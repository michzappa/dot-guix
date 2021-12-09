(define-module (mz-guix packages linux)
  #:use-module (gnu packages linux)
  #:use-module (guix download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix utils))

(define-public alsa-lib-pulseaudio
  (package
    (inherit alsa-lib)
    (arguments
     (substitute-keyword-arguments
         (package-arguments alsa-lib)
       ((#:configure-flags flags)
        `(cons (string-append
                "--with-plugindir="
                (assoc-ref %build-inputs "alsa-plugins:pulseaudio")
                "/lib/alsa-lib") ,flags))))
    (inputs
     `(("alsa-plugins:pulseaudio" ,alsa-plugins "pulseaudio")))))
