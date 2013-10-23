#lang scheme

(define (same-parity p . l)
  (define (iter p l)
    (if (null? l) (list p)
      (if (= (modulo p 2) (modulo (car l) 2))
          (cons p (iter (car l) (cdr l)))
          (iter p (cdr l)))))
  
  (iter p l))

(same-parity 1 2 3 4 5 6 7)
;(1 3 5 7)

(same-parity 2 3 4 5 6 7)
;(2 4 6)
