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

(define add-res (add-interval a b))
(define mul-res (mul-interval a b))
(define div-res (div-interval a b))
(define sub-res (sub-interval a b))

(width a)
(width b)
(width add-res)
(width sub-res)
(width mul-res)
(width div-res)

; (sub-interval x y)
; (make-interval (- (lower-bound x) (upper-bound y)) (- (upper-bound x) (lower-bound y))))
; (cons (- (car x) (cdr y)) (- (cdr x) (car y))))

; (add-interval x y)
; (make-interval (+ (lower-bound x) (lower-bound y)) (+ (upper-bound x) (upper-bound y)))
; (cons (+ (car x) (car y)) (+ (cdr x) (cdr y)))

; (sub-interval x y)
; (make-interval (- (lower-bound x) (upper-bound y)) (- (upper-bound x) (lower-bound y))))
; (cons (- (car x) (cdr y)) (- (cdr x) (car y))))

; (width (add-interval x y))
; (/ (- (upper-bound (add-interval x y)) (lower-bound (add-interval x y))) 2.0)
; (/ (- (cdr (add-interval x y)) (car (add-interval x y))) 2.0)
; (/ (- (cdr (cons (+ (car x) (car y)) (+ (cdr x) (cdr y)))) (car (cons (+ (car x) (car y)) (+ (cdr x) (cdr y))))) 2.0)
; (/ (- (+ (cdr x) (cdr y)) (+ (car x) (car y))) 2.0)
; (/ (+ (- (cdr x) (car x)) (- (cdr y) (car y))) 2.0)
; (+ (/ (- (cdr x) (car x)) 2) (/ (- (cdr y) (car y)) 2))
; (+ (width x) (width y))

; (width (sub-interval x y))
; (/ (- (upper-bound (sub-interval x y)) (lower-bound (sub-interval x y))) 2.0)
; (/ (- (cdr (sub-interval x y)) (car (sub-interval x y))) 2.0)
; (/ (- (cdr (cons (- (car x) (cdr y)) (- (cdr x) (car y))))) (car (cons (- (car x) (cdr y)) (- (cdr x) (car y)))))) 2.0)
; (/ (- (- (cdr x) (car y)) (- (car x) (cdr y))) 2.0)
; (/ (+ (- (cdr x) (car y)) (- (cdr y) (car x))) 2.0)
; (/ (+ (- (cdr x) (car x)) (- (cdr y) (car y))) 2.0)
; (+ (width x) (width y))

; (width (mul-interval x y))

; (width interval)
; (/ (- (upper-bound interval) (lower-bound interval)) 2.0))
; (/ (- (cdr interval) (car interval)) 2.0))

; Радиусы add-interval и sub-interval равны и представляют сосбой сумму каждого из интервалов.
