(import (chicken base)
        (chicken process))

(include "lib/bench-utils.scm")

(system* "rm -rf data/chicken-core/manual-html")

(fake-time (system* "make -C data/chicken-core html"))
