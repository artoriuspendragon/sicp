#lang racket
(define (double g)
  (lambda (x) (g(g x)))
  )
(define (inc i) (+ i 1))
(((double (double double)) inc) 5)