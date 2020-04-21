;;; init.el ---

;;; Copyright (C) 2017 scvh-man
;;; Author: scvh-man
;;; License: http://www.gnu.org/licenses/gpl-3.0.en.html

;;; Commentary:
;;; Code:
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
						 ("melpa-stable" . "https://stable.melpa.org/packages/")
						 ("melpa" . "http://melpa.org/packages/")))
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))
(package-refresh-contents)
(use-package org
  :ensure t
  :pin melpa-stable)
(use-package elfeed
  :ensure t
  :config (setq elfeed-db-directory "~/Data/elfeed"))
(use-package elfeed-org
  :ensure t
  :config (setq rmh-elfeed-org-files (list "~/Data/Share/Org/Util/Rss.org"))
  (elfeed-org))
(use-package elfeed-web
  :ensure t)
;; (defun bjm/elfeed-save-db-and-bury ()
;;   "Wrapper to save the elfeed db to disk before burying buffer"
;;   (interactive)
;;   (print "Saving db")
;;   (elfeed-db-save)
;;   (quit-window))
;; (defun bjm/elfeed-load-db-and-open ()
;;   "Wrapper to load the elfeed db from disk before opening"
;;   (interactive)
;;   (print "Loading db")
;;   (elfeed-db-load)
;;   (elfeed)
;;   (elfeed-search-update--force)
;;   (elfeed-update))
;; (defun bjm/elfeed-updater ()
;;   "Wrapper to load the elfeed db from disk before opening"
;;   (interactive)
;;   (print "Updating feed")
;;   (elfeed-db-save)
;;   (quit-window)
;;   (elfeed-db-load)
;;   (elfeed)
;;   (elfeed-update)
;;   (print "Done"))
;; (bjm/elfeed-updater)
;; (run-with-timer 0 (* 20 60) 'bjm/elfeed-updater)
(setq httpd-port 8090)
(elfeed-web-start)
