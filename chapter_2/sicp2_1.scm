#lang scheme

(define (make-rat n d)
  (let ((g (gcd n d)))
    (if (< d 0) (cons (/ (* -1 n) g) (/ (* -1 d) g))
        (cons (/ n g) (/ d g)))))

(define (numer x) (car x))

(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))

(define one-half (make-rat -1 2))
(define one-third (make-rat 1 -3))
(print-rat one-third)
(print-rat (mul-rat one-half one-third))
