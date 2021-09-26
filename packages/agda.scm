(use-modules
 (guix packages)
 (guix download)
 (guix build-system emacs)
 (gnu packages haskell-check)
 (gnu packages haskell-web)
 (gnu packages haskell-xyz)
 (gnu packages agda))

(define ghc-regex-base-0.94.0.1
  (package
   (inherit ghc-regex-base)
   (version "0.94.0.1")
   (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/regex-base/regex-base-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "1ngdmmrxs1rhvib052c6shfa40yad82jylylikz327r0zxpxkcbi"))))))

(define ghc-regex-tdfa-1.3.1.0
  (package
   (inherit ghc-regex-tdfa)
   (version "1.3.1.0")
   (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/regex-tdfa/regex-tdfa-"
             version ".tar.gz"))
       (sha256
        (base32
         "1h1fliv2zjxwmddl9wnn7ckxxpgy1049hdfg6fcknyrr7mw7dhqm"))))
   (inputs
    `(("ghc-regex-base" ,ghc-regex-base-0.94.0.1)
      ("ghc-utf8-string" ,ghc-utf8-string)))))

(define-public agda-2.6.2
  (package
   (inherit agda)
   (version "2.6.2")
   (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/Agda/Agda-"
             version ".tar.gz"))
       (sha256
        (base32
         "159hznnsxg7hlp80r1wqizyd7gwgnq0j13cm4d27cns0ganslb07"))))
   (inputs
     `(("ghc-aeson" ,ghc-aeson)
       ("ghc-alex" ,ghc-alex)
       ("ghc-async" ,ghc-async)
       ("ghc-blaze-html" ,ghc-blaze-html)
       ("ghc-boxes" ,ghc-boxes)
       ("ghc-case-insensitive" ,ghc-case-insensitive)
       ("ghc-data-hash" ,ghc-data-hash)
       ("ghc-edisoncore" ,ghc-edisoncore)
       ("ghc-edit-distance" ,ghc-edit-distance)
       ("ghc-equivalence" ,ghc-equivalence)
       ("ghc-exceptions" ,ghc-exceptions)
       ("ghc-filemanip" ,ghc-filemanip)
       ("ghc-geniplate-mirror" ,ghc-geniplate-mirror)
       ("ghc-gitrev" ,ghc-gitrev)
       ("ghc-happy" ,ghc-happy)
       ("ghc-hashable" ,ghc-hashable)
       ("ghc-hashtables" ,ghc-hashtables)
       ("ghc-ieee754" ,ghc-ieee754)
       ("ghc-monad-control" ,ghc-monad-control)
       ("ghc-murmur-hash" ,ghc-murmur-hash)
       ("ghc-parallel" ,ghc-parallel)
       ("ghc-regex-tdfa" ,ghc-regex-tdfa-1.3.1.0)
       ("ghc-strict" ,ghc-strict)
       ("ghc-unordered-containers" ,ghc-unordered-containers)
       ("ghc-uri-encode" ,ghc-uri-encode)
       ("ghc-zlib" ,ghc-zlib)))))

;; unfortunately cannot inherit from `emacs-agda2-mode' directly since it inherits from `agda', so just mimic the definition with `agda-2.6.2'
(define-public emacs-agda2-mode-2.6.2
  (package
   (inherit agda-2.6.2)
   (name "emacs-agda2-mode")
   (build-system emacs-build-system)
   (inputs '())
   (arguments
    `(#:phases
      (modify-phases %standard-phases
                     (add-after 'unpack 'enter-elisp-dir
                                (lambda _ (chdir "src/data/emacs-mode"))))))))
