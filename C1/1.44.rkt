#lang racket
(define (repeated f g)
  (define (start-repeat func pfunc times)
  (if(< times 2) pfunc
     (start-repeat f (lambda (x)(f (pfunc x))) (- times 1))))
  (start-repeat f f g)

  )

(define (smooth f)
   (define dx 0.000001)
  (lambda (a)
    (/ (+ (f (+ a dx)) (f a) (f (- a dx))) 3 ))
  )

(((repeated smooth 10) (lambda (x) (* x x))) 100  )