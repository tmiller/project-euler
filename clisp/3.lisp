(defparameter *limit* 105000)
(defparameter *primes* (make-hash-table))

(do ((x 1 (1+ x)))
    ((> x (sqrt *limit*)))
  (do ((y 1 (1+ y)))
      ((> y (sqrt *limit*)))
      (let ((n (+ (* 4 (expt x 2)) (expt y 2)))
            (m (+ (* 3 (expt x 2)) (expt y 2)))
            (o (- (* 3 (expt x 2)) (expt y 2))))
           (flet ((check-rem-equalp (remainder numerator) (= remainder (rem numerator 12))))
                 (when (and (<= n *limit*)
                            (or (check-rem-equalp 1 n)
                                (check-rem-equalp 5 n)))
                       (setf (gethash n *primes*) (not (gethash n *primes*))))
                 (when (and (<= m *limit*)
                            (check-rem-equalp 7 m))
                       (setf (gethash m *primes*) (not (gethash m *primes*))))
                 (when (and (> x y)
                            (<= o *limit*)
                            (check-rem-equalp 11 o))
                       (setf (gethash o *primes*) (not (gethash o *primes*))))))))

(setf (gethash 2 *primes*) t)
(setf (gethash 3 *primes*) t)

 (do ((n 5 (1+ n)))
     ((> n (sqrt *limit*)))
     (when (gethash n *primes*)
           (do* ((coefficient 1 (1+ coefficient))
                 (k (* coefficient (expt n 2)) (* coefficient (expt n 2))))
                ((> k *limit*))
                (setf (gethash k *primes*) nil))))

(do ((x 1 (1+ x))
     (count 1))
    ((> x 10000))
    (when (gethash x *primes*)
          (princ x) (princ " ") (princ count) (princ " ") (setq count (1+ count))))
