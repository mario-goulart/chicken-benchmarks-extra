(import (chicken base)
        (chicken format)
        (chicken process))

(include "lib/bench-utils.scm")

(system* "rm -rf dumpster/salmonella-report")

(fake-time
 (system*
  (sprintf
   "~a --disable-graphs data/salmonella/salmonella-1.log dumpster/salmonella-report"
   (prefix "salmonella-html-report"))))
