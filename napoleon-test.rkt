#lang racket/base

(require rackunit
         "napoleon.rkt")

(define napoleon-tests
  (test-suite
  "Napoleon tests"

  (check-equal?
    (is-markdown? "/some/path/to/a/file.md") #t
  "returns true for paths ending in .md")

  (check-equal?
    (is-markdown? "/some/path/to/a/file.txt") #f
  "returns false for paths not ending in .md")
  )
)

(require rackunit/text-ui)
 
(run-tests napoleon-tests)