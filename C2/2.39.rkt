#lang racket
(define (accumulate op initial sequence)
  (if (null? sequence) initial
      (op (car sequence) (accumulate op initial (cdr sequence)))))
(define (fold-left op initial sequence) (define (iter result rest) (if (null? rest) result (iter (op result (car rest)) (cdr rest)))) (iter initial sequence))
(define (reverse sequence)
  (accumulate (lambda (x y) (append y (list x))) null sequence))
(define (reverse-2 sequence)
  (fold-left (lambda (x y) (cons y x)) null sequence))
(reverse (list 1 2 3))
(reverse-2 (list 1 2 3))