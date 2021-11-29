#|
Fi||rst Racket Homework

Rodrigo Benavente García
21/08/21
|#

#lang racket

(define (is-triangle a b c);We recieve three sides
  (cond
    [(or (<= a 0) (<= b 0) (<= c 0) ) #f];We check if at least one lenght is less or equal to 0
    [(and
      (> (+ a b) c);first condition
      (> (+ b c) a);second condition
      (> (+ c a) b);third condition
      ) #t];We check all the other conditions to see if it's a triangle
    [else #f]
   )
);end of my first exercise

(define (triangle-type a b c);second exercise, we recieve three sides
  (cond ;This condition helps me check if the sides belong to a triangle
    [(is-triangle a b c);Runs function to check if it's a triangle
     (cond
       [(= a b c)'EQUILATERAL];Checks if it's an equilateral triangle
       [(or (= a b) (= b c) (= c a)) 'ISOSCELES];Checks if it's an isosceles triangle
       [else 'SCALENE];Checks if it's a scalene triangle
      );End of my second condition
    ]
    [else 'INVALID];Sides don't belong to a triangle
   );End of my condition 
);end of my second exercise

(define (point-quadrant x y);Third exercise, we recieve the coordinates of a point in 2d
    (if (and (> x 0) (> y 0)); Checks if x and y belong to the first quadrant 
        'I
        (if (and (< x 0) (> y 0));Checks if x and y are in the second quadrant
        'II
        (if (and (< x 0) (< y 0));Checks if x and y are in the third quadrant
         'III
        (if (and (> x 0) (< y 0));Checks if x and y are in the fourth quadrant
         'IV
         (if (and (> x 0) (= y 0));Checks if x and y are in the x axis
          'X_AXIS
          (if (and (> y 0) (= x 0));Checks if x and y are in the y axis
           'Y_AXIS
           'ORIGIN
           );End of 6th if
          ); End of 5th if
          );End of 4th if
         );End of third if
        );End of second if 
    )
);End of my third exercise

(define (parking-ticket hours minutes status);Fourth exercise, we recieve #hours #mins and the status of the ticket
  (cond ;Cond to check the status of the ticket
    [(equal? status 'LOST) 100];If the user lost the ticket then we charge 100
    [(equal? status 'STAMPED)
     (cond ;Condition created to see how much to charge if the ticket is stampted
       [(and (= hours 0) (= minutes 0) ) 0];Charge 0 if the car didn't park there
       [(or (and (<= hours 2)(< minutes 1)) (< hours 2)) 5];If the ticket is stampted and is parked for less than 2 hours
       [(or (and (= hours 2)(> minutes 1)) (and (<= hours 3)(< minutes 1))) (+ 5 12)];Less than 3 hours and 2 hours with a fraction
       [(and (>= hours 3) (< minutes 1)) (+ (* (- hours 2) 12) 5 )];There are 3 or more hours and no minutes
       [(and (>= hours 3) (and (>= minutes 1) (<= minutes 15))) (+ (* (- hours 2) 12) 5 5)];There are 3 or more hours and less or 15 mins
       [(and (>= hours 3) (and (>= minutes 1) (<= minutes 30))) (+ (* (- hours 2) 12) 5 5 3)];There are 3 or more hours and less or 30 mins and more than 15 mins
       [(and (>= hours 3) (and (>= minutes 1) (<= minutes 45))) (+ (* (- hours 2) 12) 5 5 3 2)];There are 3 or more hours and less or 45 mins and more than 30 mins
       [(and (>= hours 3) (and (>= minutes 1) (<= minutes 59))) (+ (* (- hours 2) 12) 5 5 3 2 2)];There are 3 or more hours and less or 60 mins and more than 45 mins
       )];End of STAMPTED status

    [(equal? status 'UNSTAMPED)
     (cond ;Condition created to see how much to charge if the ticket is unstampted
       [(and (= hours 0) (= minutes 0) ) 12];Charge 12 because the ticket is unstamped
       [ (or (and (<= hours 1)(< minutes 1)) (and (= hours 0)(> minutes 1)))  12];Charge 12 for an hour or less
       [(and (>= hours 1) (< minutes 1)) (+ (* hours 12))];There are 1 or more hours and no minutes
       [(and (>= hours 1) (and (>= minutes 1) (<= minutes 15))) (+ (* hours 12) 5)];There are 1 or more hours and less or 15 mins
       [(and (>= hours 1) (and (>= minutes 1) (<= minutes 30))) (+ (* hours 12) 5 3)];There are 1 or more hours and less or 30 mins
       [(and (>= hours 1) (and (>= minutes 1) (<= minutes 45))) (+ (* hours 12) 5 3 2)];There are 1 or more hours and less or 45 mins
       [(and (>= hours 1) (and (>= minutes 1) (<= minutes 59))) (+ (* hours 12) 5 3 2 2)];There are 1 or more hours and less or 60 mins
       )];End of UNSTAMPTED status
   )
);End of my fourth exercise