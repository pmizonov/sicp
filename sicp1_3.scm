(define (square x) (* x x))
(define (sum-two-square x y) (+ (square x) (square y)))

(define (two-max-squares x y z)
  (cond ((and (<= x y) (<= x z)) (sum-two-square y z))
        ((and (<= y x) (<= y z)) (sum-two-square x z))
        (else (sum-two-square x y))))
  
;;tests

(two-max-squares 3 5 4)
(two-max-squares 3 4 5)
(two-max-squares 4 5 3)
(two-max-squares 5 4 3)
(two-max-squares 5 3 4)
(two-max-squares 4 3 5)

(two-max-squares 4 4 5)
(two-max-squares 4 5 4)
(two-max-squares 5 4 4)

(two-max-squares 4 4 4)