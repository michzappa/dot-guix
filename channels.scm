(list (channel
        (name 'mz-guix)
        (url "file:///home/michael/.config/guix")
        (branch "master")
        (commit
          "3b55a9ee48eea4b4acf1fc7bd26b1b4a3b8eec64"))
      (channel
        (name 'flat)
        (url "https://github.com/flatwhatson/guix-channel.git")
        (branch "master")
        (commit
          "cf23f523afc611c2b35debf015d219c6f918337f"))
      (channel
        (name 'nonguix)
        (url "https://gitlab.com/nonguix/nonguix")
        (branch "master")
        (commit
          "393b8e0405f44835c498d7735a8ae9ff4682b07f"))
      (channel
        (name 'guix)
        (url "https://git.savannah.gnu.org/git/guix.git")
        (branch "master")
        (commit
          "01ec5efff7cf95cae69493bd4ccfdd21a38770ae")
        (introduction
          (make-channel-introduction
            "9edb3f66fd807b096b48283debdcddccfea34bad"
            (openpgp-fingerprint
              "BBB0 2DDF 2CEA F6A8 0D1D  E643 A2A0 6DF2 A33A 54FA")))))
