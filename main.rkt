#lang racket

(require "napoleon.rkt"
         "utils.rkt")

(define main
  (lambda () 
    (let ([posts-directory (read-command-line)])
      (let (
            [titles (titles-from-directory posts-directory)]
            [paths (post-files-from-directory posts-directory)])
        (toc-from-titles (zip titles paths))
))))
