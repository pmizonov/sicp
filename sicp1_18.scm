#lang scheme
(define (double x)
  (* x 2))

(define (halve x)
  (/ x 2))

(define (even? n)
  (= (remainder n 2) 0))

(define (*-fast a b)
  (*-fast-iter a b 0))

(define (*-fast-iter a b s)
  (cond ((= b 0) s)
        ((even? b) (*-fast-iter (double a) (halve b) s))
        (else (*-fast-iter a (- b 1) (+ a s)))))

(time (* 3 1212332132131231678678678678678546464204211))
(time (*-fast 3 1212332132131231678678678678678546464204211))
