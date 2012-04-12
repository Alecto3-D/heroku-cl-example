(in-package :example)

(defun controller-new ()
  (eval `(standard-page
	   (:h1 "Create new movie")
	   (:form :action "/movies" :method "post"
		  (:label "Title")
		  (:input :name "movie-title" :size "30" :type "text")
		  (:label "Rating")
		  ,(selector-form "movie-rating"
				  (list "G" "PG" "PG-13" "R" "NC-17"))
		  (:label "Released on")
		  (:input :name "movie-date" :size "30" :type "date")
		  (:input :name "commit" :type "submit" :value "Save Changes")))))


	   ;; (:select :name "movie-rating"
	   ;; 	    (:option :value "G" "G")
	   ;; 	    (:option :value "PG" "PG"
	   ;; 	    (:option :value "PG-13" "PG-13")
	   ;; 	    (:option :value "R" "R")
	   ;; 	    (:option :value "NC-17" "NC-17"))))))

    

    