(in-package :example)

(defun controller-new ()
  (standard-page
    (:h1 "Create new movie")
    (:form :action "/movies" :method "post"
	   (:p "Title")
	   (:input :name "movie-title" :size "30" :type "text")
	   (:p "Rating")
	   (:select :name "movie-rating"
		    (:option :value "G")
		    (:option :value "PG")
		    (:option :value "PG-13")
		    (:option :value "R")
		    (:option :value "NC-17")))))

    

    