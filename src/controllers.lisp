(in-package :example)

;; Handlers
(push (hunchentoot:create-folder-dispatcher-and-handler "/static/" "/app/public/")
	 hunchentoot:*dispatch-table*)