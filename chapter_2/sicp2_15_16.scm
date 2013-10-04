#lang scheme
(define (make-interval a b) (cons a b))

(define (lower-bound interval) 
  (car interval))

(define (upper-bound interval) 
  (cdr interval))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval x
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width interval)
  (/ (- (upper-bound interval) (lower-bound interval)) 2.0))

(define (make-center-percent c p)
  (let ((value-by-percent (* (/ p 100) c)))
  (make-interval (- c value-by-percent) (+ c value-by-percent))))

(define (percent i)
  (* (/ (width i) (center i)) 100))

(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval one
                  (add-interval (div-interval one r1)
                                (div-interval one r2)))))

(define r1 (make-center-percent 2 5))
(define r2 (make-center-percent 100 1))

(define rpar1 (par1 r1 r2))
(define rpar2 (par2 r1 r2))

(center rpar1)
(center rpar2)

(percent rpar1)
(percent rpar2)

; Вторая формула для вычисления значения сопротивления параллельных резисторов более
; точная, потому что для вычисления используется меньшее количество чисел с погрешностью.
; Соответственно и погрешность результата будет меньше.

; Можете ли Вы представить себе пакет для работы с интервальной арифметикой,
; который бы не обладал этим недостатком, или такое невозможно?
; Пакет для работы с интервальной арифметикой, должен уметь преобразовывать алгебраические выражения 
; в эквивалентные. Что не всегда представляется возможным.
