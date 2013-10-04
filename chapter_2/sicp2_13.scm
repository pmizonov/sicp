#lang scheme
(define (make-interval a b) (cons a b))

(define (lower-bound interval) 
  (car interval))

(define (upper-bound interval) 
  (cdr interval))

; Если границы обоих интервалов положительные

(define (mul-interval x y)
  (make-interval (* (lower-bound x) (lower-bound y))
                 (* (upper-bound x) (upper-bound y))))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width interval)
  (/ (- (upper-bound interval) (lower-bound interval)) 2.0))

(define (make-center-percent c p)
  (let ((value-by-percent (* (/ p 100) c)))
  (make-interval (- c value-by-percent) (+ c value-by-percent))))

(define (percent i)
  (* (/ (width i) (center i)) 100))

(define a (make-center-percent 4 1))
(define b (make-center-percent 5 0.5))

(define mul (mul-interval a b))

(percent mul)

(define (percent-mul i1 i2)
  (+ (percent i1) (percent i2)))

(define c (make-center-percent 587 0.3))
(define d (make-center-percent 254 0.2))

(define mul-cd (mul-interval c d))
(percent-mul c d)
(percent mul-cd)

; при небольшом значении погрешностей интервалов, погрешность произведения интервалов
; можно представить как сумму погрешностей каждого интервала
