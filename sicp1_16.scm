#lang scheme
(define (expt b n)
  (if (= n 0)
      1
      (* b (expt b (- n 1)))))

(define (square x)
  (* x x))

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (even? n)
  (= (remainder n 2) 0))

(time (expt 2555 8500))
;cpu time: 44 real time: 46 gc time: 16
(time (fast-expt 2555 8500))
;cpu time: 24 real time: 23 gc time: 24