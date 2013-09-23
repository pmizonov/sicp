#lang scheme

(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define f (lambda (x) (+ x 1)))

; ((zero f) 1)

; (((add-1 zero) f) 1)

; (add-1 zero)
; (lambda (f) (lambda (x) (f ((zero f) x)))))
; (lambda (f) (lambda (x) (f ((lambda (x) x) x))))
; (lambda (f) (lambda (x) (f x)))

(define one (lambda (f) (lambda (x) (f x))))

((one f) 1)

(((add-1 one) f) 1)

; (add-1 one)
; (lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) (f x))) f) x))))
; (lambda (f) (lambda (x) (f ((lambda (x) (f x)) x))))
; (lambda (f) (lambda (x) (f (f x))))

(define two
  (lambda (f) (lambda (x) (f (f x)))))

((two f) 1)
(((add-1 two) f) 1)

(define (add a b)
  (lambda (f) (lambda (x) ((a f) ((b f) x)))))

(((add (add one two) two) f) 1)

(((add two one) f) 1)
