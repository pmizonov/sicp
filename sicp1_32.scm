#lang scheme

(define (accumulate combiner null-value term a next b)  
  (if (> a b)
      null-value
      (combiner (term a)
         (accumulate combiner null-value term (next a) next b))))

(define (accumulate-iter combiner null-value term a next b)  
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner result (term a)))))
  (iter a null-value))

(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (product term a next b)
  (accumulate * 1 term a next b))

(define (product-iter term a next b)
  (accumulate-iter * 1 term a next b))

(define (inc x)
  (+ x 1))

(define (identity x)
  x)

(define (factorial n)
  (product identity 1 inc n))

(define (factorial-iter n)
  (product-iter identity 1 inc n))

(sum identity 1 inc 10)
(factorial 7)
(factorial-iter 7)
