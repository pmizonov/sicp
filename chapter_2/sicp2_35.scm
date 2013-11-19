#lang scheme

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (count-leaves-old x)
  (cond ((null? x) 0)
        ((not (pair? x)) 1)
        (else (+ (count-leaves-old (car x))
                 (count-leaves-old (cdr x))))))

(define (count-leaves t)
  (accumulate + 0
              (map (lambda (x) (cond ((not (pair? x)) 1)
                                     (else (count-leaves x)))) t)))

(define x (cons (list 1 2) (list 3 4)))

(define y (list x 5))

(count-leaves-old x)
(count-leaves-old y)

(count-leaves x)
(count-leaves y)
