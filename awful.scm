(import (chicken base)
        (chicken format)
        (chicken port)
        (chicken process))
(import awful server-test)

(include "lib/bench-utils.scm")

(define ab-time)

(test-server-port network-port)

(with-test-server
 (lambda ()
   (awful-start
    (lambda ()
      (define-page "/"
        (lambda ()
          '(h1 "Hello"))))
    port: network-port))
 (lambda ()
   (set! ab-time
         (with-output-to-string
           (lambda ()
             (fake-time
              (system* (sprintf "ab -n 20000 http://127.0.0.1:~a/"
                                network-port))))))))

(print ab-time)
