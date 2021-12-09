(define-module (mz-guix packages rust-apps)
  #:use-module (gnu packages crates-io)
  #:use-module (gnu packages crates-graphics)
  #:use-module (gnu packages crates-gtk)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages rust)
  #:use-module (gnu packages tls)
  #:use-module (guix build-system cargo)
  #:use-module (guix download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (mz-guix packages linux)
  #:use-module (mz-guix packages rust-xyz))

(define-public spotifyd
  (package
    (name "spotifyd")
    (version "0.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "spotifyd" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0ppjn9wmqn5rg5931lkw6m4ish1rq37ja3dfxaclq7rmgkb50byl"))))
    (build-system cargo-build-system)
    (native-inputs
     `(("pkg-config" ,pkg-config)))
    (inputs
     ;; alsa-lib with the pulseaudio plugin built it
     `(("alsa-lib" ,alsa-lib-pulseaudio)
       ("openssl" ,openssl)))
    (arguments
     `(#:rust ,rust-1.52
       #:cargo-inputs
       (("rust-alsa" ,rust-alsa-0.3)
        ("rust-chrono" ,rust-chrono-0.4)
        ("rust-color-eyre" ,rust-color-eyre-0.5)
        ("rust-daemonize" ,rust-daemonize-0.4)
        ("rust-dbus" ,rust-dbus-0.6)
        ("rust-dbus-tokio" ,rust-dbus-tokio-0.2)
        ("rust-fern" ,rust-fern-0.6)
        ("rust-futures" ,rust-futures-0.1)
        ("rust-gethostname" ,rust-gethostname-0.2)
        ("rust-hex" ,rust-hex-0.4)
        ("rust-keyring" ,rust-keyring-0.10)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-librespot" ,rust-librespot-0.1)
        ("rust-log" ,rust-log-0.4)
        ("rust-percent-encoding" ,rust-percent-encoding-2)
        ("rust-rspotify" ,rust-rspotify-0.8)
        ("rust-serde" ,rust-serde-1)
        ("rust-sha-1" ,rust-sha-1-0.9)
        ("rust-structopt" ,rust-structopt-0.3)
        ("rust-syslog" ,rust-syslog-4)
        ("rust-tokio-core" ,rust-tokio-core-0.1)
        ("rust-tokio-io" ,rust-tokio-io-0.1)
        ("rust-tokio-signal" ,rust-tokio-signal-0.1)
        ("rust-toml" ,rust-toml-0.5)
        ("rust-url" ,rust-url-1)
        ("rust-whoami" ,rust-whoami-0.9)
        ("rust-xdg" ,rust-xdg-2))
       #:cargo-development-inputs
       (("rust-env-logger" ,rust-env-logger-0.7))))
    (home-page "https://github.com/Spotifyd/spotifyd")
    (synopsis "A Spotify daemon")
    (description "This package provides a Spotify daemon")
    (license license:gpl3)))
