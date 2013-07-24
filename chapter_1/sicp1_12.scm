#lang scheme
;       1 <- row n = 0
;      1 1 <- row n = 1
;     1 2 1
;    1 3 3 1
;  1 4  6  4 1
; 1 5 10 10 5 1
;  \ \__ element k = 1
;   \___ element k = 0

(define (pascal-rec row element)
  (cond ((< row 1) 1)
        ((< element 1) 1)
        ((= element row) 1)
        (else (+ (pascal-rec (- row 1) (- element 1))
                 (pascal-rec (- row 1) element)))))

;****
(define (pascal-triangle n)
  (pascal-line n 0 0))

(define (pascal-line row current-row element)
  (cond ((= current-row 0) (display "1\n") (pascal-line row 1 0))
        ((= current-row element) (display "1\n") (pascal-line row (+ current-row 1) 0))
        ((>= row current-row) (display (pascal-rec current-row element))
              (display " ")
              (pascal-line row current-row (+ element 1)))))
; tests

(= (pascal-rec 0 0) 1)
(= (pascal-rec 1 0) 1)
(= (pascal-rec 1 1) 1)
(= (pascal-rec 5 2) 10)
(= (pascal-rec 10 4) 210)
(= (pascal-rec 10 5) 252)

(pascal-triangle 10)
(pascal-triangle 3)
(pascal-triangle 2)
(pascal-triangle 1)
(pascal-triangle 0)