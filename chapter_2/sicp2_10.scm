#lang scheme
(define (make-interval a b) 
  (if (> a b) (display "lower bound is higher than upper bound\n")
  (cons a b)))

(define (lower-bound interval) 
  (car interval))

(define (upper-bound interval) 
  (cdr interval))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (if (and (>= (upper-bound y) 0) (<= (lower-bound y) 0)) (display "Division to interval with zero\n")
  (mul-interval x
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y))))))

(define a (make-interval 1 1))
(define b (make-interval 0 20))
(define c (make-interval -10 10))
(define d (make-interval -20 0))

(div-interval a b)
(div-interval a d)
(div-interval a c)

; Если делить на интервал пересекающий ноль, то (make-interval (/ 1.0 (upper-bound y)) (/ 1.0 (lower-bound y))) вернет 
; некорректный интервал у котороо верхняя граница меньше нижней.
