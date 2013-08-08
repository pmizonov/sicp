#lang scheme

(define golden-ratio (/ (+ 1 (sqrt 5)) 2))
(display golden-ratio)
(newline)
(display 1.61803398875)
(newline)

(define (cont-frac n d k)
  (define (step i)
    (if (< i k) (/ (n i) (+ (d i) (step (+ i 1))))
        (/ (n i) (d i))))
  (step 1))

(define (cont-frac-i n d k)
  (define (iter i result)
    (if (< i 1) result
        (iter (- i 1) (/ (n i) (+ (d i) result)))))
  (iter k 0))

(/ 1 (cont-frac (lambda (i) 1.0)
                (lambda (i) 1.0)
                12))

(/ 1 (cont-frac-i (lambda (i) 1.0)
                (lambda (i) 1.0)
                12))

; Для получения точности до 4-й цифры понадобилось сделать k = 12
