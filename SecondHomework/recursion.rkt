#|

First examples of recursion

Rodrigo Benavente
27-08-21


|#

#lang racket

; allow debugginf the functions
(require racket/trace)

;(define (factorial n)
  ;(if (= n 0) 1 (*(factorial(- n 1))n)))

; regular recursion

(define (factorial n)
  (if (zero? n)
      1
      (* n (factorial (sub1 n)))))

; tail recursion

(define (fact n )
  (define (fact-tail n a)
    (if (zero? n)
        a
        (fact-tail (sub1 n) (* n a))))
(fact-tail n 1))


; tail recursion using named let

(define (! n)
  (trace-let loop
    ([n n] [a 1])
    (if (zero? n)
        a
        (loop (sub1 n) (* n a)))))

; invert digits

(define (invert-digits number)
  (let loop
    ([n number] [result 0])
    (if (zero? n)
        result
        (loop (quotient n 10) (+ (* result 10) (remainder n 10)))
        )
    )
  )

(define (interest money yearly-interest)
  (let loop
    ([money money] [monthly-interest (/ yearly-interest 12 100.0)] [month 1])
    (if (> month 12)
        money
        (loop (+ money (* money monthly-interest)) monthly-interest (+ month 1)))))