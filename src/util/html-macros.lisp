(in-package :example)

(defun print-date (date)
  (multiple-value-bind (year month day) (decode-date date)
    (with-output-to-string (s)
      (format s "~4,'0d-~2,'0d-~2,'0d" year month day))))

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