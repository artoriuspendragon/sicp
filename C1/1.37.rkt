#lang racket
(define (cont-frac n d k)
  (define (cont-frac-start i)
  (if (> i k) 0
     (/ (n i) (+ (d i) (cont-frac-start (+ i 1))) )
   ))
  
(cont-frac-start 1)
  )
(define (cont-frac-iter n d k r)
  (if (< k 0) r
      (cont-frac-iter n d (- k 1) (/ (n k) (+ r (d k))) )
   )
  )
(cont-frac-iter (lambda (i) 1.0) (lambda (i) 1.0) 12 1)