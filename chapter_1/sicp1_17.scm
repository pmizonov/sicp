#lang scheme
(define (double x)
  (* x 2))

(define (halve x)
  (/ x 2))

(define (even? n)
  (= (remainder n 2) 0))

(define (*-fast a b)
  (cond ((= b 0) 0)
        ((even? b) (*-fast (double a) (halve b)))
        (else (+ a (*-fast a (- b 1))))))

(time (* 3 1212332132131231678678678678678546464204211))
(time (*-fast 3 1212332132131231678678678678678546464204211))
