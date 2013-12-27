#lang scheme

(define (enumerate-interval low high)
  (if (> low high)
      null
      (cons low (enumerate-interval (+ low 1) high))))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (flatmap proc seq)
  (accumulate append null (map proc seq)))

(define empty-board null)

(define (safe? k positions)
  (let ((other-positions (filter 
                          (lambda (positions) (not (= k (cadr positions)))) positions))
        (queen (car positions)))
  (or (null? other-positions) (and (not (= (car queen) (caar other-positions)))
                                   (not (= (abs (- (car queen) (caar other-positions)))
                                           (abs (- (cadr queen) (cadar other-positions)))))
                                   (safe? k (cons queen (cdr other-positions)))))))

(define (adjoin-position row col queens) (cons (list row col) queens))

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0) (list empty-board)
        (filter 
          (lambda (positions) (safe? k positions))
          (flatmap
           (lambda (rest-of-queens)
             (map (lambda (new-row)
                    (adjoin-position new-row k rest-of-queens))
                  (enumerate-interval 1 board-size)))
           (queen-cols (- k 1))))))
  (queen-cols board-size))

(length (queens 8))
