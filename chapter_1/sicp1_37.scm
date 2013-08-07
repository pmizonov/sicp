#lang scheme

(define golden-ratio (/ (+ 1 (sqrt 5)) 2))
(display golden-ratio)
(newline)
(display 1.61803398875)
(newline)

(define (cont-frac n d k)
  (if (< k 1) 0
      (/ (n k) (+ (d k) (cont-frac n d (- k 1))))))

(define (cont-frac-i n d k)
  (define (cont-frac-iter n d k i)
    (if (> i k) 0
        (/ (n i) (+ (d i) (cont-frac-iter n d k (+ i 1))))))
  (cont-frac-iter n d k 1))

(/ 1 (cont-frac (lambda (i) 1.0)
                (lambda (i) 1.0)
                12))

(/ 1 (cont-frac-i (lambda (i) 1.0)
                (lambda (i) 1.0)
                12))

; Для получения точности до 4-й цифры понадобилось сделать k = 12