(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (square x) (* x x))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

;(define (sqrt-iter guess x)
;  (new-if (good-enough? guess x)
;          guess
;          (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 1.0e-4))

(define (sqrt-m x)
  (sqrt-iter 1.0 x))

(sqrt-m 9)

; При использовании new-if, т.к. new-if не является особой формой, используется аппликативный порядок вычисления,
; следовательно при выполнении процедуры new-if будет вычисляться предикат и обе ветви перед подстановкой в 
; (cond (predicate then-clause)
;      (else else-clause))
; в отличии от случая, когда используется обычный if (тогда вычисляется только ветвь, которая будет выполняться).
; В нашем случае предикатом и ветвями являются (good-enough? guess x), guess и (sqrt-iter (improve guess x) x))).
; И, хотя guess определен при вызове sqrt-iter, в то же время sqrt-iter определен рекурсивно, а т.к. применяется 
; аппликативный порядок вычисления, вычисление sqrt-iter никогда не прекратится. Поэтому программа зацикливается
; на вычислении sqrt-iter.