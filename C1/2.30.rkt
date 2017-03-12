#lang racket
(define (square-tree sub-tree)
(
 cond ((null? sub-tree) null)
      ((not (pair? sub-tree)) (* sub-tree sub-tree))
      (else (cons (square-tree (car sub-tree))
                  (square-tree (cdr sub-tree))))
 )
)
(square-tree (list 1 (list 2 (list 3 4) 5)(list 6 7)))