#lang racket

(define make-pair
  (lambda (a b)
    (cons a (cons b '()))))


(define zip
  (lambda (a b)
    (cond
      ((null? a) '())
      (else
        (cons (make-pair (car a) (car b))
              (zip (cdr a) (cdr b)))))))


(define main
  (lambda () 
    (let ([posts-directory (read-command-line)])
      (let (
            [titles (titles-from-directory posts-directory)]
            [paths (post-files-from-directory posts-directory)])
        (toc-from-titles (zip titles paths))
))))

(define titles-from-directory
  (lambda (posts-directory)
      (let ([post-files (post-files-from-directory posts-directory)])
        (map title-from-post post-files)
  ))
)

(define read-command-line
  (lambda ()
    (let ([wd (current-command-line-arguments)])
      (if (eq? (vector-length wd) 1)
        (car (vector->list wd))
        (error "zut alors")
))))

(define post-files-from-directory
  (lambda (posts-directory)
    (let ([markdown-list (directory-list posts-directory)])
      (filter is-markdown? markdown-list)
)))

(define is-markdown?
  (lambda (filepath)
    (path-has-extension? filepath ".md")
))

(define title-from-post
  (lambda (path)
    (let ([line (first-line-from-post path)])
      (if (regexp-match #rx"^#" line)
        (string-trim (regexp-replace #rx"#" line ""))
        (error 
          (printf "No title in file ~v!" (path->string path)
))))))

(define first-line-from-post
  (lambda (path)
    (let ([fh (open-input-file path)])
      (read-line fh 'any)
)))


(define first-of
  (lambda (l) (car l)))

(define second-of
  (lambda (l) (car (cdr l))))


(define list-item-from-title-path
  (lambda (title-path)
    (let ([title (first-of title-path)]
          [path (second-of title-path)])
        (format "* [~a](~a)" title path))))


(define list-items-from-titles
  (lambda (titles)
  (string-join 
    (map list-item-from-title-path
        titles)
    "\n"))
)


(define toc-from-titles 
  (lambda (titles)
    (string-append
      (string-append "## Blog Posts\n\n"
                   (list-items-from-titles titles))
      "\n")))




(display (main))
