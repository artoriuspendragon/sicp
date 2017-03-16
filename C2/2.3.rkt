#lang racket
(define (average x y) (/ (+ x y) 2))



(define (make-point x y)
  (cons  x y)
  )
(define (x-point x) (car x))
(define (y-point y) (cdr y))
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")")
  )
(define (equal-point? x y)
 (and (= (x-point x) (x-point y)) (= (y-point x) (y-point y)))
  )
;(equal-point? (make-point 10 5) (make-point 10 5))
(define (make-segment a b)
  (if (equal-point? a b) (display "this two points are the same!")
      (cons a b)
      )
  )
(define (start-segment x)
  (car x))
(define (end-segment x)
  (cdr x))
(define (midpoint-segment x)
  (
   make-point (average (car(car x)) (car(cdr x))) (average (cdr (car x)) (cdr (cdr x)))
   )
  )











(define (get-rectangle-perimeter height width)
   (* 2 (+ height width))
  )
(define (get-rectangle-area height width)
  (* height width)
  )
;point
(define (make-rectangle-by-point x y)
  (cons x y)
  )
(define (get-rectangle-firstpoint x) 
  (car x))
(define (get-rectangle-lastpoint x) 
  (cdr x))
(define (get-rectangle-width-by-point r)
  (abs (- (x-point(get-rectangle-firstpoint r)) (x-point(get-rectangle-lastpoint r))))
  )
(define (get-rectangle-height-by-point r)
  (abs (- (y-point(get-rectangle-firstpoint r)) (y-point(get-rectangle-lastpoint r))))
  )
(define (get-rectangle-perimeter-by-point r)
   (get-rectangle-perimeter (get-rectangle-height-by-point r) (get-rectangle-width-by-point r))
     )
(define (get-rectangle-area-by-point r)
  (get-rectangle-area (get-rectangle-height-by-point r) (get-rectangle-width-by-point r))
  )
;point

;segment
(define (make-rectangle-by-segment height width)
   (cons height width)
  )
(define (get-rectangle-height-by-segment r)
  (abs (- (y-point (start-segment (car r))) (y-point (end-segment (car r)))))
  )
(define (get-rectangle-width-by-segment r)
  (abs (- (x-point (start-segment (cdr r))) (x-point (end-segment (cdr r)))))
  )
(define (get-rectangle-perimeter-by-segment r)
   (get-rectangle-perimeter (get-rectangle-height-by-segment r) (get-rectangle-width-by-segment r))
     )
(define (get-rectangle-area-by-segment r)
  (get-rectangle-area (get-rectangle-height-by-segment r) (get-rectangle-width-by-segment r))
  )

(get-rectangle-area-by-point (make-rectangle-by-point (make-point 0 0) (make-point 10 10)))
(get-rectangle-area-by-segment (make-rectangle-by-segment (make-segment (make-point 0 0) (make-point 0 10)) (make-segment (make-point 0 0) (make-point 10 0))))