#lang racket
(define tolerance 0.0001)
(define (fixed-point f first-guess)
  (define (enough-guess? x y) (< (abs (- x y)) tolerance))
(define (start-guess x)
     (display x)
          (newline)
  (let ((next (f x)))
     (
      if (enough-guess? next x) next
       (start-guess  next)
       
         )))
  (start-guess  first-guess))
(define (log-x x)(/ (+ (/ (log 1000) (log x)) x) 2))
(define (log-fixed-point a)
  (fixed-point log-x a))
(log-fixed-point 2)