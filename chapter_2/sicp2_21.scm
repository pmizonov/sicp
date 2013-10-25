#lang scheme

(define (square-list items)
  (if (null? items)
      null
      (cons (* (car items) (car items)) (square-list (cdr items)))))

(define (square-list-other items)
  (map (lambda (x) (* x x)) items))

(square-list (list 1 2 3 4))
(square-list-other (list 1 2 3 4))

;(1 4 9 16)
