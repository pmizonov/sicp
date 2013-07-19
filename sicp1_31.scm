#lang scheme

(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)) )))
  (iter a 1))

(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (identity x)
  x)

(define (inc x)
  (+ x 1))

(define (factorial n)
  (product identity 1 inc n))

(define (factorial-iter n)
  (product-iter identity 1 inc n))

(define (square x)
  (* x x))

(define (arg n)
  (/ (* 4 (+ (square n) n))
     (square (+ 1 (* 2 n)))))

(define (pi-john-wallis n)
  (* 4 (product arg 1.0 inc n)))

(define (pi-john-wallis-iter n)
  (* 4 (product-iter arg 1.0 inc n)))

(factorial 7)
(factorial-iter 7)
(time (pi-john-wallis 1000000))
(time (pi-john-wallis-iter 1000000))

;cpu time: 2456 real time: 2470 gc time: 1484
;3.141593438981073
;cpu time: 412 real time: 412 gc time: 60
;3.1415934389872975