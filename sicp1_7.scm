(define (square x) (* x x))

(define (sqrt-iter guess x)
  (define improved-guess (improve guess x))
  (if (good-enough? improved-guess guess)
      improved-guess
      (sqrt-iter improved-guess
                 x)))

(define (improve guess x)
  (if (= guess 0)
      guess
      (average guess (/ x guess))))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess new-guess)
  (< (current-guess new-guess guess) 1.0e-4))

(define (current-guess new old)
  (if (= 0 old) 
      (abs new)
      (abs (/ (- new old) 
              old))))
 
(define (sqrt-m x)
  (if (< x 0)
      "incorrect value"
  (sqrt-iter 1.0 x)))

;tests

(define square-num 9.0e-58)
(sqrt-m square-num)
(square (sqrt-m square-num))

(define square-num 9.0e58)
(sqrt-m square-num)
(square (sqrt-m square-num))

(define square-num 0)
(sqrt-m square-num)
(square (sqrt-m square-num))

(define square-num 1.0)
(sqrt-m square-num)
(square (sqrt-m square-num))

(define square-num 1.0e-100)
(sqrt-m square-num)
(square (sqrt-m square-num))

(define square-num 1.0e-323)
(sqrt-m square-num)
(square (sqrt-m square-num))

(define square-num 1.0e-555)
(sqrt-m square-num)
(square (sqrt-m square-num))

; Работает лучше на маленьких числах, потому что погрешность задана изменением вычисляемой величины, т.е в good-enough? 
; константой задана относительная погрешность получаемого результата, а не абсолютная. В то же время на больших числах 
; погрешность будет больше при использовании в качестве критерия абсолютной погрешности достаточно малого значения.