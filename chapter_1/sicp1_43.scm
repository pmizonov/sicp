#lang scheme

(define (square x)
  (* x x))

(define (compose f g)
  (lambda(x) (f (g x))))

(define (repeated f n)
  (if (> n 1) (compose f (repeated f (- n 1)))
      f))

((repeated square 2) 5)
; 625

((repeated square 3) 5)
; 390625

((repeated square 1) 5)
; 25