#lang racket/base

(require rackunit
         "napoleon.rkt")

(define utils-tests
  (test-suite
  "Tests for napoleon utilities"

  (check-equal? 
    (zip '(1 2 3) '("a" "b" "c")) '((1 "a") (2 "b") (3 "c"))
  "Zipping lists into pairs")

  (check-equal? 
    (make-pair "first" "second") '("first" "second")
  "Creating pairs")

  (check-equal?
    (first-of '("first" "second")) "first"
  "Getting the first of a pair")

  (check-equal?
    (second-of '("first" "second")) "second"
  "Getting the second of a pair")
))

(require rackunit/text-ui)
 
(run-tests utils-tests)
