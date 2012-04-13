(in-package :example)

(defclass movie ()
  ((id :col-type serial :initarg :id)
   (title :col-type string :initarg :title :reader movie-title)
   (rating :col-type string :initarg :rating :accessor movie-rating)
   (release-date :col-type date :initarg :release-date :accessor movie-release-date))
  (:metaclass dao-class)
  (:keys id))

(defun movie-init-table ()
  "Creates table if it doesn't exist already."
  (with-connection (db-params)
    (when (table-exists-p 'movie)
      (query "DROP TABLE movie"))
    (execute (dao-table-definition 'movie))))

;; Create

(defmacro movie-create (&rest args)
  `(with-connection (db-params)
     (make-dao 'movie ,@args)))

;; Read

(defun movie-get-all ()
  (with-connection (db-params)
    (select-dao 'movie)))

(defun movie-get (id)
  (with-connection (db-params)
    (get-dao 'movie id)))

(defmacro movie-select (test &optional sort)
  `(with-connection (db-params)
     (select-dao 'movie ,test ,sort)))

;; Update

(defun movie-update (movie)
  (with-connection (db-params)
    (update-dao movie)))

;; Delete

(defun movie-delete (movie)
  (with-connection (db-params)
    (delete-dao movie)))
  