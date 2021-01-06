(import (chicken base)
        (chicken format)
        (chicken process))

(include "lib/bench-utils.scm")

(system* "rm -rf data/chicken-core/manual-html")

(fake-time
 (system*
  (sprintf "PATH=~a:$PATH make -C data/chicken-core html"
           (prefix))))
