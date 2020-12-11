(import (chicken port))
(import ssax)

(time (call-with-input-file "data/xml/nasa.xml"
        (lambda (port)
          (ssax:xml->sxml port '()))))
