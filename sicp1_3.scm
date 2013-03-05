(define (square x) (* x x))

(define (square-plus-max x y z)
  (if (= y (max y z))
      (+ (square x) (square y))
      (+ (square x) (square z))
  )
)

(define (two-max-squares x y z)
  (square-plus-max (max x y) (min x y) z)
)

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