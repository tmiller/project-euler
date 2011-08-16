(let ((total 0))
     (dotimes (n 1001)
              (when (or (= 0 (rem n 5))
                        (= 0 (rem n 3)))
                    (setq total (+ total n))))
     (prin1 total))

