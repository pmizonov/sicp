#lang scheme

(define (square x)
  (* x x))

(define (even? a)
  (= (remainder a 2) 0))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp) 
         (non-trivial-root-test (expmod base (/ exp 2) m) m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (non-trivial-root-test num m)
  (if (and (not (= num 1)) (not (= num (- m 1))) (= (remainder (square num) m) 1))
      0
      (remainder (square num) m)))

(define (miller-rabin-test n)
  (define (try-it a)
    (= (expmod a (- n 1) n) 1))
  (try-it (+ 2 (random (- n 2)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((miller-rabin-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (current-inexact-milliseconds)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 3)
      (report-prime (- (current-inexact-milliseconds) start-time))
      (void)))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(timed-prime-test 1001)
(timed-prime-test 1009)
(timed-prime-test 1013)
(timed-prime-test 1019)
(timed-prime-test 10007)
(timed-prime-test 10009)
(timed-prime-test 10037)
(timed-prime-test 100003)
(timed-prime-test 100019)
(timed-prime-test 100043)
(timed-prime-test 1000003)
(timed-prime-test 1000033)
(timed-prime-test 1000037)
(timed-prime-test 1000043)
(timed-prime-test 561)
(timed-prime-test 1105)
(timed-prime-test 1729)
(timed-prime-test 2465)
(timed-prime-test 2821)
(timed-prime-test 6601)
