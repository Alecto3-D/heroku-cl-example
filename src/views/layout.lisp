(in-package :example)

(defmacro standard-page ((&key title) &body body)
  `(with-html-output-to-string (*standard-output* nil :prologue t :indent t)
     (:html :xmlns "http://www.w3.org/1999/xhtml" :xml\:lang "en" :lang "en"
	    (:head
	     (:meta :http-equiv "Content-Type" :content "text/html;charset=utf-8")
	     (:title ,title)
	     (:link :type "text/css" :rel "stylesheet" :href "static/application.css"))
	    (:body
	     (:h1 :class "title" "Rotten Potatoes!")
	     ,@body))))

(hunchentoot:define-easy-handler (hello-sbcl :uri "/") ()
  (cl-who:with-html-output-to-string (s)
    (:html
     (:head
      (:title "Heroku CL Example App"))
     (:body
      (:h1 "Heroku CL Example App")
      (:h3 "Using")
      (:ul
       (:li (format s "~A ~A" (lisp-implementation-type) (lisp-implementation-version)))
       (:li (format s "Hunchentoot ~A" hunchentoot::*hunchentoot-version*))
       (:li (format s "CL-WHO")))
      (:div
       (:a :href "static/lisp-glossy.jpg" (:img :src "static/lisp-glossy.jpg" :width 100)))
      (:div
       (:a :href "static/hello.txt" "hello"))
      (:h3 "App Database")
      (:div
       (:pre "SELECT version();"))
      (:div (format s "~A" (postmodern:with-connection (db-params)
			     (postmodern:query "select version()"))))))))
