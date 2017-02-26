#lang racket
(define (repeated f g)
  (define (start-repeat func pfunc times)
  (if(< times 2) pfunc
     (start-repeat f (lambda (x)(f (pfunc x))) (- times 1))))
  (start-repeat f f g)

  )
(define (square x) (* x x))
(define (inc x) (+ x 1))
((repeated square 2) 5)