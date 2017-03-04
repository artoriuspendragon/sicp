#lang racket
(define (append list1 list2)
  (if (null? list1) list2
       (cons (car list1) (append (cdr list1) list2))
      ))
(define (fringe items)
  (cond   
    ((not (pair? items) ) (list items))
    (else (append (fringe (car items)) (fringe (cadr items))))
    ))
(define x (list (list 1 2) (list 3 4)))
(fringe  (list x x))
