#lang scheme

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(gcd 206 40)

; При аппликативном порядке вычислений
; (gcd 206 40)
;
; Подставляем значения аргументов в gcd 
;
; (if (= 40 0)
;     206
;     (gcd 40 (remainder 206 40)))) ; Eval!
;
; После сравнения (= 40 0) мы идем по второй ветке и вычисляем значение аргумента (remainder 206 40),
; полученные значения опять подставляем в gcd, и так далее
;
; (if (= 6 0)
;     40
;     (gcd 6 (remainder 40 6)))) ; Eval!
;
; Next Step
;
; (if (= 4 0)
;     6
;     (gcd 4 (remainder 6 4)))) ; Eval!
;
; Next Step
;
; (if (= 2 0)
;     4
;     (gcd 2 (remainder 4 2)))) ; Eval!
;
; Next Step
;
; (if (= 0 0)
;     2
;     (gcd 0 (remainder 2 0))))
;
; Результат 2
;
; remainder выполнился 4 раза
;
; При нормальном порядке вычислений, вначале выполняется полная подстановка, потом сжатие
; (gcd 206 40)
;
; (if (= 40 0)
;     206
;     (gcd 40 (remainder 206 40)))
;
; (if (= (remainder 206 40) 0) ; Eval! 6
;     40
;     (gcd (remainder 206 40) (remainder 40 (remainder 206 40))))
;
; (if (= (remainder 40 (remainder 206 40)) 0) ; Eval!x2 4
;     (remainder 206 40)
;     (gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
;
; (if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0); Eval!x4 2
;     (remainder 40 (remainder 206 40))
;     (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
;          (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))
;
; (if (= (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 0); Eval!x7 0
;     (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
;     (gcd (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
;          (remainder (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))))
;
; (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) ; Eval!x4
;
; 2
;
; remainder выполнился 18 раз
;