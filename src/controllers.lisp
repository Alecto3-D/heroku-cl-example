(in-package :example)

(setq *dispatch-table*
      (list
       (create-regex-dispatcher "(^/movies$|^/$)" 'controller-index)
       (create-regex-dispatcher "^/movies/new" 'controller-new)
       (create-regex-dispatcher "^/add-movie" 'controller-add-movie)
       (create-static-file-dispatcher-and-handler "/site.css" "static/application.css")))

(defun controller-add-movie ()
  "Form processer for adding new movie."
  (let ((title (parameter "movie-title"))
	(rating (parameter "movie-rating"))
	(date (parameter "movie-date")))
    (with-connection (db-params)
      (make-dao 'movie :title title :rating rating :release-date date)))
  (redirect "/movies"))