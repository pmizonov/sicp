#lang scheme

(define us-coins (list 50 25 10 5 1))
(define us-coins-reordered (list 1 5 10 25 50))
(define uk-coins (list 100 50 20 10 5 2 1 0.5))

(define (no-more? items)
  (null? items))

(define (except-first-denomination items)
  (cdr items))

(define (first-denomination items)
  (car items))

(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
         (+ (cc amount
                (except-first-denomination coin-values))
            (cc (- amount (first-denomination coin-values))
                coin-values)))))

(cc 100 us-coins)
;292
(cc 100 us-coins-reordered)
(cc 100 uk-coins)
; Результат не зависит от порядка списка монет. Потому что в используемом алгоритме
; важны только значения списка, а не порядок этих значений в списке.
