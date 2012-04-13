(in-package :example)

(defun print-date (date)
  (multiple-value-bind (year month day) (decode-date date)
    (with-output-to-string (s)
      (format s "~4,'0d-~2,'0d-~2,'0d" year month day))))

(def-internal-macro all-movie-rows ()
  (let ((who-code '(:tbody)))
    (with-connection (db-params)
      (doquery (:select 'title 'rating 'release_date :from 'movie) (title rating date)
	(push `(:tr
		(:td ,title)
		(:td ,rating)
		(:td ,(print-date date))
		(:td (:a :href "movies/temp" (fmt "More info about ~A" ,title))))
		who-code)))
    (nreverse who-code)))

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