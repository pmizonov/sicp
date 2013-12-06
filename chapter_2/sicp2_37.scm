#lang scheme

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      null
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda x (dot-product (car x) v)) m))

(define (transpose mat)
  (accumulate-n cons null mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda x (matrix-*-vector cols (car x))) m)))

(define v1 (list 1 2 3 4))
(define v2 (list 5 6 7 8))
(define v3 (list 9 10 11 12))
(define v4 (list 13 14 15 16))
(define m1 (list v1 v2 v3 v4))
(define m2 (list (list 17 18 19 20) (list 21 22 23 24) (list 25 26 27 28) (list 29 30 31 32)))

(dot-product v1 v1)
(dot-product v1 v2)
(dot-product v1 v3)
(dot-product v1 v4)

(matrix-*-vector m1 v1)
(transpose m1)
(matrix-*-matrix m1 m2)
