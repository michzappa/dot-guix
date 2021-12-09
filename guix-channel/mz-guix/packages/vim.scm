(define-module (mz-guix packages vim)
  #:use-module (gnu packages vim)
  #:use-module (guix build-system gnu)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages))

(define tree-sitter
  (package
    (name "tree-sitter")
    (version "v0.20.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/tree-sitter/tree-sitter")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0hrcisvw44fjxix09lfbrz7majaj6njbnr6c92a6a5748p2jvyng"))))
    (build-system gnu-build-system)
    (arguments
     '(#:phases (modify-phases %standard-phases
                  (delete 'configure)
                  (delete 'check)
                  (add-before 'build 'set-prefix-in-makefile
                    (lambda* (#:key outputs #:allow-other-keys)
                      ;; modify the Makefile so that its 'PREFIX' variable
                      ;; points to 'out', putting things where guix wants them
                      (let ((out (assoc-ref outputs "out")))
                        (substitute* "Makefile"
                          (("PREFIX \\?=.*")
                           (string-append "PREFIX = " out "\n")))
                        #true))))
       #:make-flags '("CC=gcc")))
    (home-page "https://tree-sitter.github.io/")
    (synopsis "Tree-sitter is a parser generator tool and an incremental parsing library.")
    (description "Tree-sitter is a parser generator tool and an incremental parsing library.
It can build a concrete syntax tree for a source file and efficiently update
the syntax tree as the source file is edited.")
    (license license:expat)))

(define-public neovim-0.5.1
  (package
    (inherit neovim)
    (name "neovim")
    (version "0.5.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/neovim/neovim")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1d2s9amy0alh7abn998ixwi6nd7whnpzmixkyqdk76zify0v631x"))))
    (inputs
     (cons `("tree-sitter" ,tree-sitter)
           (package-inputs neovim)))))
