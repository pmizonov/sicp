#lang scheme

(define tolerance 0.00001)
(define (display-m x)
  (display x)
  (newline))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (display-m guess)
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(fixed-point (lambda (x) (/ (log 1000) (log x))) 4.555)
(fixed-point (lambda (x) (/ (+ x (/ (log 1000) (log x))) 2.0)) 4.555)

; Без торможения усреднением
; x = log(1000)/log(x)
;
; 4.555
; 4.555889040952041
; 4.555302707810511
; 4.555689371735357
; 4.555434368942717
; 4.555602536286347
; 4.555491632087242
; 4.555564770913405
; 4.5555165370381046
; 4.555548346298672
; 4.555527368650051
; 4.555541203002709
; 4.555532079498692

; С торможением усреднением
; x = (x + log(1000)/log(x))/2
;
; 4.555
; 4.555444520476021
; 4.555520180843763
; 4.555533062049689
; 4.555535255175542

; Вывод: применяя торможение усреднением нам понадобилось меньше шагов для вычисления.
