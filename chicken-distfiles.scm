(import (chicken base)
        (chicken process))

(include "lib/bench-utils.scm")

(system* "make -C data/chicken-core spotless")

(fake-time (system* "make -C data/chicken-core distfiles"))
