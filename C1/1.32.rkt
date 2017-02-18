#lang racket
(define (accumulate combiner null-value f a b next)
  (if (> a b) null-value
     (combiner (f a) (accumulate combiner null-value f (next a) b next)
  )
     ))

(define (factorial-pi b)
  (define (func x) (/ (* (- x 1.0) (+ x 1.0)) (* x x)) )
   (define (next x) (+ x 2))
  (* 4 (accumulate * 1 func 3 b next ))
  )
(factorial-pi 300000)