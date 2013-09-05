#lang scheme

(define (make-point x y)
  (cons x y))

(define (x-point p) (car p))

(define (y-point p) (cdr p))

(define (same-point? p1 p2)
  (and (= (x-point p1) (x-point p2)) (= (y-point p1) (y-point p2))))

(define (make-segment p1 p2)
  (cons p1 p2))

(define (start-segment segment) (car segment))

(define (end-segment segment) (cdr segment))

; (y1 - y2)x + (x2-x1)y + (x1y2 - x2y1) = 0
; Ax + By + C = 0

(define (length-segment segment) (sqrt (+ (sqr (- (x-point (start-segment segment)) (x-point (end-segment segment))))
                                          (sqr (- (y-point (start-segment segment)) (y-point (end-segment segment)))))))

(define (common-form segment)
  (let ((A (- (y-point (start-segment segment)) (y-point (end-segment segment))))
        (B (- (x-point (end-segment segment)) (x-point (start-segment segment))))
        (C (- (* (x-point (start-segment segment)) (y-point (end-segment segment)))
              (* (x-point (end-segment segment)) (y-point (start-segment segment))))))
  (cons A (cons B C))))

(define (A common-eq) (car common-eq))
(define (B common-eq) (car (cdr common-eq)))
(define (C common-eq) (cdr (cdr common-eq)))

(define (right-angle? segment-a segment-b)
  (let ((line-a (common-form segment-a))
        (line-b (common-form segment-b)))
  ;if (A1A2 + B1B2 = 0) angle is pi/2
  (= 0 (+ (* (A line-a) (A line-b)) (* (B line-a) (B line-b))))))

(define (print-point p)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")")
  (newline))

(define (rectangle side-a side-b)
  (cond ((not (right-angle? side-a side-b)) (display "Angle between sides is not pi/2"))
        ((not (or (same-point? (start-segment side-a) (start-segment side-b))
                 (same-point? (end-segment side-a) (start-segment side-b))
                 (same-point? (start-segment side-a) (end-segment side-b))
                 (same-point? (end-segment side-a) (end-segment side-b)))) (display "segments do not have a common point"))
        (else (cons side-a side-b))))

(define (rectangle-by-diagonal diagonal diagonal-angle)  
  1)

; cos phi = abs|a1a2 + b1b2|/sqrt(a1^2 + b1^2)*sqrt(a2^2 + b2^2)
; midpoint

(define (side-a rectangle)
  (car rectangle))

(define (side-b rectangle)
  (cdr rectangle))

(define (area rectangle)
  (* (length-segment (side-a rectangle)) (length-segment (side-b rectangle))))

(define (perimeter rectangle)
  (* (+ (length-segment (side-a rectangle)) (length-segment (side-b rectangle))) 2))

(define p1 (make-point 0 0))
(define p2 (make-point 2 4))
(define p3 (make-point 0 4))
(define p4 (make-point 2 0))

(define segment1 (make-segment p1 p3))
(define segment2 (make-segment p1 p4))
(define segment3 (make-segment p1 p2))

(define rectangle-a (rectangle segment1 segment2))
(define rectangle-b (rectangle-by-diagonal segment3 1))

(area rectangle-a)
;(area rectangle-b)

(perimeter rectangle-a)
;(perimeter rectangle-b)



