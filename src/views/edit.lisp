(in-package :example)

(defun controller-edit ()
  (let ((movie (movie-get 2)))
    (standard-page
    (:h1 "Edit Existing Movie")
    (:form :action "/movies/2/update" :method "post"
	   (:label "Title")
	   (:input :name "movie-title" :size "30" :type "text" :value (movie-title movie))
	   (:label "Rating")
	   (selector-form "movie-rating" '("G" "PG" "PG-13" "R" "NC-17"))
	   (:label "Released on")
	   (selector-form "year" (num-list 2012 1930))
	   (selector-form "month" (num-list 1 12))
	   (selector-form "day" (num-list 1 31))	  
	   (:input :name "commit" :type "submit" :value "Update Movie Info")))))