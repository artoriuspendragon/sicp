#lang racket
(define (cont-frac n d k)
  (define (cont-frac-start i)
  (if (> i k) (/ (n i) (d i))
     (/ (n  i) (- (d i) (cont-frac-start (+ i 1))) )
   ))
  (cont-frac-start 1)
)
(define(tan-cf x k )
  (define (fn  i)
  (if (= i 1) x
     (* x x)
    ))
  (define (fd i) (- (* i 2) 1))
  (cont-frac fn fd k)
  )

(define π 3.1415926)
(tan-cf (/ π 4) 10000)