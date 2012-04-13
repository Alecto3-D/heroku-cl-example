(asdf:defsystem #:example
  :serial t
  :description "Example cl-heroku application"
  :depends-on (#:hunchentoot
	       #:cl-who
	       #:postmodern
	       #:simple-date)
  :components ((:file "package")
	       (:module :src
			:serial t      
			:components
			((:file "util/heroku-utils")
			 (:file "util/html-macros")
			 (:module :views
				  :serial t
				  :components ((:file "layout")
					       (:file "index")
					       (:file "new")))
			 (:file "model")
			 (:file "controllers")))))

