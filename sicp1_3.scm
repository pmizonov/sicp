(define (square x) (* x x))

(define (square-plus-max x y z)
  (if (= y (if (> y z) y z))
      (+ (square x) (square y))
      (+ (square x) (square z))))

(define (two-max-squares x y z)
  (square-plus-max (if (> x y) x y) (if (< x y) x y) z))

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