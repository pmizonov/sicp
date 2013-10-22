#lang scheme

(define (last-pair list)
  (if (null? (cdr list)) list
      (last-pair (cdr list))))

(last-pair (list 23 72 149 34))

(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))

(define (reverse item)
  (if (null? item) item
      (append (reverse (cdr item)) (list (car item)))))

(reverse (list 1 4 9 16 25))
