#lang scheme

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car (cdr branch)))

(define (branch? structure)
  (pair? structure))

(define (branch-weight branch)
  (if (branch? (branch-structure branch)) (total-weight (branch-structure branch))
      (branch-structure branch)))

(define (total-weight mobile)
  (+ (branch-weight (left-branch mobile))
     (branch-weight (right-branch mobile))))

(define (balanced? mobile)
  (define (branch-balanced? branch)
    (if (branch? (branch-structure branch)) (balanced? (branch-structure branch))
        #t))
  (and (= (* (branch-length (left-branch mobile)) (branch-weight (left-branch mobile)))
          (* (branch-length (right-branch mobile)) (branch-weight (right-branch mobile))))
       (branch-balanced? (left-branch mobile))
       (branch-balanced? (right-branch mobile))))

(define b1 (make-branch 1 5))
(define b2 (make-branch 1 4))
(define b3 (make-branch 2 7))
(define b4 (make-branch 3 2))
(define b5 (make-branch 4 1))

(define mobile (make-mobile b1 (make-branch 2 (make-mobile b2 b3))))
mobile

(define big-mobile (make-mobile (make-branch 3 mobile) (make-branch 4 (make-mobile b4 b5))))
big-mobile

(total-weight mobile)
(total-weight big-mobile)

(balanced? mobile)

(define balanced-mobile (make-mobile (make-branch 2 5) (make-branch 1 (make-mobile b1 b1))))
(balanced? balanced-mobile)

; Если изменить представление модулей на
;
; (define (make-mobile left right)
;   (cons left right))
; (define (make-branch length structure)
;   (cons length structure))

; То нужно будет изменить также right-branch и branch-structure
; (define (right-branch mobile)
;   (cdr mobile))

; (define (branch-structure branch)
;   (cdr branch))
