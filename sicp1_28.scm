#lang scheme

(define (square x)
  (* x x))

(define (divides? a b)
  (= (remainder b a) 0))

(define (even? a)
  (divides? 2 a))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (if (= (square (expmod base (/ exp 2) m)) 1) (display " not prime")
             (void))
             
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

;Однако когда в процедуре expmod мы проводим возведение в квадрат, мы проверяем, не нашли ли мы «нетривиальный
;квадратный корень из 1 по модулю n», то есть число, не равное 1 или n − 1, квадрат которого
;по модулю n равен 1.
;

(define (miller-rabin-test n)
  (define (try-it a)
    (= (expmod a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))

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

(timed-prime-test 1000)
(timed-prime-test 1001)
(timed-prime-test 1009)
(timed-prime-test 1013)
(timed-prime-test 1019)
;(timed-prime-test 1000003)
;(timed-prime-test 1000033)
;(timed-prime-test 1000037)
;(timed-prime-test 1000043)
(timed-prime-test 2465)
(timed-prime-test 2821)
(timed-prime-test 6601)
(timed-prime-test 74665)

; Несколько первых чисел Кармайкла — 561, 1105, 1729, 2465, 2821 и 6601.