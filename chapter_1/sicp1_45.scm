#lang scheme

(define tolerance 0.00001)

(define (display-m x)
  (display x)
  (newline))

(define (display-c x c)
  (display x)
  (newline)
  (display c)
  (newline))

(define (average x y)
  (/ (+ x y) 2.0))

(define (compose f g)
  (lambda(x) (f (g x))))

(define (repeated f n)
  (if (> n 1) (repeated (compose f f) (- n 1))
      (lambda (x) (f x))))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  
  (define (try guess count)
    (let ((next (f guess)))
      ;(display-m guess)
      (if (close-enough? guess next)
          ;next
          (display-c next count)
          (try next (+ count 1)))))
  
  (try first-guess 1))

(define (root-nr x n repeat)  
  (fixed-point ((repeated average-damp repeat) (lambda (y) (/ x (expt y (- n 1))))) 1.0))

(define (root-n x n)
  (define (repeat-times n)
    n)
  (fixed-point ((repeated average-damp (repeat-times n)) (lambda (y) (/ x (expt y (- n 1))))) x))

; experiment

(root-nr 1e3 3 1)
(root-nr 1e4 4 2)


