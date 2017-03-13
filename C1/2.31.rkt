#lang racket
(define (square-tree tree)
  (tree-map (lambda (x) (* x x)) tree))
(define (tree-map proc sub-tree)
  (cond ((null? sub-tree) null)
        ((not (pair? sub-tree)) (proc sub-tree))
        (else (cons (tree-map proc (car sub-tree)) (tree-map proc (cdr sub-tree))))
        ))
(square-tree (list 1 (list 2 (list 3 4) 5)(list 6 7)))