; Function that multiplies two vectors to get the inner product AKA dot product
(define (innerProduct vector1 vector2)
  (map * vector1 vector2)); map is a function in R5RS that allows for items from same-size lists
                          ; to do operations between elements
                          ; Under the assumption that both elements are numbers, it multiplies them together
                          ; as marked with the '*' operator

(innerProduct '(1 2 3) '(4 5 6)); Expected output '(4 10 18)'