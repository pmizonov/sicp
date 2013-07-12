#lang scheme

(define (square x)
  (* x x))

(define (even? a)
  (= (remainder a 2) 0))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (ferma-cheat n)
  (ferma-cheat-iter n 1))

(define (ferma-cheat-iter n a)
  (cond ((< a n) (test-ferma-cheat n a))
        (else (display n) (display " - passed test\n"))))

(define (test-ferma-cheat n a)
  (cond ((= (expmod a n n) a) (ferma-cheat-iter n (+ a 1)))
        (else (display n) (display " - not passed test\n"))))

; composite number
(ferma-cheat 10)
; prime number
(ferma-cheat 1019)
; Carmichael numbers
(ferma-cheat 561)
(ferma-cheat 1105)
(ferma-cheat 1729)
(ferma-cheat 2465)
(ferma-cheat 2821)
(ferma-cheat 6601)

; Несколько первых чисел Кармайкла — 561, 1105, 1729, 2465, 2821 и 6601.
; Результаты работы программы
;
; 10 - not passed test
; 1019 - passed test
; 561 - passed test
; 1105 - passed test
; 1729 - passed test
; 2465 - passed test
; 2821 - passed test
; 6601 - passed test
