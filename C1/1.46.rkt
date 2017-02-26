#lang racket
(define (iterative-improve good-enough? improve)
  (define (iterative-improve-start x )
   (if(good-enough? x) x
      (iterative-improve-start (improve x) )
    ))
 (lambda (x)
   (iterative-improve-start x )
   )
)
(define (sqrt x)
 (define (good-enough? guess) ( < (abs (- (* guess guess) x)) 0.0001))
  (define (improve guess) (/ (+ guess (/ x guess)) 2))
  ((iterative-improve good-enough? improve)  13.0 )
  )
(define (fixed-point f guess)
 (define (good-enough? x) ( < (abs (- x (f x))) 0.000001))
 (define (improve guess) (f guess))
  ((iterative-improve good-enough? improve) guess)

  )
(sqrt 64.0)
(fixed-point (lambda (x) (+ 1 (/ 1 x))) 4.0)