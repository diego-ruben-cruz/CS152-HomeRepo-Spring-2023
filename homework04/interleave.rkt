; Function that interleaves two lists together
(define (interleave group1 group2); Function definition, essentially declares that it has 2 params
  (cond ((null? group1) group2); Checks if either list is null to default to using the other list for output
        ((null? group2) group1)
        (else (cons (car group1); Creates a construct of a cell for one group,
                                ; then uses the other group as first param to recursive call
                    (interleave group2 (cdr group1)))))); Successfully achieves alternating nature

(interleave '(1 2 3) '(a b c)); Expected output is '(1 a 2 b 3 c)'
(interleave '(1 2 3) '(a b c d e f)); Expected output is '(1 a 2 b 3 c d e f)'
(interleave '(1 2 3 4 5 6) '(a b c)); Expected output is '(1 a 2 b 3 c 4 5 6)'