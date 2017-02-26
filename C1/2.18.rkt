#lang racket
(define (reverse item)
  (define (start-reverse item reversed)
  (if (null? item) reversed
      (start-reverse (cdr item) (cons (car item) reversed))
   )
  )
  (start-reverse (cdr item) (cons (car item) null))
)
(reverse(list 1 4 9 16 25))
