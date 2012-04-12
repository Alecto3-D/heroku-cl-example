(in-package :example)

(def-internal-macro selector-form (name options)
  `(:select :name ,name
	    ,@(mapcar
	       #'(lambda (x) `(:option :value ,x ,x))
	       options)))