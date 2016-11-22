#lang racket
(define (fdg x)
 (cond ((< x 3) x)
       (else
        (+  (fdg(- x 1))   (* (fdg(- x 2)) 2)   (* ( fdg(- x 3)) 3)   )
        )
       ) 
       )

(define (fdd x y z n s)
        (cond ((< s 3) s)
              ((= (+ n 1) s) (+ x (* y 2) (* z 3)))
              (else (fdd (+ x (* y 2) (* z 3)) x  y (+ n 1) s))
              )
   )
(define (fdds s) (fdd 2 1 0 2 s))
(fdds 5)