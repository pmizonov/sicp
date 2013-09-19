#lang scheme

(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (iter num count divider)
  (if (and (= (remainder num divider) 0) (not (= num 0))) (iter (/ num divider) (+ count 1) divider)
      count))

(define (car z)
  (iter z 0 2))

(define (cdr z)
  (iter z 0 3))

(define x1 (cons 5 4))
(define x2 (cons 0 0))
(define x3 (cons 0 1))
(define x4 (cons 1 0))
(define x5 (cons 1 1))
(define x6 (cons 5 11))
(define x7 (cons 5 5))

(car x1)
(cdr x1)
(car x2)
(cdr x2)
(car x3)
(cdr x3)
(car x4)
(cdr x4)
(car x5)
(cdr x5)
(car x6)
(cdr x6)
(car x7)
(cdr x7)
