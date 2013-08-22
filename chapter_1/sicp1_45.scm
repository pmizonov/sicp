#lang scheme

(define tolerance 0.00001)

(define (average x y)
  (/ (+ x y) 2.0))

(define (compose f g)
  (lambda(x) (f (g x))))

(define (repeated f n)
  (if (> n 1) (compose f (repeated f (- n 1)))
      f))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (root-nr x n repeat)  
  (fixed-point ((repeated average-damp repeat) (lambda (y) (/ x (expt y (- n 1))))) 1.0))

(define (root-n x n)
  (define (repeat-times n)
    (ceiling (- (/ (log (+ n 1)) (log 2)) 1)))
  (fixed-point ((repeated average-damp (repeat-times n)) (lambda (y) (/ x (expt y (- n 1))))) x))

; experiment

(root-nr (expt 3 3) 3 1)
(display "last 1")
(newline)
(root-nr (expt 3 4) 4 2)
(root-nr (expt 3 7) 7 2)
(display "last 2")
(newline)
(root-nr (expt 3 8) 8 3)
(root-nr (expt 3 15) 15 3)
(display "last 3")
(newline)
(root-nr (expt 3 16) 16 4)
(root-nr (expt 3 31) 31 4)
(display "last 4")
(newline)
(root-nr (expt 3 32) 32 5)
(root-nr (expt 3 63) 63 5)
(display "last 5")
(newline)

(root-n (expt 3 3) 3)
(root-n (expt 3 4) 4)
(root-n (expt 3 7) 7)
(root-n (expt 3 8) 8)
(root-n (expt 3 15) 15)
(root-n (expt 3 16) 16)
(root-n (expt 3 31) 31)
(root-n (expt 3 32) 32)
(root-n (expt 3 63) 63)

; n - показатель степени
; r - число повторений
; maxn - максимальное значение показателя степени, при котором вычисление не "зависает"

; n=3 r=1 maxn = 2^2-1
; n=7 r=2 maxn = 2^3-1
; n=15 r=3 maxn = 2^4-1
; n=31 r=4 maxn = 2^5-1

; Исходя из результатов эксперимента число повторений должно быть равно
; r >= log_2(n+1) - 1, где r - целое число, n - показатель степени
