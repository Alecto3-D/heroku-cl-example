(in-package :example)

(setq *dispatch-table*
      (list
       (create-regex-dispatcher "^/index" 'controller-index)
       (create-static-file-dispatcher-and-handler "/site.css" "static/application.css")))
