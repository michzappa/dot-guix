(list
 (channel
  (name 'mz-guix)
  ;;  (url "https://github.com/michzappa/guix.git")
  (url "file:///home/michael/.config/guix"))
 (channel
  (name 'flat)
  (url "https://github.com/flatwhatson/guix-channel.git")
  (commit
   "cf23f523afc611c2b35debf015d219c6f918337f"))
 (channel
  (name 'nonguix)
  (url "https://gitlab.com/nonguix/nonguix")
  (commit
   "c80b1b3f1fbae686ca568a98817ed2f548f9dec0"))
 (channel
  (name 'guix)
  (url "https://git.savannah.gnu.org/git/guix.git")
  (commit
   "ba744faeb104a1132d9f6ed04fc296b23bc09334")
  (introduction
   (make-channel-introduction
    "9edb3f66fd807b096b48283debdcddccfea34bad"
    (openpgp-fingerprint
     "BBB0 2DDF 2CEA F6A8 0D1D  E643 A2A0 6DF2 A33A 54FA")))))
