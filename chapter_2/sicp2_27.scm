#lang scheme

(define (deep-reverse item)
  (cond ((null? item) item)
        ((pair? (car item)) (append (deep-reverse (cdr item)) (list (deep-reverse (car item)))))
        (else (append (deep-reverse (cdr item)) (list (car item))))))

(define x (list (list 1 2) (list 3 4)))
(define y (list (list 1 2 (list 7 8)) (list 3 4) (list 5 6)))

(reverse x)
(deep-reverse x)
(deep-reverse y)
