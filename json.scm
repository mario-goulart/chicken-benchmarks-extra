(import (chicken port))
(import medea)

(time (with-input-from-file "data/json/canada.json" read-json))
