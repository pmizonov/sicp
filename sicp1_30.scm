#lang scheme

(define (old-sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2)) add-dx b)
     dx))

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

(define (integral-simpson-old-sum f a b n)
  (define h
    (/ (- b a) n))
    
  (define (k x) 
    (cond ((or (= x 0) (= x n)) 1)
          ((even? x) 2)
          (else 4)))
  
  (define (y x)
    (* (k x) (f (+ a (* x h)))))
  
  (* (/ h 3) (old-sum y 0 inc n)))

(define (cube x) (* x x x))

(time (integral-simpson-old-sum cube 0 1 10000000.0))
(time (integral-simpson cube 0 1 10000000.0))

; Вычисление интеграла методом Симпсона дает более точный результат за одинаковое число итераций.
