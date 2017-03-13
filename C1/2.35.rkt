#lang racket
(define (map proc items)
  (
   if(null? items) null
     (cons (proc (car items)) (map proc (cdr items))))
)
(define (accumulate op initial sequence)
  (if (null? sequence) initial
      (op (car sequence) (accumulate op initial (cdr sequence)))))
(define (count-leaves t)
  (accumulate + 0 (map (lambda (tree) (cond ((not (pair? tree)) 1)
                                             (else  (count-leaves tree) )
                                        )) t)))
(count-leaves (list 1 2(list 3 4) (list 5 6)))