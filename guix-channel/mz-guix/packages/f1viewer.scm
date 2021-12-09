(define-module (mz-guix packages f1viewer)
  #:use-module (gnu packages golang)
  #:use-module (guix build-system go)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages))

(define-public go-github-com-gdamore-tcell-v2
  (package
    (name "go-github-com-gdamore-tcell-v2")
    (version "2.4.0")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/gdamore/tcell")
               (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "0kxpd2njknlp4a3wh7xs1pdk5h4y7ppi39z3vypg5m0fp9rfr0fk"))))
    (build-system go-build-system)
    (arguments '(#:import-path "github.com/gdamore/tcell/v2"))
    (propagated-inputs
      `(("go-golang-org-x-text" ,go-golang-org-x-text)
        ("go-golang-org-x-term" ,go-golang-org-x-term)
        ("go-golang-org-x-sys" ,go-golang-org-x-sys)
        ("go-github-com-mattn-go-runewidth" ,go-github-com-mattn-go-runewidth)
        ("go-github-com-lucasb-eyer-go-colorful"
         ,go-github-com-lucasb-eyer-go-colorful)
        ("go-github-com-gdamore-encoding" ,go-github-com-gdamore-encoding)))
    (home-page "https://github.com/gdamore/tcell")
    (synopsis #f)
    (description
      "Package tcell provides a lower-level, portable API for building programs that
interact with terminals or consoles.  It works with both common (and many
uncommon!) terminals or terminal emulators, and Windows console
implementations.")
    (license license:asl2.0)))

(define-public go-github-com-lucasb-eyer-go-colorful
  (package
    (name "go-github-com-lucasb-eyer-go-colorful")
    (version "1.2.0")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/lucasb-eyer/go-colorful")
               (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "08c3fkf27r16izjjd4w94xd1z7w1r4mdalbl53ms2ka2j465s3qs"))))
    (build-system go-build-system)
    (arguments '(#:import-path "github.com/lucasb-eyer/go-colorful"))
    (home-page "https://github.com/lucasb-eyer/go-colorful")
    (synopsis "go-colorful")
    (description
      "The colorful package provides all kinds of functions for working with colors.")
    (license license:expat)))

(define-public go-github-com-mattn-go-runewidth
  (package
    (name "go-github-com-mattn-go-runewidth")
    (version "0.0.13")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/mattn/go-runewidth")
               (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "1yir0f3wc5z5hnkwhvx5qb6nmpfb05zp2gvfjvna63s8kmla1rrn"))))
    (build-system go-build-system)
    (arguments '(#:import-path "github.com/mattn/go-runewidth"))
    (propagated-inputs
      `(("go-github-com-rivo-uniseg" ,go-github-com-rivo-uniseg)))
    (home-page "https://github.com/mattn/go-runewidth")
    (synopsis "go-runewidth")
    (description "This package provides functions to get fixed width of the character or string.")
    (license license:expat)))

(define-public go-github-com-rivo-uniseg
  (package
    (name "go-github-com-rivo-uniseg")
    (version "0.2.0")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/rivo/uniseg")
               (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "0j7h22vfmjj562vr8gpsyrkrwp1pq9ayh5fylv24skxb467g9f0q"))))
    (build-system go-build-system)
    (arguments '(#:import-path "github.com/rivo/uniseg"))
    (home-page "https://github.com/rivo/uniseg")
    (synopsis "Unicode Text Segmentation for Go")
    (description
      "Package uniseg implements Unicode Text Segmentation according to Unicode
Standard Annex #29 (@url{http://unicode.org/reports/tr29/,http://unicode.org/reports/tr29/}).")
    (license license:expat)))

(define-public go-github-com-rivo-tview
  (package
    (name "go-github-com-rivo-tview")
    (version "0.0.0-20211109175620-badfa0f0b301")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/rivo/tview")
               (commit (go-version->git-ref version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "0l2rnnr5a8g5yy88g4p2xanmxsqvchb2s9r517h8nh4a5ijb07fa"))))
    (build-system go-build-system)
    (arguments '(#:import-path "github.com/rivo/tview"))
    (propagated-inputs
      `(("go-golang-org-x-term" ,go-golang-org-x-term)
        ("go-golang-org-x-sys" ,go-golang-org-x-sys)
        ("go-github-com-rivo-uniseg" ,go-github-com-rivo-uniseg)
        ("go-github-com-mattn-go-runewidth" ,go-github-com-mattn-go-runewidth)
        ("go-github-com-lucasb-eyer-go-colorful"
         ,go-github-com-lucasb-eyer-go-colorful)
        ("go-github-com-gdamore-tcell-v2" ,go-github-com-gdamore-tcell-v2)))
    (home-page "https://github.com/rivo/tview")
    (synopsis "Rich Interactive Widgets for Terminal UIs")
    (description
      "Package tview implements rich widgets for terminal based user interfaces.  The
widgets provided with this package are useful for data exploration and data
entry.")
    (license license:expat)))

(define-public go-github-com-atotto-clipboard
  (package
    (name "go-github-com-atotto-clipboard")
    (version "0.1.4")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/atotto/clipboard")
               (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "0ycd8zkgsq9iil9svhlwvhcqwcd7vik73nf8rnyfnn10gpjx97k5"))))
    (build-system go-build-system)
    (arguments '(#:import-path "github.com/atotto/clipboard"
                 #:tests? #f)) ;; tests require a clipboard utility
    (home-page "https://github.com/atotto/clipboard")
    (synopsis "Clipboard for Go")
    (description "Package clipboard read/write on clipboard")
    (license license:bsd-3)))

(define-public go-github-com-lucasb-eyer-go-colorful
  (package
    (name "go-github-com-lucasb-eyer-go-colorful")
    (version "1.2.0")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/lucasb-eyer/go-colorful")
               (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "08c3fkf27r16izjjd4w94xd1z7w1r4mdalbl53ms2ka2j465s3qs"))))
    (build-system go-build-system)
    (arguments '(#:import-path "github.com/lucasb-eyer/go-colorful"))
    (home-page "https://github.com/lucasb-eyer/go-colorful")
    (synopsis "go-colorful")
    (description
      "The colorful package provides all kinds of functions for working with colors.")
    (license license:expat)))

(define-public go-github-com-gdamore-tcell-v2
  (package
    (name "go-github-com-gdamore-tcell-v2")
    (version "2.4.0")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/gdamore/tcell")
               (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "0kxpd2njknlp4a3wh7xs1pdk5h4y7ppi39z3vypg5m0fp9rfr0fk"))))
    (build-system go-build-system)
    (arguments '(#:import-path "github.com/gdamore/tcell/v2"))
    (propagated-inputs
      `(("go-golang-org-x-text" ,go-golang-org-x-text)
        ("go-golang-org-x-term" ,go-golang-org-x-term)
        ("go-golang-org-x-sys" ,go-golang-org-x-sys)
        ("go-github-com-mattn-go-runewidth" ,go-github-com-mattn-go-runewidth)
        ("go-github-com-lucasb-eyer-go-colorful"
         ,go-github-com-lucasb-eyer-go-colorful)
        ("go-github-com-gdamore-encoding" ,go-github-com-gdamore-encoding)))
    (home-page "https://github.com/gdamore/tcell")
    (synopsis #f)
    (description
      "Package tcell provides a lower-level, portable API for building
programs that interact with terminals or consoles.  It works with
both common (and many uncommon!) terminals or terminal emulators,
and Windows console implementations.")
    (license license:asl2.0)))

(define-public go-github-com-rivo-uniseg
  (package
    (name "go-github-com-rivo-uniseg")
    (version "0.2.0")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/rivo/uniseg")
               (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "0j7h22vfmjj562vr8gpsyrkrwp1pq9ayh5fylv24skxb467g9f0q"))))
    (build-system go-build-system)
    (arguments '(#:import-path "github.com/rivo/uniseg"))
    (home-page "https://github.com/rivo/uniseg")
    (synopsis "Unicode Text Segmentation for Go")
    (description
      "Package uniseg implements Unicode Text Segmentation according to Unicode
Standard Annex #29 (@url{http://unicode.org/reports/tr29/,http://unicode.org/reports/tr29/}).")
    (license license:expat)))

(define-public go-github-com-mattn-go-runewidth
  (package
    (name "go-github-com-mattn-go-runewidth")
    (version "0.0.13")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/mattn/go-runewidth")
               (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "1yir0f3wc5z5hnkwhvx5qb6nmpfb05zp2gvfjvna63s8kmla1rrn"))))
    (build-system go-build-system)
    (arguments '(#:import-path "github.com/mattn/go-runewidth"))
    (propagated-inputs
      `(("go-github-com-rivo-uniseg" ,go-github-com-rivo-uniseg)))
    (home-page "https://github.com/mattn/go-runewidth")
    (synopsis "go-runewidth")
    (description "This package provides functions to get fixed width of the character or string.")
    (license license:expat)))

(define-public f1viewer
  (package
    (name "f1viewer")
    (version "2.4.0")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/SoMuchForSubtlety/f1viewer")
               (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "1pkznhzcssxbiskgdyrrk3d3wxvhrlxrii2fknyxz5zqdr8d3rgd"))))
    (build-system go-build-system)
    (arguments '(#:import-path "github.com/SoMuchForSubtlety/f1viewer/v2"
                 #:install-source? #f
                 ))
    (propagated-inputs
      `(("go-github-com-rivo-tview" ,go-github-com-rivo-tview)
        ("go-gopkg-in-check-v1" ,go-gopkg-in-check-v1)
        ("go-golang-org-x-text" ,go-golang-org-x-text)
        ("go-golang-org-x-sys" ,go-golang-org-x-sys)
        ("go-github-com-godbus-dbus" ,go-github-com-godbus-dbus)
        ("go-github-com-zalando-go-keyring" ,go-github-com-zalando-go-keyring)
        ("go-github-com-stretchr-testify" ,go-github-com-stretchr-testify)
        ("go-github-com-mattn-go-runewidth" ,go-github-com-mattn-go-runewidth)
        ("go-github-com-gdamore-tcell-v2" ,go-github-com-gdamore-tcell-v2)
        ("go-github-com-atotto-clipboard" ,go-github-com-atotto-clipboard)))
    (home-page "https://github.com/SoMuchForSubtlety/f1viewer")
    (synopsis "f1viewer")
    (description "TUI for F1TV")
    (license license:gpl3)))
