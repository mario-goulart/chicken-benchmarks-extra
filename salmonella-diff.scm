(import (chicken base)
        (chicken format)
        (chicken process))

(include "lib/bench-utils.scm")

(system* "rm -rf dumpster/salmonella-diff")

(fake-time
 (system*
  (sprintf
   "~a --out-dir=dumpster/salmonella-diff data/salmonella/salmonella-1.log data/salmonella/salmonella-2.log"
   (maybe-prefix "salmonella-diff"))))
