#lang scheme
(define (square x) (* x x))

(define (two-max-squares x y z)
  (if (and (<= z y) (<= z x)) (+ (square x) (square y))
        (two-max-squares z x y)))
  
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