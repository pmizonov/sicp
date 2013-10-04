#lang scheme
(define (make-interval a b) (cons a b))

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
  (mul-interval x
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width interval)
  (/ (- (upper-bound interval) (lower-bound interval)) 2.0))

(define (make-center-percent c p)
  (let ((value-by-percent (* (/ p 100) c)))
  (make-interval (- c value-by-percent) (+ c value-by-percent))))

(define (percent i)
  (* (/ (width i) (center i)) 100))

(define a1 (make-center-percent 2 5))
(define b1 (make-center-percent 10 1))
(define a2 (make-center-percent 300 1))
(define b2 (make-center-percent 100 1))
(define a3 (make-center-percent 0.5 0.5))
(define b3 (make-center-percent 0.1 1))

(define div-a1-a1 (div-interval a1 a1))
(define div-a1-b1 (div-interval a1 b1))

(define div-a2-a2 (div-interval a2 a2))
(define div-a2-b2 (div-interval a2 b2))

(define div-a3-a3 (div-interval a3 a3))
(define div-a3-b3 (div-interval a3 b3))

(display "a1\n")

(center div-a1-a1)
(percent div-a1-a1)

(center div-a1-b1)
(percent div-a1-b1)

(display "a2\n")

(center div-a2-a2)
(percent div-a2-a2)

(center div-a2-b2)
(percent div-a2-b2)

(display "a3\n")

(center div-a3-a3)
(percent div-a3-a3)

(center div-a3-b3)
(percent div-a3-b3)

; По результатам эксперимента мы можем увидеть:
; 1) деление интервала самого на себя не дает точное значение 1, а только приближение к этому значению
; 2) погрешность результата (для малых значений процента) является суммой погрешностей делмого и делителя
