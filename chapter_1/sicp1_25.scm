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

(define (expmod-slow base exp m)
   (remainder (fast-expt base exp) m))

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(time (expmod 4215011 1710200 57))
(time (expmod-slow 4215011 1710200 57))

; Если использовать expmod который вызывает fast-expt, то наша программа существенно замедлится
; при проверке больших простых чисел. Это связано с тем, что fast-expt будет возвращать
; все большие числа по мере возведения в степень, а это увеличит время выполнения и простых
; операций, например умножения, остатка от деления.
; В то же время, используемый нами expmod использует в качестве для рекурсивного вызова
; аргумент получившийся в результате операции remainder, который существенно меньше
; чем n-я степень числа в fast-expt.
