(in-package :example)

(setq *dispatch-table*
      (list
       (create-regex-dispatcher "(^/movies$|^/$)" 'controller-index)
       (create-regex-dispatcher "^/movies/new" 'controller-new)
       (create-static-file-dispatcher-and-handler "/site.css" "static/application.css")))
