#lang racket
(define (flatmap proc seq)
  (accumulate append null (map proc seq)))
(define (accumulate op initial sequence)
  (if (null? sequence) initial
      (op (car sequence) (accumulate op initial (cdr sequence)))))
(define (enumerate-interval low high)
  (if (> low high) null
      (cons low (enumerate-interval (+ low 1) high))))
(define (make-pair-sum pair) (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))
(define (equal-sum? pair) 1)
(define (prime-list n s)
  (map make-pair-sum(filter equal-sum? (flatmap (lambda (i) (map (lambda (j) (list i j)) (enumerate-interval 1 (- i 1)))) (enumerate-interval 1 n)))))
(define (make-ijk n)
  (
   flatmap (lambda (pair) (map (lambda (x) (append (list x) pair)) (enumerate-interval 1 (- (cadr pair) 1)))) (flatmap (lambda(i) (map (lambda (j) (list i j )) (enumerate-interval 1 (- i 1)))) (enumerate-interval 1 n)  ))
)
(define (find-s n s)
  (filter (lambda (sub-list) ( = (+ (car sub-list) (cadr sub-list) (cadr (cdr sub-list))) s)) (make-ijk n)))
(find-s 6 10 )