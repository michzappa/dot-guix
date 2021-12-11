(list (channel
        (name 'guix)
        (url "https://git.savannah.gnu.org/git/guix.git")
        (commit
          "13bc332ed597ca44c746ddc821910037107ceade")
        (introduction
          (make-channel-introduction
            "9edb3f66fd807b096b48283debdcddccfea34bad"
            (openpgp-fingerprint
              "BBB0 2DDF 2CEA F6A8 0D1D  E643 A2A0 6DF2 A33A 54FA"))))
      (channel
        (name 'nonguix)
        (url "https://gitlab.com/nonguix/nonguix")
        (commit
          "5b1184a103640186fd22e1c53ba64a83f7e6fc3d"))
      (channel
        (name 'flat)
        (url "https://github.com/flatwhatson/guix-channel.git")
        (commit
          "565cc48edc6c547833aa64df7eca6dc04ceb55cb"))
      (channel
        (name 'mz-guix)
        (url "https://github.com/michzappa/guix.git")
        (commit
          "68051e1c75a6160eabd2f850a206a5fc39a0ae2b")))
