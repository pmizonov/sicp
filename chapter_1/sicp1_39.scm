#lang scheme

(define (cont-frac n d k)
  (define (step i)
    (if (< i k) (/ (n i) (+ (d i) (step (+ i 1))))
        (/ (n i) (d i))))
  (step 1))

(define (tan-cf x k)
  (/ x
     (+ 1 (cont-frac (lambda (i) (- (* x x)))
                     (lambda (i) (+ (* i 2) 1))
                     k))))

; test
(tan 0.5)
(tan-cf 0.5 20)
(newline)
(tan 0)
(tan-cf 0 20)
(newline)
(tan (/ pi 6))
(tan-cf (/ pi 6) 20)
(newline)
(tan (/ pi 4))
(tan-cf (/ pi 4) 20)
(newline)
(tan (/ pi 3))
(tan-cf (/ pi 3) 20)
(newline)
(tan (/ pi 2))
(tan-cf (/ pi 2) 20)
