#lang scheme

(display 2.718281828)
(newline)

(define (cont-frac n d k)
  (define (step i)
    (if (< i k) (/ (n i) (+ (d i) (step (+ i 1))))
        (/ (n i) (d i))))
  (step 1))

(+ (cont-frac (lambda (i) 1.0)
              (lambda (i) (if (= (remainder (+ i 1) 3) 0) (* (/ (+ i 1) 3) 2)
                              1.0))
              11)
   2)

; test

(+ 2.0 
   (/ 1 
      (+ 1 (/ 1 
              (+ 2 (/ 1 
                      (+ 1 (/ 1 
                              (+ 1 (/ 1 
                                      (+ 4 (/ 1 
                                              (+ 1 (/ 1 
                                                      (+ 1 (/ 1 
                                                              (+ 6 (/ 1 
                                                                      (+ 1 (/ 1 
                                                                              (+ 1 (/ 1 8))))))))))))))))))))))
