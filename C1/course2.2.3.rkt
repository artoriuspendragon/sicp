#lang racket
(define (square n)(* n n))
(define (quick-smallest-divisor n)(quick-find-divisor n 2))
(define (divides? a b)(= (remainder a b) 0))
(define (quick-find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? n test-divisor) test-divisor)
        (else (quick-find-divisor n (next test-divisor)))
   ))
(define (prime? n) (= n (quick-smallest-divisor n)))
(define (next n)
(cond ((= n 2) 3)
      (else (+ n 2)))
  )



(define (accumulate op initial sequence)
  (if (null? sequence) initial
      (op (car sequence) (accumulate op initial (cdr sequence)))))

(define (enumerate-interval low high)
  (if (> low high) null
      (cons low (enumerate-interval (+ low 1) high))))
(define (make-first n)
(map (lambda (i) (map (lambda (j) (list i j)) (enumerate-interval 1 (- i 1)))) (enumerate-interval 1 n))
  )
(define (flatmap proc seq)
  (accumulate append null (map proc seq)))
(define (prime-sum? pair) (prime? (+ (car pair) (cadr pair))))
(define (make-pair-sum pair) (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))
(define (prime-list n)
  (map make-pair-sum(filter prime-sum?(flatmap (lambda (i) (map (lambda (j) (list i j)) (enumerate-interval 1 (- i 1)))) (enumerate-interval 1 n)))))
(prime-list 6)