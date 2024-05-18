(define-module (mz system keyboard)
  #:use-module (gnu system keyboard))

(define-public ctrl-no-caps-keyboard
  (keyboard-layout "us" #:options '("ctrl:nocaps")))
