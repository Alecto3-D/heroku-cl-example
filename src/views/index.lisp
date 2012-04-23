(in-package :example)

(defun controller-index ()
  (standard-page
    (:h1 "All Movies")
    (:table :id "movies"
     (:thead
      (:tr
       (:th "Movie title")
       (:th "Rating")
       (:th "Release Date")
       (:th "More info")))
     (:tbody
      (dolist (movie (movie-get-all))
	(htm
	 (:tr
	  (:td (fmt "~a" (movie-title movie)))
	  (:td (fmt "~a" (movie-rating movie)))
	  (:td (fmt "~a" (print-date (movie-release-date movie))))
	  (:td (:a :href (concatenate 'string "movies/" (write-to-string (movie-id movie)))
		   (fmt "More info about ~A" (movie-title movie)))))))))
    (:a :href "movies/new/" "Add new movie")))
      