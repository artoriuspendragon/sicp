#lang racket
(define tolerance 0.00000001)
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
  (define dx 0.000000001)
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





(define (cubic a b c)
  (lambda (x) (+ (*　x x x) (* x x a) (* b x) c　)))

((cubic 2 2 2) (newtons-method (cubic 2 2 2) 10))