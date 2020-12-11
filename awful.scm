(import (chicken base)
        (chicken format)
        (chicken port)
        (chicken process))
(import awful server-test)

(include "lib/bench-utils.scm")

(define ab-time)

(with-test-server
 (lambda ()
   (awful-start
    (lambda ()
      (define-page "/"
        (lambda ()
          '(h1 "Hello"))))))
 (lambda ()
   (set! ab-time
         (with-output-to-string
           (lambda ()
             (fake-time (system* "ab -n 20000 http://127.0.0.1:8080/")))))))

(print ab-time)
