(in-package :example)

(defun controller-show ()
  (let ((movie (movie-get 2)))
    (standard-page
      (:h2 (fmt "Details about ~A" (movie-title movie)))
      (:ul :id "details"
	   (:li (fmt "Rating: ~A" (movie-rating movie)))
	   (:li (fmt "Released on: ~A" (print-date (movie-release-date movie)))))
      (:a :href "2/edit" "Edit movie")(:br)
      (:a :href "2/delete" "Delete movie")(:br)
      (:a :href "/movies" "Back to movies list"))))