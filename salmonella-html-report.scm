(import (chicken base)
        (chicken format)
        (chicken process))

(include "lib/bench-utils.scm")

(system* "rm -rf dumpster/salmonella-report")

(fake-time
 (system*
  (sprintf
   "~a --disable-graphs data/salmonella/salmonella.log dumpster/salmonella-report"
   (maybe-prefix "salmonella-html-report"))))
