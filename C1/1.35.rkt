#lang racket
(define tolerance 0.0000001)
(define (fixed-point f first-guess)
  (define (enough-guess? x y) (< (abs (- x y)) tolerance))
(define (start-guess x)
  (let ((next (f x)))
     (if (enough-guess? next x) next
       (start-guess (f next)))
  ))
  (start-guess  first-guess))
(define (fib-fixed-point a)
(fixed-point (lambda (x)(+ 1 (/ 1 x))) a)
 )
  (fib-fixed-point 5.0)