(in-package :example)

(defun controller-new ()
  (standard-page
    (:h1 "Create new movie")
    (:form :action "/movies" :method "post"
	   (:label "Title")
	   (:input :name "movie-title" :size "30" :type "text")
	   (:label "Rating")
	   (:select :name "movie-rating"
		    (:option :value "G" "G")
		    (:option :value "PG" "PG"
		    (:option :value "PG-13" "PG-13")
		    (:option :value "R" "R")
		    (:option :value "NC-17" "NC-17"))))))

    

    