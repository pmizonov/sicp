#lang scheme

(define (square x)
  (* x x))

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items null))

(define (square-list-other items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items null))

(define (square-list-append items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (append answer
                      (list (square (car things)))))))
  (iter items null))

(square-list (list 1 2 3 4))
(square-list-other (list 1 2 3 4))
(square-list-append (list 1 2 3 4))

;(1 4 9 16)

; В первом случае результатом работы программы будет список
; (cons 16 (cons 9 (cons 4 (cons 1 null)))), т.к. новый элемент добавляется в начало,
; а не в конец списка.

; Во втором случае результатом работы программы будет список
; (cons (cons (cons (cons null 1) 4) 9) 16), т.к. хотя новый элемент и добавляется в конец списка
; первым аргументом cons будет список, поэтому результат будет оборачиваться еще в один cons.
