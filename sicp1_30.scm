#lang scheme

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)) )))
  (iter a 0))

(define (inc x)
  (+ x 1))

(define (even? x)
  (= (remainder x 2) 0))

(define (integral-simpson f a b n)
  (define h
    (/ (- b a) n))
    
  (define (k x) 
    (cond ((or (= x 0) (= x n)) 1)
          ((even? x) 2)
          (else 4)))
  
  (define (y x)
    (* (k x) (f (+ a (* x h)))))
  
  (* (/ h 3) (sum y 0 inc n)))

(define (cube x) (* x x x))

(integral-simpson cube 0 1 1000.0)

; Вычисление интеграла методом Симпсона дает более точный результат за одинаковое число итераций.
