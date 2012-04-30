(in-package :example)

(defun symb (a b)
  (intern (format nil "~a-~a" (symbol-name a) (symbol-name b))))

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

;; Simple date utils
;; -----------------
(defmacro with-date (date &body body)
  "Decodes date and binds to year, month and day variables."
  `(multiple-value-bind (year month day) (decode-date ,date)
     ,@body))    

(defun print-date (date)
  "Given a date (postmodern style) decode and return a string"
  (with-date date
    (with-output-to-string (s)
      (format s "~4,'0d-~2,'0d-~2,'0d" year month day))))

(defmacro def-date-getter (element)
  `(defun ,(symb 'get element) (date)
     ,(conc "Given a date object, return the " (string element))
     (with-date date
       ,element)))

(def-date-getter day)
(def-date-getter month
(def-date-getter year)

;; -------------
