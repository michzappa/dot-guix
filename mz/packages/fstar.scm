(define-module (mz packages fstar)
 #:use-module ((guix licenses) #:prefix license:)
 #:use-module (gnu packages base)
 #:use-module (gnu packages commencement)
 #:use-module (gnu packages maths)
 #:use-module (gnu packages multiprecision)
 #:use-module (gnu packages ocaml)
 #:use-module (guix build-system dune)
 #:use-module (guix build-system gnu)
 #:use-module (guix build-system ocaml)
 #:use-module (guix gexp)
 #:use-module (guix git-download)
 #:use-module (guix packages)
 #:export (fstar karamel))

(define-public ocaml-memtrace
  (package
   (name "ocaml-memtrace")
   (home-page "https://github.com/janestreet/memtrace")
   (version "0.2.3")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url home-page)
           (commit (string-append "v" version))))
     (sha256
      (base32 "1ny0vfvfxzrvd0csazzwi6iprz4rgkmh5fqmxhrxb00rvyn16sbm"))))
   (build-system dune-build-system)
   (synopsis "Generates compact traces of a program's memory use.")
   (description #f)
   (license license:expat)))

(define-public ocaml-process
  (package
   (name "ocaml-process")
   (home-page "https://github.com/dsheets/ocaml-process")
   (version "0.2.1")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url home-page)
           (commit version)))
     (sha256
      (base32 "0m1ldah5r9gcq09d9jh8lhvr77910dygx5m309k1jm60ah9mdcab"))))
   (build-system ocaml-build-system)
   (arguments
    (list
     #:phases #~(modify-phases %standard-phases (delete 'configure))))
   (native-inputs (list ocamlbuild ocaml-alcotest))
   (synopsis "Easy process control in OCaml.")
   (description #f)
   (license license:isc)))

(define-public ocaml-stdint
  (package
   (name "ocaml-stdint")
   (home-page "https://github.com/andrenth/ocaml-stdint")
   (version "0.7.2")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url home-page)
           (commit version)))
     (sha256
      (base32 "0c5l1pbwcvj0ak7fc6adp5jgh83p4bc9qgx4rfnzyc24dn8gllrf"))))
   (build-system dune-build-system)
   (arguments
    (list
     #:phases #~(modify-phases %standard-phases (delete 'check))))
   (native-inputs (list ocaml-odoc ocaml-qcheck))
   (synopsis "Signed and unsigned integer types having specified widths")
   (description #f)
   (license license:expat)))

(define-public ocaml-visitors
  (package
   (name "ocaml-visitors")
   (home-page "https://gitlab.inria.fr/fpottier/visitors")
   (version "20210608")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url home-page)
           (commit version)))
     (sha256
      (base32 "1p75x5yqwbwv8yb2gz15rfl3znipy59r45d1f4vcjdghhjws6q2a"))))
   (build-system dune-build-system)
   (native-inputs (list ocaml-ppxlib ocaml-ppx-deriving ocaml-result))
   (synopsis "An OCaml syntax extension for generating visitor classes")
   (description #f)
   (license license:lgpl2.1)))

(define-public ocaml-wasm
  (package
   (name "ocaml-wasm")
   (home-page "https://github.com/WebAssembly/spec")
   (version "2.0.1")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url home-page)
           (commit (string-append "opam-" version))))
     (sha256
      (base32 "1nyfpylky6pi4c9nna5r31zrkccl1lynpzcm9d8nrn52icq3rsp5"))))
   (build-system ocaml-build-system)
   (arguments
    (list
     #:phases #~(modify-phases %standard-phases
                               (add-after 'unpack 'enter-ocaml-dir
                                          (lambda _ (chdir "interpreter")))
                               (delete 'configure)
                               (delete 'check))))
   (native-inputs (list ocaml-findlib ocamlbuild))
   (synopsis
    "Library to read and write WebAssembly (Wasm) files and manipulate their AST.")
   (description #f)
   (license license:asl2.0)))

(define-public z3-4.8.5
  (package
   (inherit z3)
   (name "z3")
   (version "4.8.5")
   (home-page "https://github.com/Z3Prover/z3")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url home-page)
           (commit (string-append "Z3-" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "11sy98clv7ln0a5vqxzvh6wwqbswsjbik2084hav5kfws4xvklfa"))))))

(define-public fstar
  (package
   (name "fstar")
   (home-page "https://github.com/FStarLang/FStar")
   (version "60844c6deb4501d4808908a434f113a7800a722f")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url home-page)
           (commit version)))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0fxlx6picid3g8jkfsvw554izdacavarj2jidakarvfnw3aaj87q"))))
   (build-system gnu-build-system)
   (arguments
    (list
     #:parallel-build? #t
     #:make-flags #~(list (string-append "PREFIX=" #$output))
     #:phases #~(modify-phases %standard-phases
                               (delete 'configure)
                               (delete 'check))))
   (native-inputs
    (list ocaml
          dune
          gmp
          ocaml-batteries
          ocaml-memtrace
          ocaml-menhir
          ocaml-pprint
          ocaml-ppx-deriving
          ocaml-ppx-deriving-yojson
          ocaml-ppxlib
          ocaml-process
          ocaml-sedlex
          ocaml-stdint
          ocaml-yojson
          ocaml-zarith))
   (propagated-inputs
    (list z3-4.8.5))
   (synopsis "A Proof-oriented Programming Language.")
   (description #f)
   (license license:asl2.0)))

(define-public karamel
  (package
   (name "karamel")
   (home-page "https://github.com/FStarLang/karamel")
   (version "5dac5b6ef91c63c61d1ebe08071b32fae7e01d06")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url home-page)
           (commit version)))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "081l6bin6dllszwz4kj6ing6r5sbvf6w28y75mam9qj2ac0zxwi7"))))
   (build-system gnu-build-system)
   (arguments
    (list
     #:parallel-build? #t
     #:make-flags #~(list (string-append "PREFIX=" #$output)
                          "CC=gcc")
     #:phases #~(modify-phases %standard-phases
                               (delete 'configure)
                               (delete 'check))))
   (native-inputs
    (list ocaml
          dune
          gcc-toolchain
          gmp
          which
          ocaml-findlib
          ocaml-ctypes
          ocaml-fix
          ocaml-menhir
          ocaml-pprint
          ocaml-ppx-deriving-yojson
          ocaml-process
          ocaml-sedlex
          ocaml-uucp
          ocaml-visitors
          ocaml-wasm
          ocaml-zarith))
   (propagated-inputs
    (list fstar))
   (synopsis "KaRaMeL is a tool for extracting low-level F* programs to readable C code ")
   (description #f)
   (license license:asl2.0)))
