#lang racket
(define (cont-frac n d k)
  (define (cont-frac-start i)
  (if (> i k) 0;should to be / ni di but doesnt matter
     (/ (n i) (+ (d i) (cont-frac-start (+ i 1))) )
   ))
  (cont-frac-start 1)
)

(define (d-number? n )
  (if(= (remainder (- n 2) 3) 0) (* (+ (/(- n 2) 3) 1) 2)
          1                    
   )
)
(define (Euler-frac n)
  (cont-frac (lambda (x) 1.0) d-number? n   ))
(+ 2 (Euler-frac 10))
  
