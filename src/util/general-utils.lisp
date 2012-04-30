(in-package :example)

(defun print-date (date)
  "Given a date (postmodern style) decode and return a string"
  (multiple-value-bind (year month day) (decode-date date)
    (with-output-to-string (s)
      (format s "~4,'0d-~2,'0d-~2,'0d" year month day))))

(defun mkstr (obj)
  (if (stringp obj) obj
      (write-to-string obj)))

(defun num-list (x y)
  (if (< y x)
      (loop for i from x downto y collect i)
      (loop for i from x upto y collect i)))

(defun drop-table (name)
  "Drops the table completely, deletes all entries. Use only when redefining models completely."
  (with-connection (db-params)
    (query (conc "DROP TABLE " name))))