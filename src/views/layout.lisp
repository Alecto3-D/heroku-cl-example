(in-package :example)

(defmacro standard-page (&body body)
  `(with-html-output-to-string (*standard-output* nil :prologue t :indent t)
     (:html :xmlns "http://www.w3.org/1999/xhtml" :xml\:lang "en" :lang "en"
	    (:head
	     (:meta :http-equiv "Content-Type" :content "text/html;charset=utf-8")
	     (:title "Rotten Potatoes!")
	     (:link :type "text/css" :rel "stylesheet" :href "/site.css"))
	    (:body
	     (:h1 :class "title" "Rotten Potatoes!")
	     ,@body))))