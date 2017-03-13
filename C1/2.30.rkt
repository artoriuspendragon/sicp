#lang racket
(define (map proc items)
  (
   if(null? items) null
     (cons (proc (car items)) (map proc (cdr items))))
)



(define (square-tree sub-tree)
(
 cond ((null? sub-tree) null)
      ((not (pair? sub-tree)) (* sub-tree sub-tree))
      (else (cons (square-tree (car sub-tree))
                  (square-tree (cdr sub-tree))))
 )
)
(define (map-square-tree sub-tree)
   (map  (lambda (tree)
        (if  (pair? tree)(map-square-tree tree)
             (*  tree tree)  
           ))sub-tree)
  )
(map-square-tree (list 1 (list 2 (list 3 4) 5)(list 6 7)))