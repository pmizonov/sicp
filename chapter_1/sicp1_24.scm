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
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (current-inexact-milliseconds)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 15)
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
(timed-prime-test 1000003)
(timed-prime-test 1000033)
(timed-prime-test 1000037)
(timed-prime-test 1000043)

; Результаты выполнения программы
;
; 1009 *** 0.053955078125
; 1013 *** 0.05615234375
; 1019 *** 0.057861328125
;
; 1000003 *** 0.093017578125
; 1000033 *** 0.094970703125
; 1000037 *** 0.095947265625
;
; Исходя из того, что у теста Ферма порядок роста Θ(log n), то какого соотношения времени
; Вы бы ожидали между проверкой на простоту поблизости от 1 000 000 и поблизости от 1000?
; 
; Ожидаемое соотношение времени log(1000000)/log(1000) = 6 / 3 = 2
;
; Подтверждают ли это Ваши данные? 
;
; Реальное среднее соотношение времени (0.093017578125 + 0.094970703125 + 0.095947265625) / (0.053955078125 + 0.05615234375 + 0.057861328125) = 1.690
;
; Можете ли Вы объяснить наблюдаемое несоответствие, если оно есть?
;
; Наблюдаемое несоответствие можно объяснить тем что в тесте Ферма мы используем процедуру
; expmod для проверки числа на простоту. При проверке больших чисел чаще выпадают большие
; случайные числа, которые используются в операциях умножения и вычисления остатка в процедуре
; expmod, что добавляет дополнительную сложность в алгоритм. Т.к. эти операции также зависят от размера
; аргумента. Поэтому не наблюдается двукратного увеличения скорости.
