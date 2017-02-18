#lang racket
(define (product-iterate f a b next result)
  (if (> a b) result
     (product-iterate f (next a) b next (* (f a) result))
     ))
(define (product-recursive f a b next)
  (if (> a b) 1
     (* (f a) (product-recursive f (next a) b next)
  )
     ))
(define (factorial-pi b)
  (define (func x) (/ (* (- x 1.0) (+ x 1.0)) (* x x)) )
   (define (next x) (+ x 2))
  (* 4 (product-iterate func 3 b next 1))
  )
(factorial-pi 30000)