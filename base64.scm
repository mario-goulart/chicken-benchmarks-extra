(import (chicken file)
        (chicken port))
(import base64)

(define (encode str)
  (call-with-input-string str
    (lambda (port)
      (base64-encode port))))

(let ((files
       (append
        (glob "data/salmonella/salmonella-*.log")
        (list "data/chicken-core/runtime.c"
              "data/chicken-core/chicken-do.c"
              "data/chicken-core/dbg-stub.c")
        (glob "data/chicken-core/Makefile*")
        (glob "data/chicken-core/*.h")
        (glob "data/chicken-core/*.mdoc")
        (glob "data/chicken-core/*.scm")
        (glob "data/chicken-core/tests/*.scm")
        (glob "data/chicken-core/scripts/*")
        )))
  (time (map (lambda (file)
               (call-with-input-file file
                 (lambda (port)
                   (encode (encode (encode (base64-encode port)))))))
             files)))
