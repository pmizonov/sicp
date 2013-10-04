#lang scheme
(define (make-interval a b) (cons a b))

(define (lower-bound interval) 
  (car interval))

(define (upper-bound interval) 
  (cdr interval))

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width interval)
  (/ (- (upper-bound interval) (lower-bound interval)) 2.0))

(define (make-center-percent c p)
  (let ((value-by-percent (* (/ p 100) c)))
  (make-interval (- c value-by-percent) (+ c value-by-percent))))

(define (percent i)
  (* (/ (width i) (center i)) 100))

(define i (make-center-width 4 0.5))
i
(center i)
(width i)

(define i1 (make-center-percent 4 12.5))
i1
(center i1)
(width i1)
(percent i1)
