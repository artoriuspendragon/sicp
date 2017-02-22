#lang racket
(define (double x) (+ x x))
(define (halve x)  (/ x 2))
(define (even? x)  (= (remainder x 2)0))
(define (fast-expt-first b n a)
  (cond ((= n 0)1)
         ((= n 1)(* b a))
         ((even? n) (fast-expt-first (* b b) (/ n 2) a))
         (else (fast-expt-first b (- n 1) (* a b))
         )))
(define (fast-expt b n) (fast-expt-first b n 1))

(define tolerance 0.0000001)
(define (fixed-point f first-guess)
  (define (enough-guess? x y) (< (abs (- x y)) tolerance))
(define (start-guess x)
     (display x)
          (newline)
  (let ((next (f x)))
     (
      if (enough-guess? next x) next
       (start-guess  next)
       
         )))
  (start-guess  first-guess))
(define (repeated f g)
  (define (start-repeat func pfunc times)
  (if(< times 2) pfunc
     (start-repeat f (lambda (x)(f (pfunc x))) (- times 1))))
  (start-repeat f f g)

  )
(define (average-damp f) (lambda (x) (/ (+ x (f x)) 2)))


(define (root x ) (fixed-point (average-damp (lambda (y) (/   x  y ))) 50))
(define (try-damping x n damp-times)
  (
   fixed-point ((repeated average-damp damp-times)(lambda (y) (/ x (fast-expt y (- n 1))))) 50
               ))
  
(try-damping 27.0 3 1)
;when damp-times=1  power=1,2,3 is available
; damp-times=2  power= 4,5,6,7,8
;damp-tims=3 power=9,10....
;so i guess power < (2 ^ damp-times)
