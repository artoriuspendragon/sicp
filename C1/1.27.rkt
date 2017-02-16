#lang racket
(define (even? x)  (= (remainder x 2)0))
(define (square x)(* x x))
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp) (remainder (square(expmod base (/ exp 2) m)) m))
        (else (remainder (* base (expmod base (- exp 1) m)) m))))
  
(define (fermat n a)
(cond ((= a n) display "cheat success")
      ((evenmod? a n) (fermat n (+ a 1)))
     
   (else (display "wrong"))
 ))
(define (evenmod? a n)
  (= a (expmod a n n))
  )

(fermat 1729 2)
