
(cl:in-package :asdf)

(defsystem "key_sim-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "lec4" :depends-on ("_package_lec4"))
    (:file "_package_lec4" :depends-on ("_package"))
  ))