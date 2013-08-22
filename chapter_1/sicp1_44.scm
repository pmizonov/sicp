#lang scheme

(define dx 0.000001)

(define (square x)
  (* x x))

(define (compose f g)
  (lambda(x) (f (g x))))

(define (repeated f n)
  (if (> n 1) (compose f (repeated f (- n 1)))
      f))

(define (smooth f)
  (lambda(x) (/ (+ (f x) (f (+ x dx)) (f (- x dx))) 
                3)))

(((repeated smooth 5) square) 4)

((smooth square) 4)

; (((repeated smooth n) f) x)

; 625
