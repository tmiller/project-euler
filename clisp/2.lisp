(let ((evens '(2)))
  (do* ((a 1 b) (b 2 res) (res (+ a b) (+ a b))) ((>= res 4000000))
    (when (evenp res)
      (setq evens (append evens (list res)))))
  (prin1 (apply '+ evens)))
