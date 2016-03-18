#lang racket

(define (string-strip-last n path)
    (substring path 0 (- (string-length path) n)))

(for ([path (in-directory)]
      #:when (regexp-match? #rx"[.]rkt$" path))
  (printf "compiling: ~a\n" path)
  (let ([file-name (string-strip-last 4 (path->string path))] [path-name (path->string path)])
    (let ([command (string-join `("/usr/local/bin/raco exe -l " ,path-name ";/bin/mv " ,file-name " /usr/local/racket/bin/" ,file-name) "")])
      (system command))))
