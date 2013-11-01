#lang scheme

(define (fringe items)
  (cond ((null? items) items)
        ((pair? (car items)) (append (fringe (car items)) (fringe (cdr items))))
        (else (append (list (car items)) (fringe (cdr items))))))

(define x (list (list 1 2) (list 3 4)))
(fringe x)
;(1 2 3 4)
(fringe (list x x))
;(1 2 3 4 1 2 3 4)
(define y (list 1 2 (list 3 4) 5 (list 6 7) 8))
(fringe y)
