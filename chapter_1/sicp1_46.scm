#lang scheme

(define (iterative-improve good-enough? improve-method)
  (define (improve-iter x)
      (if (good-enough? x) (improve-method x)
          (improve-iter (improve-method x))))
  improve-iter)

(define tolerance 0.00001)

(define (sqrt x)
  (define (square x)
    (* x x))

  (define (good-enough? guess)
    (< (abs (- (square guess) x)) tolerance))

  (define (improve guess)
    (define (average x y)
      (/ (+ x y) 2))
    (average guess (/ x guess)))

  ((iterative-improve good-enough? improve) x))

(define (fixed-point f first-guess)
  (define (close-enough? guess)
    (< (abs (- (f guess) guess)) tolerance))
  ((iterative-improve close-enough? f) first-guess))

(sqrt 9.0)
(sqrt 81.0)
(fixed-point cos 1.0)
;0.7390822985224023
