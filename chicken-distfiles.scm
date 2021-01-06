(import (chicken base)
        (chicken format)
        (chicken process))

(include "lib/bench-utils.scm")

(system* "make -C data/chicken-core spotless")

(fake-time
 (system*
  (sprintf "PATH=~a:$PATH make -C data/chicken-core distfiles"
           (prefix))))
