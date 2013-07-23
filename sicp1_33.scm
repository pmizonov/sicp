#lang scheme

; ============ prime number test ============

(define (square x)
  (* x x))

(define (even? a)
  (= (remainder a 2) 0))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp) 
         (non-trivial-root-test (expmod base (/ exp 2) m) m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (non-trivial-root-test num m)
  (if (and (not (= num 1)) (not (= num (- m 1))) (= (remainder (square num) m) 1))
      0
      (remainder (square num) m)))

(define (miller-rabin-test n)
  (define (try-it a)
    (= (expmod a (- n 1) n) 1))
  (try-it (+ 2 (random (- n 2)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((miller-rabin-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (prime? n)
  (fast-prime? n 3))

; ============ find greatest common divisor ============

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

; ============ filtered accumulator ============

(define (filtered-accumulate combiner filter null-value term a next b)  
  (define (iter a result)
    (if (> a b)
        result
        (if (filter a)
            (iter (next a) (combiner result (term a)))
            (iter (next a) result))))
  (iter a null-value))

(define (sum term a next b)
  (filtered-accumulate + 0 identity term a next b))

(define (inc x)
  (+ x 1))

(define (identity x)
  x)

(define (sum-prime-squares a b)
  (filtered-accumulate + prime? 0 square a inc b))

(+ (square 1009) (square 1013) (square 1019))
(sum-prime-squares 1000 1020)

(define (product-prime n)
  (define (prime-by-n i)
    (= (gcd i n) 1))
  (filtered-accumulate * prime-by-n 1 identity 1 inc n))

(* 3 7 9)
(product-prime 10)