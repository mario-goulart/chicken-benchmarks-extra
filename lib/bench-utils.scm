(import (chicken pathname)
        (chicken platform)
        (chicken time))

(define-syntax fake-time
  (syntax-rules ()
    ((_ exp)
     (let ((start-time (current-milliseconds)))
       exp
       (print (/ (- (current-milliseconds) start-time) 1000.0)
              "s CPU time, 0/0 mutations (total/tracked), maximum live heap: 0 KiB")))))

(define (maybe-prefix program)
  (let ((installation-prefix
         (pathname-directory (pathname-directory (chicken-home)))))
    (make-pathname (and installation-prefix
                        (list installation-prefix "bin"))
                   program)))
