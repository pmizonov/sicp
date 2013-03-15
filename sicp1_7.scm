(define (square x) (* x x))

(define (sqrt-iter guess x)
  (define improved-guess (improve guess x))
  (if (good-enough? improved-guess guess)
      guess
      (sqrt-iter improved-guess
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess new-guess)
  (< (abs (/ (- new-guess guess) guess)) 1.0e-4))

(define (sqrt-m x)
  (sqrt-iter 1.0 x))

;tests

(define square-num 9.0e-58)
(sqrt-m square-num)
(square (sqrt-m square-num))

; Работает лучше, потому что погрешность задана изменением вычисляемой величины, т.е в good-enough? 
; константой задана относительная погрешность получаемого результата, а не абсолютная.