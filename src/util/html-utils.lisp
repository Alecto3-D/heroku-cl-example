(in-package :example)

(defun print-date (date)
  (multiple-value-bind (year month day) (decode-date date)
    (with-output-to-string (s)
      (format s "~4,'0d-~2,'0d-~2,'0d" year month day))))

(defun movies-path (movie)
  "Given a <Movie>, return the RESTful URI -- e.g. 'movies/3'"
  (concatenate 'string "movies/" (write-to-string (movie-id movie))))

(defun all-movie-rows ()
  (dolist (movie (movie-get-all))
    (htm
     (:tr
      (:td (fmt "~a" (movie-title movie)))
      (:td (fmt "~a" (movie-rating movie)))
      (:td (fmt "~a" (print-date (movie-release-date movie))))
      (:td (:a :href (movies-path movie)
	       (fmt "More info about ~A" (movie-title movie))))))))

(def-internal-macro selector-form (name options)
  `(:select :name ,name
	    ,@(mapcar
	       #'(lambda (x) `(:option :value ,x ,(mkstr x)))
	       (eval options))))

(defun mkstr (obj)
  (if (stringp obj) obj
      (write-to-string obj)))

(defun num-list (x y)
  (if (< y x)
      (loop for i from x downto y collect i)
      (loop for i from x upto y collect i)))