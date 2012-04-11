(in-package :example)

(defclass movie ()
  ((title :col-type string :initarg :title :reader movie-title)
   (rating :col-type string :initarg :rating :accessor movie-rating)
   (release-date :col-type date :initarg :release-date :accessor movie-release-date))
  (:metaclass dao-class)
  (:keys title))

(defun init-table (type)
  "Creates table if it doesn't exist already. Expects symbol."
  (with-connection (db-params)
    (unless (table-exists-p type)
      (dao-table-definition type))))