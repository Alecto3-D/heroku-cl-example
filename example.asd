(in-package :asdf)

(defsystem :example
    :name "example"
    :description "Example cl-heroku application"
    :depends-on (:hunchentoot)
    :components
    ((:static-file "example.asd")
     (:module :src
	      :serial t      
	      :components
	      ((:file "hello-world"))
	      )))

