#lang scheme
(define (make-interval a b) (cons a b))

(define (lower-bound interval) 
  (car interval))

(define (upper-bound interval) 
  (cdr interval))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval x
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))

(define (width interval)
  (/ (- (upper-bound interval) (lower-bound interval)) 2.0))

(define a (make-interval 1 2))
(define b (make-interval 10 20))
(define c (make-interval 20 30))

(width a)
(width b)
(width c)

; width([a,b]) + width([c,d]) = (a-b)/2 + (c-d)/2
; width([a,b]+[c,d])=width([a+c, b+d])=((a+c)-(b+d))/2 = (a-b)/2 + (c-d)/2 = width([a,b]) + width([c,d])
; Радиус суммы интервалов равен сумме радиусов каждого из интервала. И является функцией от радиусов аргументов,
; т.е. зависит только от радиусов слагаемых.

(width (add-interval a b))
(width (add-interval a c))

; width([a,b]-[c,d])=width([a-d, b-c])=((a-d)-(b-c))/2 = (a-d-b+c)/2 = ((a-b)+(c-d))/2 = width([a,b]) + width([c,d])
; Радиус разности интервалов равен сумме радиусов каждого из интервала. И тоже является функцией от радиусов аргументов.

(width (sub-interval a b))
(width (sub-interval a c))

; Если мы посчитаем радиус произведения или деления от интервалов с одинаковыми радиусами, то получим разные результаты,
; что говорит о том, что произведение или деление являются функциями, радиус которых зависит не только от радиусов аргументов.

(width (mul-interval a b))
(width (mul-interval a c))

(width (div-interval a b))
(width (div-interval a c))
