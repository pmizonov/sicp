#lang scheme

(define (square x)
  (* x x))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (even? a)
  (divides? 2 a))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (current-inexact-milliseconds)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (current-inexact-milliseconds) start-time))
      (void)))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes begin end)
  (if (even? begin) (search-for-primes-iter (+ 1 begin) end)
      (search-for-primes-iter begin end)))

(define (search-for-primes-iter begin end)
  (cond ((< begin end) (timed-prime-test begin) (search-for-primes-iter (+ 2 begin) end))))

(search-for-primes 1000 1020)
(search-for-primes 10000 10038)
(search-for-primes 100000 100044)
(search-for-primes 1000000 1000039)

; Результаты выполнения программы
;
;1009 *** 0.00390625
;1013 *** 0.005126953125
;1019 *** 0.005126953125
;
;10007 *** 0.011962890625
;10009 *** 0.011962890625
;10037 *** 0.011962890625
;
;100003 *** 0.0361328125
;100019 *** 0.035888671875
;100043 *** 0.035888671875
;
;1000003 *** 0.113037109375
;1000033 *** 0.112060546875
;1000037 *** 0.113037109375
;
; Полученные результаты подтвреждают, что с увеличением размера числа в 10 раз, время
; затрачиваемое на проверку простоты возрастает примерно в sqrt(10) раз.
; Результат совместим с предположением, что программы затрачивают на выполнение
; задач время, пропорциональное числу шагов.