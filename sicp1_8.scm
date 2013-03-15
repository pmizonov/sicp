(define (square x) (* x x))
(define (cube x) (* x x x))

(define (crt-iter guess x)
  (define improved-guess (improve guess x))
  (if (good-enough? improved-guess guess)
      guess
      (crt-iter improved-guess
                 x)))

(define (improve guess x)
  (/ (+ (* 2 guess) (/ x (square guess))) 
     3))

(define (good-enough? guess new-guess)
  (< (abs (/ (- new-guess guess) guess)) 1.0e-4))

(define (crt-m x)
  (crt-iter 1.0 x))

;tests

(define square-num 2.7e-58)
(crt-m square-num)
(cube (crt-m square-num))

(define square-num -2.7e-58)
(crt-m square-num)
(cube (crt-m square-num))

(define square-num 2.7e58)
(crt-m square-num)
(cube (crt-m square-num))

(define square-num 27)
(crt-m square-num)
(cube (crt-m square-num))

(define square-num 0)
(crt-m square-num)
(cube (crt-m square-num))