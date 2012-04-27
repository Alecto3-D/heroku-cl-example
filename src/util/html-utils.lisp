(in-package :example)

(defun get-id-from-uri ()
  "Returns the ID from the URI request."
  (car (cl-ppcre:all-matches-as-strings "[0-9]+" (request-uri *request*))))

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