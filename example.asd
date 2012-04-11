(asdf:defsystem #:example
  :serial t
  :description "Example cl-heroku application"
  :depends-on (#:hunchentoot
	       #:cl-who
	       #:postmodern)
  :components ((:file "package")
	       (:module :src
			:serial t      
			:components
			((:file "util/heroku-utils")
			 (:module :views
				  :serial t
				  :components ((:file "layout")
					       (:file "index")
					       (:file "new")))
			 (:file "controllers")))))

