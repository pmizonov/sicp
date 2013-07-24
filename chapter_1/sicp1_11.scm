#lang scheme
;f(n) = n if n<3 and f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n > 3. 
(define (f-recursive n)
  (if (< n 3) 
      n
      (+ (f-recursive (- n 1)) (* 2 (f-recursive (- n 2))) (* 3 (f-recursive (- n 3))))))

(define (f-iterative n)  
  (if (< n 3)
      n
      (f-iter 2 1 0 3 n)))

(define (f-iter n1 n2 n3 count n)
  (if (= count n)
      (f n1 n2 n3)
      (f-iter (f n1 n2 n3) n1 n2 (+ count 1) n)
      ))

(define (f n1 n2 n3)
  (if (< n1 2) 
      (+ 1 n1)
      (+ n1 (* 2 n2) (* 3 n3))))

; tests
(time (f-recursive 25))
(time (f-iterative 25))

(f-iterative 2)
(= (f-recursive 2) (f-iterative 2))

(f-iterative 3)
(= (f-recursive 3) (f-iterative 3))

(f-iterative 4)
(= (f-recursive 4) (f-iterative 4))

(f-iterative 5)
(= (f-recursive 5) (f-iterative 5))
