#lang scheme
(define (cube x) (* x x x))

(define (p x) (- (* 3 x) (* 4 (cube x))))

(define (sine angle)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))

(sine 12.15)

; a) Процедура p будет вызываться, пока значение angle больше 0.1, при этом значение angle каждый раз будет уменьшаться в 3 раза.
;    Т.е. вызов p не будет выполняться, когда выполнится неравенство:
;
;                                             angle / 3^x < 0.1 (1)
;    где x - число вызовов процедуры p.
;    Для нашего случая angle равен 12.15, уравнение примет вид
;                      12.15 / 3^x < 0.1
;                      3^x < 121.5
;                      x < log 121.5
;                             3
;                      x < 4,369070246
;    Т.к. число шагов целое, то берем ближайшее значение x, которое больше 4,37, т.е. ответ число 5.
; b) Из уравнения (1) мы можем легко получить необходимое число вызовов p для любого значения angle
;
;                      x < log (angle/0.1)
;                             3
;    Т.к. в нашей программе только вызов p является рекурсивным, то порядок роста определяется уравнением (2) и равен соответственно O(log n).
;    Необходимая память определяется числом шагов, которые необходимо хранить до получения результата, т.е. тоже равно O(log n).