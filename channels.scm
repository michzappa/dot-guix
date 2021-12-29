(list (channel
        (name 'guix)
        (url "https://git.savannah.gnu.org/git/guix.git")
        (branch "master")
        (commit
          "a39e64bc225daacecbdb51c4681357b6eefd005a")
        (introduction
          (make-channel-introduction
            "9edb3f66fd807b096b48283debdcddccfea34bad"
            (openpgp-fingerprint
              "BBB0 2DDF 2CEA F6A8 0D1D  E643 A2A0 6DF2 A33A 54FA"))))
      (channel
        (name 'nonguix)
        (url "https://gitlab.com/nonguix/nonguix")
        (branch "master")
        (commit
          "39e4b41e5f7277b8d58084cd7aff8edde71f6572"))
      (channel
        (name 'flat)
        (url "https://github.com/flatwhatson/guix-channel.git")
        (branch "master")
        (commit
          "cf23f523afc611c2b35debf015d219c6f918337f"))
      (channel
        (name 'mz-guix)
        (url "file:///home/michael/.config/guix")
        (branch "master")))
