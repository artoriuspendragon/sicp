#lang racket
(define tolerance 0.00001)
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


(define (deriv g)
  (define dx 0.00001)
  (lambda(x)
    (/(-(g(+ x dx)) (g x)) dx)))
(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))
   )
  )
(define  (newtons-method g guess)
  (fixed-point (newton-transform g) guess)
  )
(define (sqrt x)
  (newtons-method (lambda(y)(- (* y y) x)) 1.0)
  )
(sqrt 25)