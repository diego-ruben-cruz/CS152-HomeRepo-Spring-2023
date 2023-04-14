; Defines a function which takes a list
(define (flatten listwithlists)
  (cond ((null? listwithlists) '()); Checks that the list is not null
        ((pair? (car listwithlists)); Checks if the sublist has content at addr/decrement
          (append (flatten (car listwithlists)); Recursive call to append contents to master list
                 (flatten (cdr listwithlists)))); and apply flatten to next 'element' in list
        (else (cons (car listwithlists) (flatten (cdr listwithlists)))))); Otherwise handles "empty" sublists

; Defines a function elements which takes a list, which may or may not be nested
; and flattens it to make sure that it is no longer nested. After that, taking the
; length of the list should the total number of elements in the list.
(define (elements group)
  (length (flatten group)))

(elements '(1 (2 (3) 4) 5 6)); Expected return: 6

(length '(1 (2 (3) 4) 5 6)); Expected return: 4