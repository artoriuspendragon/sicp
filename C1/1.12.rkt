#lang racket
(define (paska r n)
(cond  ((or (= n 1)(= r n)) 1)
       ((> n r)  display"wrong")
      (else (+ (paska (- r 1) (- n 1)) (paska (- r 1) n)))
  ))

(paska 3 2)