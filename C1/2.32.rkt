#lang racket
(define (map proc items)
  (
   if(null? items) null
     (cons (proc (car items)) (map proc (cdr items))))
)
(define (subsets s)
  (if (null? s) (list null)
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda(x)
                           (cons (car s) x))
                         rest)
   ))))
(subsets (list 1  2 3 ))


