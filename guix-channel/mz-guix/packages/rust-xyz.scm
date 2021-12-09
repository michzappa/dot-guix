;; if these ever get upstreamed the file names are different
;; (crates-io/graphics/gtk)

;; generated using guix import crate
(define-module (mz-guix packages rust-xyz)
  #:use-module (gnu packages crates-graphics)
  #:use-module (gnu packages crates-gtk)
  #:use-module (gnu packages crates-io)
  #:use-module (guix build-system cargo)
  #:use-module (guix download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages))

(define-public rust-pasts-0.4
  (package
    (name "rust-pasts")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pasts" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "11rdczdhpazclhkbbjafv5nd9ybll9a110crhh67si0p5rdc6mz7"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/AldaronLau/pasts/blob/main/CHANGELOG.md")
    (synopsis "Minimal and simpler alternative to the futures crate.")
    (description "Minimal and simpler alternative to the futures crate.")
    (license (list license:asl2.0 license:zlib))))

(define-public rust-cala-core-0.1
  (package
    (name "rust-cala-core")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cala_core" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "17939zm80lxi0mqsvi98wv2hjasbbh132j5i2m201x30j8dkx4wx"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-pasts" ,rust-pasts-0.4)
        ("rust-stdweb" ,rust-stdweb-0.4)
        ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2))))
    (home-page "https://github.com/libcala/cala_core/blob/master/CHANGELOG.md")
    (synopsis "Low-level platform glue for Cala")
    (description "Low-level platform glue for Cala")
    (license (list license:asl2.0 license:zlib))))

(define-public rust-whoami-0.9
  (package
    (name "rust-whoami")
    (version "0.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "whoami" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "012mw2q72gpmf354yw2qc5w105ziac75shpqp1f62x4hnqx7g13q"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-cala-core" ,rust-cala-core-0.1))))
    (home-page "https://github.com/libcala/whoami/blob/main/CHANGELOG.md")
    (synopsis "Retrieve the current user and environment.")
    (description "Retrieve the current user and environment.")
    (license (list license:expat license:boost1.0))))

(define-public rust-tokio-signal-0.1
  (package
    (name "rust-tokio-signal")
    (version "0.1.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tokio-signal" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1zlz5dwbh8lr0a9zar9459wcbfciqcg74wyiab7hb6hg4dinix78"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-futures" ,rust-futures-0.1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-mio" ,rust-mio-0.6)
        ("rust-mio-uds" ,rust-mio-uds-0.6)
        ("rust-tokio-core" ,rust-tokio-core-0.1)
        ("rust-tokio-io" ,rust-tokio-io-0.1)
        ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/tokio-rs/tokio")
    (synopsis
     "An implementation of an asynchronous Unix signal handling backed futures.")
    (description
     "An implementation of an asynchronous Unix signal handling backed futures.")
    (license (list license:expat license:asl2.0))))

(define-public rust-random-0.12
  (package
    (name "rust-random")
    (version "0.12.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "random" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "03s2c59vzcr5fmxbhlhxvrsnwgic488jl4br1k4q369lhls3mlcp"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/stainless-steel/random")
    (synopsis "The package provides sources of randomness.")
    (description "The package provides sources of randomness.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-dotenv-0.13
  (package
    (name "rust-dotenv")
    (version "0.13.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "dotenv" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "11jdifvvwbn60gf5iq2awyq9fik1d9xk7rhch332nwwnkhks3l60"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-clap" ,rust-clap-2)
        ("rust-failure" ,rust-failure-0.1)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-regex" ,rust-regex-1))))
    (home-page "https://github.com/dotenv-rs/dotenv")
    (synopsis "A `dotenv` implementation for Rust")
    (description "This package provides a `dotenv` implementation for Rust")
    (license license:expat)))

(define-public rust-derive-builder-core-0.5
  (package
    (name "rust-derive-builder-core")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "derive_builder_core" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0drbjk6n8ywls8cmhp4r8xkyjsja0wk3854cn5mj8g1km4ys5202"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-darling" ,rust-darling-0.9)
        ("rust-log" ,rust-log-0.4)
        ("rust-proc-macro2" ,rust-proc-macro2-0.4)
        ("rust-quote" ,rust-quote-0.6)
        ("rust-syn" ,rust-syn-0.15))))
    (home-page "https://github.com/colin-kiegel/rust-derive-builder")
    (synopsis "Internal helper library for the derive_builder crate.")
    (description "Internal helper library for the derive_builder crate.")
    (license (list license:expat license:asl2.0))))

(define-public rust-derive-builder-0.7
  (package
    (name "rust-derive-builder")
    (version "0.7.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "derive_builder" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1m34zpj6fw764g7s368r2wgazp154m24d4rshbgn18fdlfk3zi9s"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-compiletest-rs" ,rust-compiletest-rs-0.3)
        ("rust-darling" ,rust-darling-0.9)
        ("rust-derive-builder-core" ,rust-derive-builder-core-0.5)
        ("rust-env-logger" ,rust-env-logger-0.5)
        ("rust-env-logger" ,rust-env-logger-0.5)
        ("rust-log" ,rust-log-0.4)
        ("rust-log" ,rust-log-0.4)
        ("rust-proc-macro2" ,rust-proc-macro2-0.4)
        ("rust-quote" ,rust-quote-0.6)
        ("rust-skeptic" ,rust-skeptic-0.13)
        ("rust-skeptic" ,rust-skeptic-0.13)
        ("rust-syn" ,rust-syn-0.15))))
    (home-page "https://github.com/colin-kiegel/rust-derive-builder")
    (synopsis
     "Rust macro to automatically implement the builder pattern for arbitrary structs.")
    (description
     "Rust macro to automatically implement the builder pattern for arbitrary structs.")
    (license (list license:expat license:asl2.0))))

(define-public rust-rspotify-0.8
  (package
    (name "rust-rspotify")
    (version "0.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rspotify" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "14xdic0zhalmvk32y1ffanvgwdqki91qw549kj6mqcdirxka2959"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-base64" ,rust-base64-0.10)
        ("rust-chrono" ,rust-chrono-0.4)
        ("rust-derive-builder" ,rust-derive-builder-0.7)
        ("rust-dotenv" ,rust-dotenv-0.13)
        ("rust-env-logger" ,rust-env-logger-0.6)
        ("rust-failure" ,rust-failure-0.1)
        ("rust-itertools" ,rust-itertools-0.8)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-log" ,rust-log-0.4)
        ("rust-percent-encoding" ,rust-percent-encoding-1)
        ("rust-rand" ,rust-rand-0.6)
        ("rust-random" ,rust-random-0.12)
        ("rust-reqwest" ,rust-reqwest-0.10)
        ("rust-serde" ,rust-serde-1)
        ("rust-serde-derive" ,rust-serde-derive-1)
        ("rust-serde-json" ,rust-serde-json-1)
        ("rust-url" ,rust-url-1)
        ("rust-webbrowser" ,rust-webbrowser-0.5))))
    (home-page "https://github.com/samrayleung/rspotify")
    (synopsis "Spotify API wrapper")
    (description "Spotify API wrapper")
    (license license:expat)))

(define-public rust-zerocopy-derive-0.1
  (package
    (name "rust-zerocopy-derive")
    (version "0.1.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "zerocopy-derive" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "198g500f9j1z1crq2j6m60jmk0kkmi1x61b4i9p04906rmz4d45h"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-0.4)
        ("rust-syn" ,rust-syn-0.15)
        ("rust-synstructure" ,rust-synstructure-0.10))))
    (home-page
     "https://fuchsia.googlesource.com/fuchsia/+/HEAD/src/lib/zerocopy/zerocopy-derive")
    (synopsis "Custom derive for traits from the zerocopy crate")
    (description "Custom derive for traits from the zerocopy crate")
    (license license:bsd-3)))

(define-public rust-zerocopy-0.2
  (package
    (name "rust-zerocopy")
    (version "0.2.8")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "zerocopy" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0mj0scnsm2skj3gh3sk8qdn73mj3raw7ky03z5ks3m0gz0qrnawr"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-byteorder" ,rust-byteorder-1)
        ("rust-zerocopy-derive" ,rust-zerocopy-derive-0.1))))
    (home-page
     "https://fuchsia.googlesource.com/fuchsia/+/HEAD/src/lib/zerocopy")
    (synopsis "Utilities for zero-copy parsing and serialization")
    (description "Utilities for zero-copy parsing and serialization")
    (license license:bsd-3)))

(define-public rust-unidiff-0.3
  (package
    (name "rust-unidiff")
    (version "0.3.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "unidiff" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0b13vhp2x7jlvmkm44h5niqcxklyrmz6afmppvykp4zimhcjg9nq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-encoding-rs" ,rust-encoding-rs-0.8)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-regex" ,rust-regex-1))))
    (home-page "https://github.com/messense/unidiff-rs")
    (synopsis "Unified diff parsing/metadata extraction library for Rust")
    (description "Unified diff parsing/metadata extraction library for Rust")
    (license license:expat)))

(define-public rust-proc-macro2-0.3
  (package
    (name "rust-proc-macro2")
    (version "0.3.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "proc-macro2" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1m0ksg6hbm46zblq0dpkwrg3n1h7n90yq1zcgwc6vpbfmr9pr6bp"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-unicode-xid" ,rust-unicode-xid-0.1))))
    (home-page "https://github.com/alexcrichton/proc-macro2")
    (synopsis
     "A substitute implementation of the compiler's `proc_macro` API to decouple
token-based libraries from the procedural macro use case.
")
    (description
     "This package provides a substitute implementation of the compiler's `proc_macro` API to decouple
token-based libraries from the procedural macro use case.
")
    (license (list license:expat license:asl2.0))))

(define-public rust-bindgen-0.42
  (package
    (name "rust-bindgen")
    (version "0.42.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bindgen" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0p14hgi90wd4zbd8j1s4xrxf770cx0s6a2d32fg9ypmzpb69kwg0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-cexpr" ,rust-cexpr-0.3)
        ("rust-cfg-if" ,rust-cfg-if-0.1)
        ("rust-clang-sys" ,rust-clang-sys-0.26)
        ("rust-clap" ,rust-clap-2)
        ("rust-env-logger" ,rust-env-logger-0.5)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-log" ,rust-log-0.4)
        ("rust-peeking-take-while" ,rust-peeking-take-while-0.1)
        ("rust-proc-macro2" ,rust-proc-macro2-0.3)
        ("rust-quote" ,rust-quote-0.5)
        ("rust-regex" ,rust-regex-1)
        ("rust-which" ,rust-which-1))))
    (home-page "https://rust-lang.github.io/rust-bindgen/")
    (synopsis
     "Automatically generates Rust FFI bindings to C and C++ libraries.")
    (description
     "Automatically generates Rust FFI bindings to C and C++ libraries.")
    (license license:bsd-3)))

(define-public rust-sdl2-sys-0.32
  (package
    (name "rust-sdl2-sys")
    (version "0.32.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sdl2-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "11kz2bqkpcywpyd5hyqflbszpgdmh64zxb61wibpsabx0wji3rrl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-bindgen" ,rust-bindgen-0.42)
        ("rust-cfg-if" ,rust-cfg-if-0.1)
        ("rust-cmake" ,rust-cmake-0.1)
        ("rust-flate2" ,rust-flate2-1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-pkg-config" ,rust-pkg-config-0.3)
        ("rust-tar" ,rust-tar-0.4)
        ("rust-unidiff" ,rust-unidiff-0.3))))
    (home-page "https://github.com/rust-sdl2/rust-sdl2")
    (synopsis "Raw SDL2 bindings for Rust, used internally rust-sdl2")
    (description "Raw SDL2 bindings for Rust, used internally rust-sdl2")
    (license license:expat)))

(define-public rust-c-vec-1
  (package
    (name "rust-c-vec")
    (version "1.3.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "c_vec" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0c3wgb15h97k6lzfm9qgkwk35ij2ad7w8fb5rbqvalyf3n8ii8zq"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/GuillaumeGomez/c_vec-rs.git")
    (synopsis "Structures to wrap C arrays")
    (description "Structures to wrap C arrays")
    (license (list license:asl2.0 license:expat))))

(define-public rust-sdl2-0.32
  (package
    (name "rust-sdl2")
    (version "0.32.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sdl2" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0yyx7sl08y241ddyyfkk9ysxbxllfdpwny6s37vza0z365ra0lfh"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-c-vec" ,rust-c-vec-1)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-num" ,rust-num-0.1)
        ("rust-rand" ,rust-rand-0.6)
        ("rust-sdl2-sys" ,rust-sdl2-sys-0.32))))
    (home-page "https://github.com/Rust-SDL2/rust-sdl2")
    (synopsis "SDL2 bindings for Rust")
    (description "SDL2 bindings for Rust")
    (license license:expat)))

(define-public rust-slice-deque-0.3
  (package
    (name "rust-slice-deque")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "slice-deque" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "098gvqjw52qw4gac567c9hx3y6hw9al7hjqb5mnvmvydh3i6xvri"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ("rust-mach" ,rust-mach-0.3)
        ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/gnzlbg/slice_deque")
    (synopsis "A double-ended queue that Deref's into a slice.")
    (description
     "This package provides a double-ended queue that Deref's into a slice.")
    (license (list license:expat license:asl2.0))))

(define-public rust-minimp3-sys-0.3
  (package
    (name "rust-minimp3-sys")
    (version "0.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "minimp3-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "144vmf3s89kad0smjprzigcp2c9r5dm95n4ydilrbp399irp6772"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t #:cargo-inputs (("rust-cc" ,rust-cc-1))))
    (home-page "https://github.com/germangb/minimp3-rs.git")
    (synopsis "Rust bindings for the minimp3 library.")
    (description "Rust bindings for the minimp3 library.")
    (license license:expat)))

(define-public rust-minimp3-0.3
  (package
    (name "rust-minimp3")
    (version "0.3.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "minimp3" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1mfj2vg9vx0gvn5qhlsyqifccfynvnxij21mnavgilxzl3vczq6w"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-minimp3-sys" ,rust-minimp3-sys-0.3)
        ("rust-slice-deque" ,rust-slice-deque-0.3))))
    (home-page "https://github.com/germangb/minimp3-rs.git")
    (synopsis "Rust bindings for the minimp3 library.")
    (description "Rust bindings for the minimp3 library.")
    (license license:expat)))

(define-public rust-hound-3
  (package
    (name "rust-hound")
    (version "3.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "hound" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0jbm25p2nc8758dnfjan1yk7hz2i85y89nrbai14zzxfrsr4n5la"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/ruuda/hound")
    (synopsis "A wav encoding and decoding library")
    (description "This package provides a wav encoding and decoding library")
    (license license:asl2.0)))

(define-public rust-claxon-0.4
  (package
    (name "rust-claxon")
    (version "0.4.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "claxon" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1206mxvw833ysg10029apcsjjwly8zmsvksgza5cm7ma4ikzbysb"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/ruuda/claxon#readme")
    (synopsis "A FLAC decoding library")
    (description "This package provides a FLAC decoding library")
    (license license:asl2.0)))

(define-public rust-rodio-0.9
  (package
    (name "rust-rodio")
    (version "0.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rodio" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0b9s1w55l3zx2ys38yl0gp4k929h065wfl5mlx3x2rjf4ldrc3sx"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-claxon" ,rust-claxon-0.4)
        ("rust-cpal" ,rust-cpal-0.8)
        ("rust-hound" ,rust-hound-3)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-lewton" ,rust-lewton-0.9)
        ("rust-minimp3" ,rust-minimp3-0.3)
        ("rust-nalgebra" ,rust-nalgebra-0.18))))
    (home-page "https://github.com/RustAudio/rodio")
    (synopsis "Audio playback library")
    (description "Audio playback library")
    (license (list license:expat license:asl2.0))))

(define-public rust-portaudio-sys-0.1
  (package
    (name "rust-portaudio-sys")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "portaudio-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1xdpywirpr1kqkbak7hnny62gmsc93qgc3ij3j2zskrvjpxa952i"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ("rust-pkg-config" ,rust-pkg-config-0.3))))
    (home-page "")
    (synopsis "Bindings to PortAudio")
    (description "Bindings to PortAudio")
    (license license:expat)))

(define-public rust-portaudio-rs-0.3
  (package
    (name "rust-portaudio-rs")
    (version "0.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "portaudio-rs" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0qnmc7amk0fzbcs985ixv0k4955f0fmpkhrl9ps9pk3cz7pvbdnd"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-portaudio-sys" ,rust-portaudio-sys-0.1))))
    (home-page "")
    (synopsis "PortAudio bindings for Rust")
    (description "PortAudio bindings for Rust")
    (license license:expat)))

(define-public rust-linear-map-1
  (package
    (name "rust-linear-map")
    (version "1.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "linear-map" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1vh3sczl4xb5asdlpafdf3y4g9bp63fgs8y2a2sjgmcsn7v21bmz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-serde" ,rust-serde-1) ("rust-serde-test" ,rust-serde-test-1))))
    (home-page "https://github.com/contain-rs/linear-map")
    (synopsis "A map implemented by searching linearly in a vector.")
    (description
     "This package provides a map implemented by searching linearly in a vector.")
    (license (list license:expat license:asl2.0))))

(define-public rust-librespot-metadata-0.1
  (package
    (name "rust-librespot-metadata")
    (version "0.1.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "librespot-metadata" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "13dswphpaayccdrvxkj86cfnpv3rj4gl67711gp1qb5j8q7d2hvn"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-byteorder" ,rust-byteorder-1)
        ("rust-futures" ,rust-futures-0.1)
        ("rust-librespot-core" ,rust-librespot-core-0.1)
        ("rust-librespot-protocol" ,rust-librespot-protocol-0.1)
        ("rust-linear-map" ,rust-linear-map-1)
        ("rust-log" ,rust-log-0.4)
        ("rust-protobuf" ,rust-protobuf-2))))
    (home-page "https://github.com/librespot-org/librespot")
    (synopsis "The metadata logic for librespot")
    (description "The metadata logic for librespot")
    (license license:expat)))

(define-public rust-libpulse-sys-0.0.0
  (package
    (name "rust-libpulse-sys")
    (version "0.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "libpulse-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1b74hfq24jzqycfs0ywwvzlkfxvc7r2z8p323c6510zqz831pccv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t #:cargo-inputs (("rust-libc" ,rust-libc-0.2))))
    (home-page "https://github.com/jnqnfe/pulse-binding-rust")
    (synopsis "FFI bindings for the PulseAudio libpulse system library.")
    (description "FFI bindings for the PulseAudio libpulse system library.")
    (license #f)))

(define-public rust-jack-sys-0.2
  (package
    (name "rust-jack-sys")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "jack-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0hggdy2zkvq9c0agkcscm7hr8lfqmjfbqfgd36vz5v6zf86kz62p"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-libloading" ,rust-libloading-0.6))))
    (home-page "https://github.com/RustAudio/rust-jack/tree/main/jack-sys")
    (synopsis "Low-level binding to the JACK audio API.")
    (description "Low-level binding to the JACK audio API.")
    (license (list license:expat license:asl2.0))))

(define-public rust-jack-0.5
  (package
    (name "rust-jack")
    (version "0.5.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "jack" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1pr2fkjh181b6qjx940vp8hamcadq21p0l7z0nhp8nif5rczq58y"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-0.7)
        ("rust-jack-sys" ,rust-jack-sys-0.2)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-libc" ,rust-libc-0.2))))
    (home-page "https://github.com/RustAudio/rust-jack")
    (synopsis "Real time audio and midi with JACK.")
    (description "Real time audio and midi with JACK.")
    (license license:expat)))

(define-public rust-gstreamer-base-0.15
  (package
    (name "rust-gstreamer-base")
    (version "0.15.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gstreamer-base" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "04hwa85j3w959i025il908bvsx6dyiawkmc0w45hn9kcrisjyma2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-glib" ,rust-glib-0.9)
        ("rust-glib-sys" ,rust-glib-sys-0.9)
        ("rust-gobject-sys" ,rust-gobject-sys-0.9)
        ("rust-gstreamer" ,rust-gstreamer-0.15)
        ("rust-gstreamer-base-sys" ,rust-gstreamer-base-sys-0.8)
        ("rust-gstreamer-sys" ,rust-gstreamer-sys-0.8)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-rustdoc-stripper" ,rust-rustdoc-stripper-0.1))))
    (home-page "https://gstreamer.freedesktop.org")
    (synopsis "Rust bindings for GStreamer Base library")
    (description "Rust bindings for GStreamer Base library")
    (license (list license:expat license:asl2.0))))

(define-public rust-gstreamer-base-sys-0.8
  (package
    (name "rust-gstreamer-base-sys")
    (version "0.8.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gstreamer-base-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1v9v09jqjrwz87c4r7za3yb6g7had112d8zwjdjmhg2b2x94yf5s"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-glib-sys" ,rust-glib-sys-0.9)
        ("rust-gobject-sys" ,rust-gobject-sys-0.9)
        ("rust-gstreamer-sys" ,rust-gstreamer-sys-0.8)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-pkg-config" ,rust-pkg-config-0.3))))
    (home-page "https://gstreamer.freedesktop.org")
    (synopsis "FFI bindings to libgstbase-1.0")
    (description "FFI bindings to libgstbase-1.0")
    (license license:expat)))

(define-public rust-gstreamer-app-sys-0.8
  (package
    (name "rust-gstreamer-app-sys")
    (version "0.8.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gstreamer-app-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0rw1sjbjhlsp31rrkm6l505hsxbzni323dhsfrfwlfy2abhrr1mz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-glib-sys" ,rust-glib-sys-0.9)
        ("rust-gstreamer-base-sys" ,rust-gstreamer-base-sys-0.8)
        ("rust-gstreamer-sys" ,rust-gstreamer-sys-0.8)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-pkg-config" ,rust-pkg-config-0.3))))
    (home-page "https://gstreamer.freedesktop.org")
    (synopsis "FFI bindings to libgstapp-1.0")
    (description "FFI bindings to libgstapp-1.0")
    (license license:expat)))

(define-public rust-gstreamer-app-0.15
  (package
    (name "rust-gstreamer-app")
    (version "0.15.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gstreamer-app" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1afnc6kvj7cpiwafdfjn0zfj37nhwbvzjp4n3qgdsnigskl895vq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-futures-core" ,rust-futures-core-0.3)
        ("rust-futures-sink" ,rust-futures-sink-0.3)
        ("rust-glib" ,rust-glib-0.9)
        ("rust-glib-sys" ,rust-glib-sys-0.9)
        ("rust-gobject-sys" ,rust-gobject-sys-0.9)
        ("rust-gstreamer" ,rust-gstreamer-0.15)
        ("rust-gstreamer-app-sys" ,rust-gstreamer-app-sys-0.8)
        ("rust-gstreamer-base" ,rust-gstreamer-base-0.15)
        ("rust-gstreamer-sys" ,rust-gstreamer-sys-0.8)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-rustdoc-stripper" ,rust-rustdoc-stripper-0.1))))
    (home-page "https://gstreamer.freedesktop.org")
    (synopsis "Rust bindings for GStreamer App library")
    (description "Rust bindings for GStreamer App library")
    (license (list license:expat license:asl2.0))))

(define-public rust-muldiv-0.2
  (package
    (name "rust-muldiv")
    (version "0.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "muldiv" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "014jlry2l2ph56mp8knw65637hh49q7fmrraim2bx9vz0a638684"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/sdroege/rust-muldiv")
    (synopsis
     "Provides a trait for numeric types to perform combined multiplication and
division with overflow protection
")
    (description
     "This package provides a trait for numeric types to perform combined multiplication and
division with overflow protection
")
    (license license:expat)))

(define-public rust-gstreamer-sys-0.8
  (package
    (name "rust-gstreamer-sys")
    (version "0.8.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gstreamer-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1nsk802vlcyi9p93sg60wv8fzb2mq7j52lfdda4va2kxp40xl60x"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-glib-sys" ,rust-glib-sys-0.9)
        ("rust-gobject-sys" ,rust-gobject-sys-0.9)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-pkg-config" ,rust-pkg-config-0.3))))
    (home-page "https://gstreamer.freedesktop.org")
    (synopsis "FFI bindings to libgstreamer-1.0")
    (description "FFI bindings to libgstreamer-1.0")
    (license license:expat)))

(define-public rust-gstreamer-0.15
  (package
    (name "rust-gstreamer")
    (version "0.15.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gstreamer" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0qx1fhr9ajms0128ixmi2ncr35llwppdb0z7ximw2vnd2jhn91nf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-cfg-if" ,rust-cfg-if-0.1)
        ("rust-futures-channel" ,rust-futures-channel-0.3)
        ("rust-futures-core" ,rust-futures-core-0.3)
        ("rust-futures-util" ,rust-futures-util-0.3)
        ("rust-glib" ,rust-glib-0.9)
        ("rust-glib-sys" ,rust-glib-sys-0.9)
        ("rust-gobject-sys" ,rust-gobject-sys-0.9)
        ("rust-gstreamer-sys" ,rust-gstreamer-sys-0.8)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-muldiv" ,rust-muldiv-0.2)
        ("rust-num-rational" ,rust-num-rational-0.2)
        ("rust-paste" ,rust-paste-0.1)
        ("rust-rustdoc-stripper" ,rust-rustdoc-stripper-0.1)
        ("rust-serde" ,rust-serde-1)
        ("rust-serde-bytes" ,rust-serde-bytes-0.11)
        ("rust-serde-derive" ,rust-serde-derive-1))))
    (home-page "https://gstreamer.freedesktop.org")
    (synopsis "Rust bindings for GStreamer")
    (description "Rust bindings for GStreamer")
    (license (list license:expat license:asl2.0))))

(define-public rust-stdweb-0.1
  (package
    (name "rust-stdweb")
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "stdweb" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0gjk7ch31a3kgdc39kj4zqinf10yqaf717wanh9kwwbbwg430m7g"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-clippy" ,rust-clippy-0.0)
        ("rust-serde" ,rust-serde-1)
        ("rust-serde-json" ,rust-serde-json-1))))
    (home-page "https://github.com/koute/stdweb")
    (synopsis "A standard library for the client-side Web")
    (description
     "This package provides a standard library for the client-side Web")
    (license (list license:expat license:asl2.0))))

(define-public rust-bindgen-0.56
  (package
    (name "rust-bindgen")
    (version "0.56.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bindgen" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0fajmgk2064ca1z9iq1jjkji63qwwz38z3d67kv6xdy0xgdpk8rd"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-cexpr" ,rust-cexpr-0.4)
        ("rust-clang-sys" ,rust-clang-sys-1)
        ("rust-clap" ,rust-clap-2)
        ("rust-env-logger" ,rust-env-logger-0.8)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-lazycell" ,rust-lazycell-1)
        ("rust-log" ,rust-log-0.4)
        ("rust-peeking-take-while" ,rust-peeking-take-while-0.1)
        ("rust-proc-macro2" ,rust-proc-macro2-1)
        ("rust-quote" ,rust-quote-1)
        ("rust-regex" ,rust-regex-1)
        ("rust-rustc-hash" ,rust-rustc-hash-1)
        ("rust-shlex" ,rust-shlex-0.1)
        ("rust-which" ,rust-which-3))))
    (home-page "https://rust-lang.github.io/rust-bindgen/")
    (synopsis
     "Automatically generates Rust FFI bindings to C and C++ libraries.")
    (description
     "Automatically generates Rust FFI bindings to C and C++ libraries.")
    (license license:bsd-3)))

(define-public rust-coreaudio-sys-0.2
  (package
    (name "rust-coreaudio-sys")
    (version "0.2.8")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "coreaudio-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1yiipfq8gni2fkh62kzzprqgnfb77046d392p9mb82bapr3k6zib"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t #:cargo-inputs (("rust-bindgen" ,rust-bindgen-0.56))))
    (home-page "https://github.com/RustAudio/coreaudio-sys")
    (synopsis
     "Bindings for Apple's CoreAudio frameworks generated via rust-bindgen")
    (description
     "Bindings for Apple's CoreAudio frameworks generated via rust-bindgen")
    (license license:expat)))

(define-public rust-coreaudio-rs-0.9
  (package
    (name "rust-coreaudio-rs")
    (version "0.9.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "coreaudio-rs" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "14g4yqsbhif2bqdk4qk0lixfy78gl1p8lrl122qyklysclcpcagj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-coreaudio-sys" ,rust-coreaudio-sys-0.2))))
    (home-page "https://github.com/RustAudio/coreaudio-rs")
    (synopsis "A friendly rust interface for Apple's CoreAudio API.")
    (description
     "This package provides a friendly rust interface for Apple's CoreAudio API.")
    (license (list license:expat license:asl2.0))))

(define-public rust-core-foundation-sys-0.5
  (package
    (name "rust-core-foundation-sys")
    (version "0.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "core-foundation-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1yiyi30bnlnh29i21gp5f411b4qaj05vc8zp8j1y9b0khqg2fv3i"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t #:cargo-inputs (("rust-libc" ,rust-libc-0.2))))
    (home-page "https://github.com/servo/core-foundation-rs")
    (synopsis "Bindings to Core Foundation for macOS")
    (description "Bindings to Core Foundation for macOS")
    (license (list license:expat license:asl2.0))))

(define-public rust-cpal-0.8
  (package
    (name "rust-cpal")
    (version "0.8.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cpal" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "17l298jyp4lanl0igxp30m6xnv84gacvdbp3ylrv5c9ncpny32nm"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-alsa-sys" ,rust-alsa-sys-0.1)
        ("rust-core-foundation-sys" ,rust-core-foundation-sys-0.5)
        ("rust-coreaudio-rs" ,rust-coreaudio-rs-0.9)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-stdweb" ,rust-stdweb-0.1)
        ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/rustaudio/cpal")
    (synopsis "Low-level cross-platform audio I/O library in pure Rust.")
    (description "Low-level cross-platform audio I/O library in pure Rust.")
    (license license:asl2.0)))

(define-public rust-nix-0.9
  (package
    (name "rust-nix")
    (version "0.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "nix" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0cpvygha6bak7apkp9cm5snmld3lnm26crlxavl7pv4q07mszid2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-0.9)
        ("rust-cfg-if" ,rust-cfg-if-0.1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-void" ,rust-void-1))))
    (home-page "https://github.com/nix-rust/nix")
    (synopsis "Rust friendly bindings to *nix APIs")
    (description "Rust friendly bindings to *nix APIs")
    (license license:expat)))

(define-public rust-alsa-0.2
  (package
    (name "rust-alsa")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "alsa" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0cpb9bz4r4x564gp0yclb1589bab7ghsxjcvvv2l2c5jr3mx985l"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-alsa-sys" ,rust-alsa-sys-0.1)
        ("rust-bitflags" ,rust-bitflags-0.9)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-nix" ,rust-nix-0.9))))
    (home-page "https://github.com/diwic/alsa-rs")
    (synopsis "Thin but safe wrappers for ALSA (Linux sound API)")
    (description "Thin but safe wrappers for ALSA (Linux sound API)")
    (license (list license:asl2.0 license:expat))))

(define-public rust-librespot-playback-0.1
  (package
    (name "rust-librespot-playback")
    (version "0.1.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "librespot-playback" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1mpczkj967wv51srcjlqaz3r9b2lyqdmn62cd4n1bxgcidhwlj8j"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-alsa" ,rust-alsa-0.2)
        ("rust-byteorder" ,rust-byteorder-1)
        ("rust-cpal" ,rust-cpal-0.8)
        ("rust-futures" ,rust-futures-0.1)
        ("rust-glib" ,rust-glib-0.9)
        ("rust-gstreamer" ,rust-gstreamer-0.15)
        ("rust-gstreamer-app" ,rust-gstreamer-app-0.15)
        ("rust-jack" ,rust-jack-0.5)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-libpulse-sys" ,rust-libpulse-sys-0.0.0)
        ("rust-librespot-audio" ,rust-librespot-audio-0.1)
        ("rust-librespot-core" ,rust-librespot-core-0.1)
        ("rust-librespot-metadata" ,rust-librespot-metadata-0.1)
        ("rust-log" ,rust-log-0.4)
        ("rust-portaudio-rs" ,rust-portaudio-rs-0.3)
        ("rust-rodio" ,rust-rodio-0.9)
        ("rust-sdl2" ,rust-sdl2-0.32)
        ("rust-shell-words" ,rust-shell-words-0.1)
        ("rust-zerocopy" ,rust-zerocopy-0.2))))
    (home-page "https://github.com/librespot-org/librespot")
    (synopsis "The audio playback logic for librespot")
    (description "The audio playback logic for librespot")
    (license license:expat)))

(define-public rust-multimap-0.8
  (package
    (name "rust-multimap")
    (version "0.8.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "multimap" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0sicyz4n500vdhgcxn4g8jz97cp1ijir1rnbgph3pmx9ckz4dkp5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t #:cargo-inputs (("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/havarnov/multimap")
    (synopsis "A multimap implementation.")
    (description "This package provides a multimap implementation.")
    (license (list license:expat license:asl2.0))))

(define-public rust-if-addrs-sys-0.3
  (package
    (name "rust-if-addrs-sys")
    (version "0.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "if-addrs-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1skrzs79rafv185064p44r0k1va9ig4bfnpbwlvyhxh4g3fvjx6y"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-cc" ,rust-cc-1) ("rust-libc" ,rust-libc-0.2))))
    (home-page "https://github.com/messense/if-addrs")
    (synopsis "if_addrs sys crate")
    (description "if_addrs sys crate")
    (license (list license:expat license:bsd-3))))

(define-public rust-if-addrs-0.6
  (package
    (name "rust-if-addrs")
    (version "0.6.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "if-addrs" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1j7va2mn8rlvwadpnzzlbq544l76b748vz9zf6n90a35mz23xa69"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-if-addrs-sys" ,rust-if-addrs-sys-0.3)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/messense/if-addrs")
    (synopsis "Return interface IP addresses on Posix and windows systems")
    (description "Return interface IP addresses on Posix and windows systems")
    (license (list license:expat license:bsd-3))))

(define-public rust-libmdns-0.2
  (package
    (name "rust-libmdns")
    (version "0.2.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "libmdns" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0kirdfq8i9r5irnxrhsnhc0pqli4kdqar0n47dim6v3kfk0q51ax"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-byteorder" ,rust-byteorder-1)
        ("rust-futures" ,rust-futures-0.1)
        ("rust-hostname" ,rust-hostname-0.3)
        ("rust-if-addrs" ,rust-if-addrs-0.6)
        ("rust-log" ,rust-log-0.4)
        ("rust-multimap" ,rust-multimap-0.8)
        ("rust-net2" ,rust-net2-0.2)
        ("rust-quick-error" ,rust-quick-error-1)
        ("rust-rand" ,rust-rand-0.7)
        ("rust-tokio-core" ,rust-tokio-core-0.1))))
    (home-page "https://github.com/librespot-org/libmdns")
    (synopsis
     "mDNS Responder library for building discoverable LAN services in Rust")
    (description
     "mDNS Responder library for building discoverable LAN services in Rust")
    (license license:expat)))

(define-public rust-dns-sd-0.1
  (package
    (name "rust-dns-sd")
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "dns-sd" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "11r0jymjshfnn3sh2nqjhrikk4r5rr1g36sip9iqy8i0xafm0j6p"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ("rust-pkg-config" ,rust-pkg-config-0.3))))
    (home-page "https://github.com/plietar/rust-dns-sd")
    (synopsis "Rust binding for dns-sd")
    (description "Rust binding for dns-sd")
    (license license:expat)))

(define-public rust-block-modes-0.3
  (package
    (name "rust-block-modes")
    (version "0.3.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "block-modes" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0af562hvwgbvn38npmrw5rybvma819rvb7wh6avzsfay14889aii"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-block-cipher-trait" ,rust-block-cipher-trait-0.6)
        ("rust-block-padding" ,rust-block-padding-0.1))))
    (home-page "https://github.com/RustCrypto/block-ciphers")
    (synopsis "Block cipher modes of operation")
    (description "Block cipher modes of operation")
    (license (list license:expat license:asl2.0))))

(define-public rust-librespot-connect-0.1
  (package
    (name "rust-librespot-connect")
    (version "0.1.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "librespot-connect" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1r82z5ggs5rsih7kch5kpdyb0ajjb8h88fkg97r5na6xy23mmapx"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-aes-ctr" ,rust-aes-ctr-0.3)
        ("rust-base64" ,rust-base64-0.10)
        ("rust-block-modes" ,rust-block-modes-0.3)
        ("rust-dns-sd" ,rust-dns-sd-0.1)
        ("rust-futures" ,rust-futures-0.1)
        ("rust-hmac" ,rust-hmac-0.7)
        ("rust-hyper" ,rust-hyper-0.11)
        ("rust-libmdns" ,rust-libmdns-0.2)
        ("rust-librespot-core" ,rust-librespot-core-0.1)
        ("rust-librespot-playback" ,rust-librespot-playback-0.1)
        ("rust-librespot-protocol" ,rust-librespot-protocol-0.1)
        ("rust-log" ,rust-log-0.4)
        ("rust-num-bigint" ,rust-num-bigint-0.2)
        ("rust-protobuf" ,rust-protobuf-2)
        ("rust-rand" ,rust-rand-0.7)
        ("rust-serde" ,rust-serde-1)
        ("rust-serde-derive" ,rust-serde-derive-1)
        ("rust-serde-json" ,rust-serde-json-1)
        ("rust-sha-1" ,rust-sha-1-0.8)
        ("rust-tokio-core" ,rust-tokio-core-0.1)
        ("rust-url" ,rust-url-1))))
    (home-page "https://github.com/librespot-org/librespot")
    (synopsis "The discovery and Spotify Connect logic for librespot")
    (description "The discovery and Spotify Connect logic for librespot")
    (license license:expat)))

(define-public rust-vorbisfile-sys-0.0.8
  (package
    (name "rust-vorbisfile-sys")
    (version "0.0.8")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "vorbisfile-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1la2j2zbzdjd93byz21ij58c540bfn1r9pi0bssrjimcw7bhchsg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-gcc" ,rust-gcc-0.3)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-ogg-sys" ,rust-ogg-sys-0.0.9)
        ("rust-pkg-config" ,rust-pkg-config-0.3)
        ("rust-vorbis-sys" ,rust-vorbis-sys-0.1))))
    (home-page "")
    (synopsis "FFI for the vorbisfile library")
    (description "FFI for the vorbisfile library")
    (license license:expat)))

(define-public rust-vorbis-sys-0.1
  (package
    (name "rust-vorbis-sys")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "vorbis-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1zgv7lwa4b2z091g25h83zil8bawk4frc1f0ril5xa31agpxd7mx"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-cc" ,rust-cc-1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-ogg-sys" ,rust-ogg-sys-0.0.9)
        ("rust-pkg-config" ,rust-pkg-config-0.3))))
    (home-page "")
    (synopsis "FFI for the libvorbis library")
    (description "FFI for the libvorbis library")
    (license license:expat)))

(define-public rust-vorbis-0.0.14
  (package
    (name "rust-vorbis")
    (version "0.0.14")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "vorbis" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0xn7diq8qz2zmsmwzg3rcsxmpmm2gj7wgnl2gdan0lq7ax21k2jy"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ("rust-ogg-sys" ,rust-ogg-sys-0.0.9)
        ("rust-vorbis-sys" ,rust-vorbis-sys-0.1)
        ("rust-vorbisfile-sys" ,rust-vorbisfile-sys-0.0.8))))
    (home-page "https://github.com/tomaka/vorbis-rs")
    (synopsis "High-level bindings for the official libvorbis library.")
    (description "High-level bindings for the official libvorbis library.")
    (license license:asl2.0)))

(define-public rust-ogg-sys-0.0.9
  (package
    (name "rust-ogg-sys")
    (version "0.0.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ogg-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1cpx6n5ndh2d59g43l6rj3myzi5jsc0n6rldpx0impqp5qbqqnx9"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-gcc" ,rust-gcc-0.3)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-pkg-config" ,rust-pkg-config-0.3))))
    (home-page "https://github.com/tomaka/ogg-sys")
    (synopsis "FFI for libogg, the media container.")
    (description "FFI for libogg, the media container.")
    (license license:expat)))

(define-public rust-librespot-tremor-0.2
  (package
    (name "rust-librespot-tremor")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "librespot-tremor" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1zmld16zawvn7ayrf318lwdr2d7awn4bk9s0d6kpim0mz6zjbxcp"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-cc" ,rust-cc-1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-ogg-sys" ,rust-ogg-sys-0.0.9)
        ("rust-pkg-config" ,rust-pkg-config-0.3))))
    (home-page "")
    (synopsis "Rust bindings to tremor")
    (description "Rust bindings to tremor")
    (license license:expat)))

(define-public rust-shannon-0.2
  (package
    (name "rust-shannon")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "shannon" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0qa52zs4y1i87ysr11g9p6shpdagl14bb340gfm6rd97jhfb99by"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-byteorder" ,rust-byteorder-1))))
    (home-page "")
    (synopsis "Shannon cipher implementation")
    (description "Shannon cipher implementation")
    (license license:expat)))

(define-public rust-protobuf-codegen-pure-2
  (package
    (name "rust-protobuf-codegen-pure")
    (version "2.14.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "protobuf-codegen-pure" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0h34gfqlb7bqmgqv1mfgy5wk35z5r2h5ki3p3pdcmw1vqzmly6id"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-protobuf" ,rust-protobuf-2)
        ("rust-protobuf-codegen" ,rust-protobuf-codegen-2))))
    (home-page
     "https://github.com/stepancheg/rust-protobuf/tree/master/protobuf-codegen-pure/")
    (synopsis
     "Pure-rust codegen for protobuf using protobuf-parser crate

WIP
")
    (description
     "Pure-rust codegen for protobuf using protobuf-parser crate

WIP
")
    (license license:expat)))

(define-public rust-protobuf-codegen-2
  (package
    (name "rust-protobuf-codegen")
    (version "2.14.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "protobuf-codegen" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "031bx325lsgcx7wc76vc2cqph6q0b34jgc8nz0g2rkwcfnx3n4fy"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t #:cargo-inputs (("rust-protobuf" ,rust-protobuf-2))))
    (home-page "https://github.com/stepancheg/rust-protobuf/")
    (synopsis
     "Code generator for rust-protobuf.

Includes a library and `protoc-gen-rust` binary.

See `protoc-rust` and `protobuf-codegen-pure` crates.
")
    (description
     "Code generator for rust-protobuf.

Includes a library and `protoc-gen-rust` binary.

See `protoc-rust` and `protobuf-codegen-pure` crates.
")
    (license license:expat)))

(define-public rust-protobuf-2
  (package
    (name "rust-protobuf")
    (version "2.14.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "protobuf" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "11bl8hf522s9mbkckivnn9n8s3ss4g41w6jmfdsswmr5adqd71lf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-bytes" ,rust-bytes-0.5)
        ("rust-serde" ,rust-serde-1)
        ("rust-serde-derive" ,rust-serde-derive-1))))
    (home-page "https://github.com/stepancheg/rust-protobuf/")
    (synopsis "Rust implementation of Google protocol buffers
")
    (description "Rust implementation of Google protocol buffers
")
    (license license:expat)))

(define-public rust-librespot-protocol-0.1
  (package
    (name "rust-librespot-protocol")
    (version "0.1.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "librespot-protocol" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1n8gr8g4yrjp6i0rbsm7vpq00x9yh3lbjkzy1m5d8sgkkss048yl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-glob" ,rust-glob-0.3)
        ("rust-protobuf" ,rust-protobuf-2)
        ("rust-protobuf-codegen" ,rust-protobuf-codegen-2)
        ("rust-protobuf-codegen-pure" ,rust-protobuf-codegen-pure-2))))
    (home-page "https://github.com/librespot-org/librespot")
    (synopsis "The protobuf logic for communicating with Spotify servers")
    (description "The protobuf logic for communicating with Spotify servers")
    (license license:expat)))

(define-public rust-tokio-tls-0.1
  (package
    (name "rust-tokio-tls")
    (version "0.1.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tokio-tls" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "04yrdscn8m9qza8ms09pqipbmj6x2q64jgm5n3ipy4b0wl24nbvp"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-futures" ,rust-futures-0.1)
        ("rust-native-tls" ,rust-native-tls-0.1)
        ("rust-tokio-core" ,rust-tokio-core-0.1)
        ("rust-tokio-io" ,rust-tokio-io-0.1)
        ("rust-tokio-proto" ,rust-tokio-proto-0.1))))
    (home-page "https://tokio.rs")
    (synopsis
     "Deprecated in favor of `tokio-naitve-tls`.

An implementation of TLS/SSL streams for Tokio giving an implementation of TLS
for nonblocking I/O streams.
")
    (description
     "Deprecated in favor of `tokio-naitve-tls`.

An implementation of TLS/SSL streams for Tokio giving an implementation of TLS
for nonblocking I/O streams.
")
    (license (list license:expat license:asl2.0))))

(define-public rust-hyper-tls-0.1
  (package
    (name "rust-hyper-tls")
    (version "0.1.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "hyper-tls" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0y13a98grzvgza9wpql0gmghwhp48jzxn5dk1a26ac4da5gbvcgz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-futures" ,rust-futures-0.1)
        ("rust-hyper" ,rust-hyper-0.11)
        ("rust-native-tls" ,rust-native-tls-0.1)
        ("rust-tokio-core" ,rust-tokio-core-0.1)
        ("rust-tokio-io" ,rust-tokio-io-0.1)
        ("rust-tokio-service" ,rust-tokio-service-0.1)
        ("rust-tokio-tls" ,rust-tokio-tls-0.1))))
    (home-page "https://hyper.rs")
    (synopsis "Default TLS implementation for use with hyper")
    (description "Default TLS implementation for use with hyper")
    (license (list license:expat license:asl2.0))))

(define-public rust-hyper-proxy-0.4
  (package
    (name "rust-hyper-proxy")
    (version "0.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "hyper-proxy" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1kmy7xybj9sdw2162bzhcxap93syq89d4za7dqg4hzklw9fr5w24"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-bytes" ,rust-bytes-0.4)
        ("rust-futures" ,rust-futures-0.1)
        ("rust-hyper" ,rust-hyper-0.11)
        ("rust-hyper-tls" ,rust-hyper-tls-0.1)
        ("rust-native-tls" ,rust-native-tls-0.1)
        ("rust-tokio-core" ,rust-tokio-core-0.1)
        ("rust-tokio-io" ,rust-tokio-io-0.1)
        ("rust-tokio-tls" ,rust-tokio-tls-0.1))))
    (home-page "https://github.com/tafia/hyper-proxy")
    (synopsis "A proxy connector for Hyper-based applications")
    (description
     "This package provides a proxy connector for Hyper-based applications")
    (license license:expat)))

(define-public rust-librespot-core-0.1
  (package
    (name "rust-librespot-core")
    (version "0.1.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "librespot-core" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "02mzh76xx014bvffbzqnybr5s8c7ycyphg1qn71c6lhiyvqay7i7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-aes" ,rust-aes-0.3)
        ("rust-base64" ,rust-base64-0.10)
        ("rust-byteorder" ,rust-byteorder-1)
        ("rust-bytes" ,rust-bytes-0.4)
        ("rust-error-chain" ,rust-error-chain-0.12)
        ("rust-futures" ,rust-futures-0.1)
        ("rust-hmac" ,rust-hmac-0.7)
        ("rust-httparse" ,rust-httparse-1)
        ("rust-hyper" ,rust-hyper-0.11)
        ("rust-hyper-proxy" ,rust-hyper-proxy-0.4)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-librespot-protocol" ,rust-librespot-protocol-0.1)
        ("rust-log" ,rust-log-0.4)
        ("rust-num-bigint" ,rust-num-bigint-0.2)
        ("rust-num-integer" ,rust-num-integer-0.1)
        ("rust-num-traits" ,rust-num-traits-0.2)
        ("rust-pbkdf2" ,rust-pbkdf2-0.3)
        ("rust-protobuf" ,rust-protobuf-2)
        ("rust-rand" ,rust-rand-0.7)
        ("rust-rand" ,rust-rand-0.7)
        ("rust-serde" ,rust-serde-1)
        ("rust-serde-derive" ,rust-serde-derive-1)
        ("rust-serde-json" ,rust-serde-json-1)
        ("rust-sha-1" ,rust-sha-1-0.8)
        ("rust-shannon" ,rust-shannon-0.2)
        ("rust-tokio-codec" ,rust-tokio-codec-0.1)
        ("rust-tokio-core" ,rust-tokio-core-0.1)
        ("rust-tokio-io" ,rust-tokio-io-0.1)
        ("rust-url" ,rust-url-1)
        ("rust-uuid" ,rust-uuid-0.7)
        ("rust-vergen" ,rust-vergen-3))))
    (home-page "https://github.com/librespot-org/librespot")
    (synopsis "The core functionality provided by librespot")
    (description "The core functionality provided by librespot")
    (license license:expat)))

(define-public rust-ogg-0.7
  (package
    (name "rust-ogg")
    (version "0.7.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ogg" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0ldnq9hccrsaqyzp6yb6w2nn1mpd4wd5fqsckmrf3ybsa71p3r8k"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-byteorder" ,rust-byteorder-1)
        ("rust-bytes" ,rust-bytes-0.4)
        ("rust-futures" ,rust-futures-0.1)
        ("rust-tokio-io" ,rust-tokio-io-0.1))))
    (home-page "https://github.com/RustAudio/ogg")
    (synopsis "Ogg container decoder and encoder written in pure Rust")
    (description "Ogg container decoder and encoder written in pure Rust")
    (license license:bsd-3)))

(define-public rust-lewton-0.9
  (package
    (name "rust-lewton")
    (version "0.9.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "lewton" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1l4bc88cpr8p94dfycykn8gajg20kp611kx159fc8dkh64d2qm4d"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-byteorder" ,rust-byteorder-1)
        ("rust-futures" ,rust-futures-0.1)
        ("rust-ogg" ,rust-ogg-0.7)
        ("rust-smallvec" ,rust-smallvec-0.6)
        ("rust-tokio-io" ,rust-tokio-io-0.1))))
    (home-page "https://github.com/RustAudio/lewton")
    (synopsis "Pure Rust vorbis decoder")
    (description "Pure Rust vorbis decoder")
    (license (list license:expat license:asl2.0))))

(define-public rust-ctr-0.3
  (package
    (name "rust-ctr")
    (version "0.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ctr" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0dk7ik2pjr10q8b3bm64af10k0x0xkl6y02xs9kxz4a4f28xcb02"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-block-cipher-trait" ,rust-block-cipher-trait-0.6)
        ("rust-stream-cipher" ,rust-stream-cipher-0.3))))
    (home-page "https://github.com/RustCrypto/stream-ciphers")
    (synopsis "CTR block mode of operation")
    (description "CTR block mode of operation")
    (license (list license:expat license:asl2.0))))

(define-public rust-aes-ctr-0.3
  (package
    (name "rust-aes-ctr")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "aes-ctr" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1vnib0h0ala3dg07iks60vwi13jgar33j3wc3l6sxgm3ir2v1rfj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-aes-soft" ,rust-aes-soft-0.3)
        ("rust-aesni" ,rust-aesni-0.6)
        ("rust-ctr" ,rust-ctr-0.3)
        ("rust-stream-cipher" ,rust-stream-cipher-0.3))))
    (home-page "https://github.com/RustCrypto/block-ciphers/tree/master/aes")
    (synopsis "DEPRECATED: replaced by the `aes` crate")
    (description "DEPRECATED: replaced by the `aes` crate")
    (license (list license:expat license:asl2.0))))

(define-public rust-librespot-audio-0.1
  (package
    (name "rust-librespot-audio")
    (version "0.1.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "librespot-audio" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1kpk83m67ahb65q4h1f2b0k4pa1rdlj73gxfmpzdrn4c2m0icr4l"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-aes-ctr" ,rust-aes-ctr-0.3)
        ("rust-bit-set" ,rust-bit-set-0.5)
        ("rust-byteorder" ,rust-byteorder-1)
        ("rust-bytes" ,rust-bytes-0.4)
        ("rust-futures" ,rust-futures-0.1)
        ("rust-lewton" ,rust-lewton-0.9)
        ("rust-librespot-core" ,rust-librespot-core-0.1)
        ("rust-librespot-tremor" ,rust-librespot-tremor-0.2)
        ("rust-log" ,rust-log-0.4)
        ("rust-num-bigint" ,rust-num-bigint-0.2)
        ("rust-num-traits" ,rust-num-traits-0.2)
        ("rust-tempfile" ,rust-tempfile-3)
        ("rust-vorbis" ,rust-vorbis-0.0.14))))
    (home-page "")
    (synopsis "The audio fetching and processing logic for librespot")
    (description "The audio fetching and processing logic for librespot")
    (license license:expat)))

(define-public rust-librespot-0.1
  (package
    (name "rust-librespot")
    (version "0.1.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "librespot" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0rn53hamcbknh3k1h9l5cy62gq78wwsq915xqng8ddr0x8ny575b"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-base64" ,rust-base64-0.10)
        ("rust-env-logger" ,rust-env-logger-0.6)
        ("rust-futures" ,rust-futures-0.1)
        ("rust-getopts" ,rust-getopts-0.2)
        ("rust-hex" ,rust-hex-0.3)
        ("rust-hyper" ,rust-hyper-0.11)
        ("rust-librespot-audio" ,rust-librespot-audio-0.1)
        ("rust-librespot-connect" ,rust-librespot-connect-0.1)
        ("rust-librespot-core" ,rust-librespot-core-0.1)
        ("rust-librespot-metadata" ,rust-librespot-metadata-0.1)
        ("rust-librespot-playback" ,rust-librespot-playback-0.1)
        ("rust-librespot-protocol" ,rust-librespot-protocol-0.1)
        ("rust-log" ,rust-log-0.4)
        ("rust-num-bigint" ,rust-num-bigint-0.2)
        ("rust-protobuf" ,rust-protobuf-2)
        ("rust-rand" ,rust-rand-0.7)
        ("rust-rpassword" ,rust-rpassword-3)
        ("rust-sha-1" ,rust-sha-1-0.8)
        ("rust-tokio-core" ,rust-tokio-core-0.1)
        ("rust-tokio-io" ,rust-tokio-io-0.1)
        ("rust-tokio-process" ,rust-tokio-process-0.2)
        ("rust-tokio-signal" ,rust-tokio-signal-0.2)
        ("rust-url" ,rust-url-1))))
    (home-page "https://github.com/librespot-org/librespot")
    (synopsis
     "An open source client library for Spotify, with support for Spotify Connect")
    (description
     "An open source client library for Spotify, with support for Spotify Connect")
    (license license:expat)))

(define-public rust-security-framework-sys-0.4
  (package
    (name "rust-security-framework-sys")
    (version "0.4.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "security-framework-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "01c4fkj78frz6kz9vri1am2pbkz52raxws5lbrli5xajjbci3gqp"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-core-foundation-sys" ,rust-core-foundation-sys-0.7)
        ("rust-libc" ,rust-libc-0.2))))
    (home-page "https://lib.rs/crates/security-framework-sys")
    (synopsis "Apple `Security.framework` low-level FFI bindings")
    (description "Apple `Security.framework` low-level FFI bindings")
    (license (list license:expat license:asl2.0))))

(define-public rust-security-framework-0.4
  (package
    (name "rust-security-framework")
    (version "0.4.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "security-framework" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0dg504y0ys27qksdcnn8qcyvrfhkjx8f5d6jvpm7i7yrsw18k034"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-core-foundation" ,rust-core-foundation-0.7)
        ("rust-core-foundation-sys" ,rust-core-foundation-sys-0.7)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-security-framework-sys" ,rust-security-framework-sys-0.4))))
    (home-page "https://lib.rs/crates/security_framework")
    (synopsis "Security.framework bindings for macOS and iOS")
    (description "Security.framework bindings for macOS and iOS")
    (license (list license:expat license:asl2.0))))

(define-public rust-hkdf-0.10
  (package
    (name "rust-hkdf")
    (version "0.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "hkdf" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0kwn3scjvv2x8zc6nz3wrnzxp9shpsdxnjqiyv2r65r3kiijzasi"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-digest" ,rust-digest-0.9) ("rust-hmac" ,rust-hmac-0.10))))
    (home-page "https://github.com/RustCrypto/KDFs/")
    (synopsis "HMAC-based Extract-and-Expand Key Derivation Function (HKDF)")
    (description
     "HMAC-based Extract-and-Expand Key Derivation Function (HKDF)")
    (license (list license:expat license:asl2.0))))

(define-public rust-dbus-0.2
  (package
    (name "rust-dbus")
    (version "0.2.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "dbus" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0b85dl7y396g8xh1xh89wxnb1fvvf840dar9axavfhhhlq7c385l"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t #:cargo-inputs (("rust-libc" ,rust-libc-0.2))))
    (home-page "https://github.com/diwic/dbus-rs")
    (synopsis
     "Bindings to D-Bus, which is a bus commonly used on Linux for inter-process communication.")
    (description
     "Bindings to D-Bus, which is a bus commonly used on Linux for inter-process communication.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-block-modes-0.7
  (package
    (name "rust-block-modes")
    (version "0.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "block-modes" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1w3jc3n7k4xq98b9mfina4wwpg1fq1s3b0mm5whqialb7q3yi82p"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-block-padding" ,rust-block-padding-0.2)
        ("rust-cipher" ,rust-cipher-0.2))))
    (home-page "https://github.com/RustCrypto/block-ciphers")
    (synopsis "Block cipher modes of operation")
    (description "Block cipher modes of operation")
    (license (list license:expat license:asl2.0))))

(define-public rust-aesni-0.10
  (package
    (name "rust-aesni")
    (version "0.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "aesni" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1kmh07fp9hbi1aa8dr2rybbgw8vqz6hjmk34c4w7sbscx7si2bpa"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-cipher" ,rust-cipher-0.2)
        ("rust-opaque-debug" ,rust-opaque-debug-0.3))))
    (home-page "https://github.com/RustCrypto/block-ciphers/tree/master/aes")
    (synopsis "DEPRECATED: replaced by the `aes` crate")
    (description "DEPRECATED: replaced by the `aes` crate")
    (license (list license:expat license:asl2.0))))

(define-public rust-aes-soft-0.6
  (package
    (name "rust-aes-soft")
    (version "0.6.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "aes-soft" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0wj0fi2pvmlw09yvb1aqf0mfkzrfxmjsf90finijh255ir4wf55y"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-cipher" ,rust-cipher-0.2)
        ("rust-opaque-debug" ,rust-opaque-debug-0.3))))
    (home-page "https://github.com/RustCrypto/block-ciphers/tree/master/aes")
    (synopsis "DEPRECATED: replaced by the `aes` crate")
    (description "DEPRECATED: replaced by the `aes` crate")
    (license (list license:expat license:asl2.0))))

(define-public rust-aes-0.6
  (package
    (name "rust-aes")
    (version "0.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "aes" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0q85mw70mgr4glza9y9lrs9nxfa1cdcqzfk6wx0smb3623pr2hw8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-aes-soft" ,rust-aes-soft-0.6)
        ("rust-aesni" ,rust-aesni-0.10)
        ("rust-cipher" ,rust-cipher-0.2))))
    (home-page "https://github.com/RustCrypto/block-ciphers")
    (synopsis
     "Pure Rust implementation of the Advanced Encryption Standard (a.k.a. Rijndael)
including support for AES in counter mode (a.k.a. AES-CTR)
")
    (description
     "Pure Rust implementation of the Advanced Encryption Standard (a.k.a.  Rijndael)
including support for AES in counter mode (a.k.a.  AES-CTR)
")
    (license (list license:expat license:asl2.0))))

(define-public rust-secret-service-1
  (package
    (name "rust-secret-service")
    (version "1.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "secret-service" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "12hxz35i7sw5xsdldz1c6776fmz98z4dwh5779jis98w61020xbd"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-aes" ,rust-aes-0.6)
        ("rust-block-modes" ,rust-block-modes-0.7)
        ("rust-dbus" ,rust-dbus-0.2)
        ("rust-hkdf" ,rust-hkdf-0.10)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-num" ,rust-num-0.3)
        ("rust-rand" ,rust-rand-0.7)
        ("rust-sha2" ,rust-sha2-0.9))))
    (home-page "https://github.com/hwchen/secret-service-rs.git")
    (synopsis "Library to interface with Secret Service API")
    (description "Library to interface with Secret Service API")
    (license (list license:expat license:asl2.0))))

(define-public rust-keyring-0.10
  (package
    (name "rust-keyring")
    (version "0.10.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "keyring" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1ylz593bd2xw45839iivp6frclrfi1v2zz85qy9rkxlrh7s69k9b"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-byteorder" ,rust-byteorder-1)
        ("rust-secret-service" ,rust-secret-service-1)
        ("rust-security-framework" ,rust-security-framework-0.4)
        ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/hwchen/keyring-rs.git")
    (synopsis "Cross-platform library for managing passwords")
    (description "Cross-platform library for managing passwords")
    (license (list license:expat license:asl2.0))))

(define-public rust-dbus-tokio-0.2
  (package
    (name "rust-dbus-tokio")
    (version "0.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "dbus-tokio" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1b87p6gzfycl2hrpcsnv7dak93m1nrmiyirh02g3mmmk7sjqm9f4"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-dbus" ,rust-dbus-0.6)
        ("rust-futures" ,rust-futures-0.1)
        ("rust-log" ,rust-log-0.3)
        ("rust-mio" ,rust-mio-0.6)
        ("rust-tokio-core" ,rust-tokio-core-0.1))))
    (home-page "https://github.com/diwic/dbus-rs")
    (synopsis
     "Makes it possible to use Tokio with D-Bus, which is a bus commonly used on Linux for inter-process communication.")
    (description
     "Makes it possible to use Tokio with D-Bus, which is a bus commonly used on Linux for inter-process communication.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-pyo3-macros-backend-0.13
  (package
    (name "rust-pyo3-macros-backend")
    (version "0.13.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pyo3-macros-backend" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0rjxayd78l10hnyphk03bcvhm0jpsvnzn07lczhy7jsgv3jrgc47"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-1)
        ("rust-quote" ,rust-quote-1)
        ("rust-syn" ,rust-syn-1))))
    (home-page "https://github.com/pyo3/pyo3")
    (synopsis "Code generation for PyO3 package")
    (description "Code generation for PyO3 package")
    (license license:asl2.0)))

(define-public rust-pyo3-macros-0.13
  (package
    (name "rust-pyo3-macros")
    (version "0.13.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pyo3-macros" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1fxi5lx5dl7xh469gr5xckyjy3r3c5dqypzxcj0fbhzf1hq2qzx4"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-pyo3-macros-backend" ,rust-pyo3-macros-backend-0.13)
        ("rust-quote" ,rust-quote-1)
        ("rust-syn" ,rust-syn-1))))
    (home-page "https://github.com/pyo3/pyo3")
    (synopsis "Proc macros for PyO3 package")
    (description "Proc macros for PyO3 package")
    (license license:asl2.0)))

(define-public rust-inventory-impl-0.1
  (package
    (name "rust-inventory-impl")
    (version "0.1.10")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "inventory-impl" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0lgs8kia3284s34g7078j820cn2viyb6cij86swklwhn93lr9h3m"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-1)
        ("rust-quote" ,rust-quote-1)
        ("rust-syn" ,rust-syn-1))))
    (home-page "https://github.com/dtolnay/inventory")
    (synopsis "Implementation of macros for the `inventory` crate")
    (description "Implementation of macros for the `inventory` crate")
    (license (list license:expat license:asl2.0))))

(define-public rust-ghost-0.1
  (package
    (name "rust-ghost")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ghost" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0yalg3g1g3cz63n3phy7cdhh7p2qd220mrpxy96alwxbpqdwynqs"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-1)
        ("rust-quote" ,rust-quote-1)
        ("rust-syn" ,rust-syn-1))))
    (home-page "https://github.com/dtolnay/ghost")
    (synopsis "Define your own PhantomData")
    (description "Define your own PhantomData")
    (license (list license:expat license:asl2.0))))

(define-public rust-inventory-0.1
  (package
    (name "rust-inventory")
    (version "0.1.10")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "inventory" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0zzz5sgrkxv1rpim4ihaidzf6jgha919xm4svcrmxjafh3xpw3qg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-ctor" ,rust-ctor-0.1)
        ("rust-ghost" ,rust-ghost-0.1)
        ("rust-inventory-impl" ,rust-inventory-impl-0.1))))
    (home-page "https://github.com/dtolnay/inventory")
    (synopsis "Typed distributed plugin registration")
    (description "Typed distributed plugin registration")
    (license (list license:expat license:asl2.0))))

(define-public rust-indoc-impl-0.3
  (package
    (name "rust-indoc-impl")
    (version "0.3.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "indoc-impl" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1w58yg249kmzsn75kcj34qaxqh839l1hsaj3bzggy3q03wb6s16f"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-proc-macro-hack" ,rust-proc-macro-hack-0.5)
        ("rust-proc-macro2" ,rust-proc-macro2-1)
        ("rust-quote" ,rust-quote-1)
        ("rust-syn" ,rust-syn-1)
        ("rust-unindent" ,rust-unindent-0.1))))
    (home-page "https://github.com/dtolnay/indoc")
    (synopsis "Indented document literals")
    (description "Indented document literals")
    (license (list license:expat license:asl2.0))))

(define-public rust-indoc-0.3
  (package
    (name "rust-indoc")
    (version "0.3.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "indoc" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1n2fd2wm1h005hd7pjgx4gv5ymyq4sxqn8z0ssw6xchgqs5ilx27"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-indoc-impl" ,rust-indoc-impl-0.3)
        ("rust-proc-macro-hack" ,rust-proc-macro-hack-0.5))))
    (home-page "https://github.com/dtolnay/indoc")
    (synopsis "Indented document literals")
    (description "Indented document literals")
    (license (list license:expat license:asl2.0))))

(define-public rust-pyo3-0.13
  (package
    (name "rust-pyo3")
    (version "0.13.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pyo3" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1hq965lgi25dn578fpn9hjva6zjr1c8rl7lxywijq44aw7lbhds8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-cfg-if" ,rust-cfg-if-1)
        ("rust-ctor" ,rust-ctor-0.1)
        ("rust-hashbrown" ,rust-hashbrown-0.9)
        ("rust-indoc" ,rust-indoc-0.3)
        ("rust-inventory" ,rust-inventory-0.1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-num-bigint" ,rust-num-bigint-0.3)
        ("rust-num-complex" ,rust-num-complex-0.3)
        ("rust-parking-lot" ,rust-parking-lot-0.11)
        ("rust-paste" ,rust-paste-0.1)
        ("rust-pyo3-macros" ,rust-pyo3-macros-0.13)
        ("rust-serde" ,rust-serde-1)
        ("rust-unindent" ,rust-unindent-0.1))))
    (home-page "https://github.com/pyo3/pyo3")
    (synopsis "Bindings to Python interpreter")
    (description "Bindings to Python interpreter")
    (license license:asl2.0)))

(define-public rust-indenter-0.3
  (package
    (name "rust-indenter")
    (version "0.3.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "indenter" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "10y6i6y4ls7xsfsc1r3p5j2hhbxhaqnk5zzk8aj52b14v05ba8yf"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/yaahc/indenter")
    (synopsis
     "A formatter wrapper that indents the text, designed for error display impls
")
    (description
     "This package provides a formatter wrapper that indents the text, designed for error display impls
")
    (license (list license:expat license:asl2.0))))

(define-public rust-eyre-0.6
  (package
    (name "rust-eyre")
    (version "0.6.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "eyre" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0awxjsn1bwa43kwv1ycgn1qy9zs66syddjcidxfvz1pasp8kj4i2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-indenter" ,rust-indenter-0.3)
        ("rust-once-cell" ,rust-once-cell-1)
        ("rust-pyo3" ,rust-pyo3-0.13))))
    (home-page "https://github.com/yaahc/eyre")
    (synopsis
     "Flexible concrete Error Reporting type built on std::error::Error with customizable Reports")
    (description
     "Flexible concrete Error Reporting type built on std::error::Error with customizable Reports")
    (license (list license:expat license:asl2.0))))

(define-public rust-tracing-error-0.1
  (package
    (name "rust-tracing-error")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tracing-error" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "092y3357af6058mdw7nmr7sysqdka8b4cyaqz940fl2a7nwc1mxl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-tracing" ,rust-tracing-0.1)
        ("rust-tracing-subscriber" ,rust-tracing-subscriber-0.2))))
    (home-page "https://tokio.rs")
    (synopsis "Utilities for enriching errors with `tracing`.
")
    (description "Utilities for enriching errors with `tracing`.
")
    (license license:expat)))

(define-public rust-owo-colors-1
  (package
    (name "rust-owo-colors")
    (version "1.4.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "owo-colors" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0rybl2lvhaycpkpaq45099idp5ny7nv4sqsafz0cvfqw1wjfy9vz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t #:cargo-inputs (("rust-atty" ,rust-atty-0.2))))
    (home-page "https://github.com/jam1garner/owo-colors")
    (synopsis "Zero-allocation terminal colors that'll make people go owo")
    (description "Zero-allocation terminal colors that'll make people go owo")
    (license license:expat)))

(define-public rust-color-spantrace-0.1
  (package
    (name "rust-color-spantrace")
    (version "0.1.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "color-spantrace" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1lb2li71zvpxp80nck98gcqbqm3dnmp43pnlvm52z9x8livy9vmn"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-once-cell" ,rust-once-cell-1)
        ("rust-owo-colors" ,rust-owo-colors-1)
        ("rust-tracing-core" ,rust-tracing-core-0.1)
        ("rust-tracing-error" ,rust-tracing-error-0.1))))
    (home-page "https://github.com/yaahc/color-spantrace")
    (synopsis
     "A pretty printer for tracing_error::SpanTrace based on color-backtrace")
    (description
     "This package provides a pretty printer for tracing_error::SpanTrace based on color-backtrace")
    (license (list license:expat license:asl2.0))))

(define-public rust-color-eyre-0.5
  (package
    (name "rust-color-eyre")
    (version "0.5.11")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "color-eyre" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1dspj58bk57f9hiqlvbz25rik92i4a95iwa2dl4pg8g8grlqa60z"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-backtrace" ,rust-backtrace-0.3)
        ("rust-color-spantrace" ,rust-color-spantrace-0.1)
        ("rust-eyre" ,rust-eyre-0.6)
        ("rust-indenter" ,rust-indenter-0.3)
        ("rust-once-cell" ,rust-once-cell-1)
        ("rust-owo-colors" ,rust-owo-colors-1)
        ("rust-tracing-error" ,rust-tracing-error-0.1)
        ("rust-url" ,rust-url-2))))
    (home-page "https://github.com/yaahc/color-eyre")
    (synopsis
     "An error report handler for panics and eyre::Reports for colorful, consistent, and well formatted error reports for all kinds of errors.")
    (description
     "An error report handler for panics and eyre::Reports for colorful, consistent, and well formatted error reports for all kinds of errors.")
    (license (list license:expat license:asl2.0))))

(define-public rust-alsa-sys-0.1
  (package
    (name "rust-alsa-sys")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "alsa-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0n3xr2msblmqlsx313b2y2v9hamqh0hp43v23fp1b3znkszwpvdh"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ("rust-pkg-config" ,rust-pkg-config-0.3))))
    (home-page "https://github.com/diwic/alsa-sys")
    (synopsis
     "FFI bindings for the ALSA project (Advanced Linux Sound Architecture)")
    (description
     "FFI bindings for the ALSA project (Advanced Linux Sound Architecture)")
    (license license:expat)))

(define-public rust-alsa-0.3
  (package
    (name "rust-alsa")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "alsa" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0ljwyg1ckyglkjf3axhpfs4hspw2pxzr4qcis6w7r7c7ni75wspy"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-alsa-sys" ,rust-alsa-sys-0.1)
        ("rust-bitflags" ,rust-bitflags-0.9)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-nix" ,rust-nix-0.14))))
    (home-page "https://github.com/diwic/alsa-rs")
    (synopsis "Thin but safe wrappers for ALSA (Linux sound API)")
    (description "Thin but safe wrappers for ALSA (Linux sound API)")
    (license (list license:asl2.0 license:expat))))
