#lang scheme
(define (make-interval a b) 
  (if (> a b) (display "lower bound is higher than upper bound\n")
  (cons a b)))

(define (lower-bound interval) 
  (car interval))

(define (upper-bound interval) 
  (cdr interval))

(define (mul-interval x y)
  (let ((ll (* (lower-bound x) (lower-bound y)))
        (lu (* (lower-bound x) (upper-bound y)))
        (ul (* (upper-bound x) (lower-bound y)))
        (uu (* (upper-bound x) (upper-bound y))))
    
    (cond ((and (> (lower-bound x) 0) (> (lower-bound y) 0)) 
           (make-interval ll uu))
          ((and (> (lower-bound x) 0) (< (lower-bound y) 0) (> (upper-bound y) 0))
           (make-interval ul uu))
          ((and (> (lower-bound x) 0) (< (upper-bound y) 0))
           (make-interval ul lu))
          ((and (< (lower-bound x) 0) (> (upper-bound x) 0) (> (lower-bound y) 0))
           (make-interval lu uu))
          ((and (< (lower-bound x) 0) (> (upper-bound x) 0) (< (lower-bound y) 0) (> (upper-bound y) 0))
           (make-interval (min lu ul) (max ll uu)))
          ((and (< (lower-bound x) 0) (> (upper-bound x) 0) (< (upper-bound y) 0))
           (make-interval ul ll))
          ((and (< (upper-bound x) 0) (> (lower-bound y) 0))
           (make-interval lu ul))
          ((and (< (upper-bound x) 0) (< (lower-bound y) 0) (> (upper-bound y) 0))
           (make-interval lu ll))
          ((and (< (upper-bound x) 0) (< (upper-bound y) 0))
           (make-interval uu ll)))))

(define (mul-interval-old x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define i++ (make-interval 1 2))
(define i-+ (make-interval -4 2))
(define i-- (make-interval -2 -1))

(mul-interval i++ i++)
(mul-interval-old i++ i++)
(mul-interval i++ i-+)
(mul-interval-old i++ i-+)
(mul-interval i++ i--)
(mul-interval-old i++ i--)
(mul-interval i-+ i++)
(mul-interval-old i-+ i++)
(mul-interval i-+ i-+)
(mul-interval-old i-+ i-+)
(mul-interval i-+ i--)
(mul-interval-old i-+ i--)
(mul-interval i-- i++)
(mul-interval-old i-- i++)
(mul-interval i-- i-+)
(mul-interval-old i-- i-+)
(mul-interval i-- i--)
(mul-interval-old i-- i--)

; При умножении выбирается минимум и максимум из произведений границ множителей.
; Определим максимум и минимум произведений границ при различных знаках множителей, учитывая,
; что у интервала верхняя граница больше нижней:

; (+,+)*(+,+) ll + lu + ul + uu +  min ll max uu
; (+,+)*(-,+) ll - lu + ul - uu +  min ul max uu
; (+,+)*(-,-) ll - lu - ul - uu -  min ul max lu

; (-,+)*(+,+) ll - lu - ul + uu +  min lu max uu
; (-,+)*(-,+) ll + lu - ul - uu +  min lu ul max ll uu
; (-,+)*(-,-) ll + lu + ul - uu -  min ul max ll

; (-,-)*(+,+) ll - lu - ul - uu -  min lu max ul
; (-,-)*(-,+) ll + lu - ul + uu -  min lu max ll
; (-,-)*(-,-) ll + lu + ul + uu +  min uu max ll
