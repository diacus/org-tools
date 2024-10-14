;;; org-tools.el
;; Author: Diacus Magnuz <diacus.magnuz@gmail.com>
;; Version: 0.0.1
;;; Commentary:
;; A simple package with useful tools for the daily work
;;; Code:
(defun org-copy-property-value ()
  "Copy the value of a property from the current Org entry to the clipboard"
  (interactive)
  (let* ((properties (org-entry-properties))
	 (property-names (mapcar #'car properties))
	 (property (completing-read "Property name: " property-names nil t))
	 (value (org-entry-get nil property)))
    (if value
	(progn
	  (kill-new value)
	  (message "Copied value: %s" value))
      (message "Property %s not found." property))))

(defun org-browse-property-url ()
  "Opens the value of a property from the current Org entry into the default browser"
  (interactive)
  (let* ((properties (org-entry-properties))
	 (property-names (mapcar #'car properties))
	 (property (completing-read "Property name: " property-names nil t))
	 (url (org-entry-get nil property)))
    (if url
	(progn
	  (browse-url url)
	  (message "Go to: %s" url))
      (message "Property %s not found." property))))

(provide 'org-tools)
;;; org-tools.el ends here
