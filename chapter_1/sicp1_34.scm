#lang scheme
(define (f g)
  (g 2))

(define (square x)
  (* x x))

(f square)

(f (lambda (z) (* z (+ z 1))))

; Что случится, если мы попросим интерпретатор вычислить комбинацию (f f)?
; Объясните.

; Интерпретатор не сможет вычислить комбинацию (f f), потому что
; при подстановке произойдет следующее:
; (f f)
; (f 2)
; (2 2)
; т.е. интерпретатор попытается использовать значение 2 как процедуру.