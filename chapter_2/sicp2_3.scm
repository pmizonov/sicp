#lang scheme

(define (make-point x y)
  (cons x y))

(define (x-point p) (car p))

(define (y-point p) (cdr p))

(define (make-segment p1 p2)
  (cons p1 p2))

(define (start-segment segment) (car segment))

(define (end-segment segment) (cdr segment))

(define (length-segment segment) (sqrt (+ (sqr (- (x-point (start-segment segment)) (x-point (end-segment segment))))
                                          (sqr (- (y-point (start-segment segment)) (y-point (end-segment segment)))))))

(define (rectangle point-ul width height)
  (let ((side-a (make-segment point-ul (make-point (+ (x-point point-ul) width) (y-point point-ul))))
        (side-b (make-segment point-ul (make-point (x-point point-ul) (+ (y-point point-ul) height)))))
  (cons side-a side-b)))

(define (rectangle-by-points point-ul point-br)
  (let ((side-a (make-segment point-ul (make-point (x-point point-ul) (y-point point-br))))
        (side-b (make-segment point-ul (make-point (x-point point-br) (y-point point-ul)))))
  (cons side-a side-b)))

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

(define rectangle-a (rectangle p1 2 4))
(define rectangle-b (rectangle-by-points p1 p2))

(area rectangle-a)
(area rectangle-b)

(perimeter rectangle-a)
(perimeter rectangle-b)
