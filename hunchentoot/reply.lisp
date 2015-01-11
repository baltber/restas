;;;; reply.lisp
;;;;
;;;; This file is part of the RESTAS library, released under Lisp-LGPL.
;;;; See file COPYING for details.
;;;;
;;;; Author: Moskvitin Andrey <archimag@gmail.com>

(in-package :restas.hunchentoot)

(defmethod restas:reply-headers-out ((reply hunchentoot:reply))
  (hunchentoot:headers-out reply))

(defmethod restas:reply-header-out (name (reply hunchentoot:reply))
  (hunchentoot:header-out name reply))

(defmethod (setf restas:reply-header-out) (new-value name (reply hunchentoot:reply))
  (setf (hunchentoot:header-out name reply)
        new-value))

(defmethod restas:reply-cookies-out ((reply hunchentoot:reply))
  (hunchentoot:cookies-out reply))

(defmethod (setf restas:reply-cookies-out) (newvalue (reply hunchentoot:reply))
  (setf (hunchentoot:cookies-out reply)
        newvalue))

(defmethod restas:reply-return-code ((reply hunchentoot:reply))
  (hunchentoot:return-code reply))

(defmethod (setf restas:reply-return-code) (newvalue (reply hunchentoot:reply))
  (setf (hunchentoot:return-code reply)
        newvalue))

(defmethod restas:abort-request-handler ((reply hunchentoot:reply) result)
  (throw 'restas::route-done result))

(defmethod restas:reply-external-format ((reply hunchentoot:reply))
  (hunchentoot:reply-external-format reply))

(defmethod (setf restas:reply-external-format) (newvalue (reply hunchentoot:reply))
  (setf (hunchentoot:reply-external-format reply)
        (if (keywordp newvalue)
            (flex:make-external-format newvalue :eol-style :lf)
            newvalue)))

(defmethod hunchentoot::stringify-cookie ((cookie restas:cookie))
  (restas::stringify-cookie cookie))

