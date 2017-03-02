#lang racket
(define (map proc items)
  (if (null? items) null
      (cons (proc (car items)) (map proc (cdr items)))
      ))
(define (square-list-2 items)
  (if (null? items)
     null
     (cons (* (car items) (car items)) (square-list-2 (cdr items)))
      )
  )
(define (square-list items) (map (lambda(x) (* x x)) items))
(square-list (list 1 2 3 4 5))
(square-list-2 (list 1 2 3 4 5))