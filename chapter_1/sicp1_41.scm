#lang scheme

(define (inc x)
  (+ x 1))

(define (double f)
  (lambda(x) (f (f x))))

((double inc) 1)
; 3

(((double double) inc) 1)
; 5

(((double (double double)) inc) 5)
; 21

; double вызовет inc два раза, (double double) - вернет функцию, которая вызовет
; inc 4 раза, (double (double double)) вызовет (double double) (double double) раз, соответственно 
; inc 4 * 4 16 раз, т.е. inc выполнится 16 раз, ответ 5 + 16 = 21

