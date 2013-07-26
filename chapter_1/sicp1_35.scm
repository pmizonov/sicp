#lang scheme

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0)

; Покажите, что золотое сечение φ (раздел 1.2.2) есть неподвижная точка трансформации x → 1 + 1/x
; Из раздела 1.2.2 нам известно, что φ^2 = φ + 1, разделив обе части уравнения на φ получим:
; φ = 1 + 1/φ