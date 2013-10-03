#lang scheme
(define (make-interval a b) 
  (if (> a b) (display "lower bound is higher than upper bound\n")
  (cons a b)))

(define (lower-bound interval) 
  (car interval))

(define (upper-bound interval) 
  (cdr interval))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define i++ (make-interval 1 2))
(define i-+ (make-interval -1 2))
(define i-- (make-interval -2 -1))

; При умножении выбирается минимум и максимум из произведений границ множителей.
; Рассмотрим знаки произведений границ при различных знаках множителей, учитывая,
; что у интервала верхняя граница больше нижней:
; (+,+)*(+,+) p1 + p2 + p3 + p4 +
; (+,+)*(-,+) p1 - p2 + p3 - p4 +
; (+,+)*(-,-) p1 - p2 - p3 - p4 -

; (-,+)*(+,+) p1 - p2 - p3 + p4 +
; (-,+)*(-,+) p1 + p2 - p3 - p4 +
; (-,+)*(-,-) p1 + p2 + p3 - p4 -

; (-,-)*(+,+) p1 - p2 - p3 - p4 -
; (-,-)*(-,+) p1 + p2 - p3 + p4 -
; (-,-)*(-,-) p1 + p2 + p3 + p4 +
