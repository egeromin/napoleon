#lang racket

(define zip
  (lambda (a b)
    (cond
      ((null? a) '())
      (else
        (cons (make-pair (car a) (car b))
              (zip (cdr a) (cdr b)))))))

(define make-pair
  (lambda (a b)
    (cons a (cons b '()))))

(define first-of
  (lambda (l) (car l)))

(define second-of
  (lambda (l) (car (cdr l))))

(provide zip make-pair first-of second-of)