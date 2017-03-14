#lang racket
(list 'a 'b 'c)
(list (list 'george))
'((x1 x2) (y1 y2))
(cdr '((x1 x2) (y1 y2)))
(cadr '( (x1 x2) (y1 y2)))
 (pair? (car '(a short list)))
(memq 'red '((red shoes) (blue socks)))
(memq 'red '(red shoes blue socks))