(in-package :example)

(setq *dispatch-table*
      (list
       (create-regex-dispatcher "^/index" 'controller-index)
       (create-regex-dispatcher "^/new" 'controller-new)
       (create-static-file-dispatcher-and-handler "/site.css" "static/application.css")))
