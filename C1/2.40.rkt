#lang racket
(define (flatmap proc seq)
  (accumulate append null (map proc seq)))
(define (accumulate op initial sequence)
  (if (null? sequence) initial
      (op (car sequence) (accumulate op initial (cdr sequence)))))
(define (enumerate-interval low high)
  (if (> low high) null
      (cons low (enumerate-interval (+ low 1) high))))
(define (unique-pairs n)
  (flatmap (lambda (x) (map (lambda (y) (list x y)) (enumerate-interval 1 (- x 1))))(enumerate-interval 1 n)))
(unique-pairs 6)