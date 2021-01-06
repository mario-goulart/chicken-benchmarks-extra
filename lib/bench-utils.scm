(import (chicken pathname)
        (chicken platform)
        (chicken process-context)
        (chicken time))

(define-syntax fake-time
  (syntax-rules ()
    ((_ exp)
     (let ((start-time (current-milliseconds)))
       exp
       (print (/ (- (current-milliseconds) start-time) 1000.0)
              "s CPU time, 0/0 mutations (total/tracked), maximum live heap: 0 KiB")))))

(define (prefix #!optional program)
  (let ((installation-prefix
         (pathname-directory (pathname-directory (chicken-home)))))
    (make-pathname (and installation-prefix
                        (list installation-prefix "bin"))
                   program)))

(define network-port
  (or (and-let* ((port (get-environment-variable "CHICKEN_BENCHMARKS_PORT")))
        (string->number port))
      8080))
