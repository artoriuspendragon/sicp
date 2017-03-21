#lang racket
(define(element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))
(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2) (cons (car set1)
                                                 (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))
(define (list->tree elements) (car (partial-tree elements (length elements))))
(define (partial-tree elts n)
  (if (= n 0)
      (cons '() elts)
      (let ((left-size (quotient (- n 1) 2)))
        (let ((left-result (partial-tree elts left-size)))
          (let ((left-tree (car left-result))
                (non-left-elts (cdr left-result))
                (right-size (- n (+ left-size 1))))
            (let((this-entry (car non-left-elts))
                 (right-result (partial-tree (cdr non-left-elts) right-size)))
              (let ((right-tree (car right-result))
                    (remaining-elts (cdr right-result)))
                (cons (make-tree this-entry left-tree right-tree) remaining-elts))))))))
(define (adjoin-set x set)
  (if (element-of-set? x set) set (cons x set)))
(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        (else (union-set (adjoin-set (car set2) set1) (cdr set2)))))
(define (tree->list tree)
  (if(null? tree)
     '()
     (append (tree->list (left-branch tree))
             (cons (entry tree) (tree->list (right-branch tree))))))
(define (entry tree) (car tree))
(define (make-tree entry left right) (list entry left right))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (element-of-tree? x set)
  (cond ((null? set) false)
        ((= x (entry set)) true)
        ((< x (entry set)) (element-of-tree? x (left-branch set)))
        ((> x (entry set)) (element-of-tree? x (right-branch set)))))
(define (adjoin-set-tree x set)
  (cond ((null? set) (make-tree x '() '()))
        ((= x (entry set)) set)
        ((< x (entry set)) (cons (adjoin-set x (left-branch set))(right-branch set)))
        ((> x (entry set)) (cons (left-branch set)(adjoin-set x (right-branch set))))))
(define (union-set-tree tree1 tree2)
  (list->tree (union-set (tree->list tree1) (tree->list tree2))))
(define (intersection-set-tree tree1 tree2)
    (list->tree(intersection-set (tree->list tree1)
                          (tree->list tree2))))
 (union-set-tree (list->tree '(1 2 3 4 5))
                             (list->tree '(1 3 5 7 9)))