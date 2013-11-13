#lang scheme

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) null sequence))

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

(define (length sequence)
  (accumulate (lambda (x y) (+ 1 y)) 0 sequence))

(define list1 (list 1 2 3))
(define list2 (list 4 5 6))

(append list1 list2)
(map (lambda (x) (* x x)) list1)
(map (lambda (x) (* x x)) list2)
(length list1)
(length (append list1 list2))
