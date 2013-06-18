#lang scheme
(define (fib n)
  (fib-itero 1 0 n))

(define (fib-itero a b count)
  (if (= count 0)
      b
      (fib-itero (+ a b) a (- count 1))))

; Рассмотрим T как частный случай p = 0, q = 1 в семействе трансформаций Tpq,
; где Tpq преобразует пару (a, b) по правилу a ← bq + aq + ap, b ← bp + aq.
; Покажите, что двукратное применение трансформации Tpq равносильно однократному
; применению трансформации Tp'q' того же типа, и вычислите p' и q' через p и q.
;
;   Tpq(Tpq(a,b)) = Tpq^2(a,b)
;   Tpq^2(a,b) = Tp'q'(a,b)
;
;   a1 ← bq + aq + ap
;   b1 ← bp + aq
;   a2 ← b1q + a1q + a1p = (bp + aq)*q + (bq + aq + ap)*q + (bq + aq + ap)*p = bpq + aq^2 + bq^2 + aq^2 + apq + bpq + apq + ap^2 =
;   = 2aq^2 + 2bpq + 2apq + bq^2 + ap^2
;   b2 ← b1p + a1q = (bp + aq)p + (bq + aq + ap)q = bp^2 + apq + bq^2 + aq^2 + apq = aq^2 + bq^2 + bp^2 + 2apq
;
;   a2 = bq' + aq' + ap'
;   b2 = bp' + aq'
;   
;   bq' + aq' + ap' = 2aq^2 + 2bpq + 2apq + bq^2 + ap^2 = b(q^2 + 2pq) + a(2q^2 + 2pq + p^2) = b(q^2 + 2pq) + a(q^2 + 2pq) + a(p^2 + q^2)
;   bp' + aq' = aq^2 + bq^2 + bp^2 + 2apq = b(p^2 + q^2) + a(q^2 + 2pq)
;   
;   q' = q^2 + 2pq
;   p' = p^2 + q^2
;   

(define (square x)
  (* x x))

(define (fib-x n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (square p) (square q)) ; вычислить p’
                   (+ (square q) (* 2 p q))  ; вычислить q’
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))

(time (fib-x 189127))
(time (fib 189127))