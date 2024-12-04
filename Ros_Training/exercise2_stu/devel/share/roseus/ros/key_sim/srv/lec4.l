;; Auto-generated. Do not edit!


(when (boundp 'key_sim::lec4)
  (if (not (find-package "KEY_SIM"))
    (make-package "KEY_SIM"))
  (shadow 'lec4 (find-package "KEY_SIM")))
(unless (find-package "KEY_SIM::LEC4")
  (make-package "KEY_SIM::LEC4"))
(unless (find-package "KEY_SIM::LEC4REQUEST")
  (make-package "KEY_SIM::LEC4REQUEST"))
(unless (find-package "KEY_SIM::LEC4RESPONSE")
  (make-package "KEY_SIM::LEC4RESPONSE"))

(in-package "ROS")





(defclass key_sim::lec4Request
  :super ros::object
  :slots (_x _y _z ))

(defmethod key_sim::lec4Request
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:z __z) 0.0)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _z (float __z))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:z
   (&optional __z)
   (if __z (setq _z __z)) _z)
  (:serialization-length
   ()
   (+
    ;; float32 _x
    4
    ;; float32 _y
    4
    ;; float32 _z
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _x
       (sys::poke _x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _y
       (sys::poke _y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _z
       (sys::poke _z (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _x
     (setq _x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _y
     (setq _y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _z
     (setq _z (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass key_sim::lec4Response
  :super ros::object
  :slots (_is_valid ))

(defmethod key_sim::lec4Response
  (:init
   (&key
    ((:is_valid __is_valid) nil)
    )
   (send-super :init)
   (setq _is_valid __is_valid)
   self)
  (:is_valid
   (&optional (__is_valid :null))
   (if (not (eq __is_valid :null)) (setq _is_valid __is_valid)) _is_valid)
  (:serialization-length
   ()
   (+
    ;; bool _is_valid
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _is_valid
       (if _is_valid (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _is_valid
     (setq _is_valid (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass key_sim::lec4
  :super ros::object
  :slots ())

(setf (get key_sim::lec4 :md5sum-) "49905607991db81d6757177b80bef3dc")
(setf (get key_sim::lec4 :datatype-) "key_sim/lec4")
(setf (get key_sim::lec4 :request) key_sim::lec4Request)
(setf (get key_sim::lec4 :response) key_sim::lec4Response)

(defmethod key_sim::lec4Request
  (:response () (instance key_sim::lec4Response :init)))

(setf (get key_sim::lec4Request :md5sum-) "49905607991db81d6757177b80bef3dc")
(setf (get key_sim::lec4Request :datatype-) "key_sim/lec4Request")
(setf (get key_sim::lec4Request :definition-)
      "float32 x
float32 y
float32 z
---
bool is_valid

")

(setf (get key_sim::lec4Response :md5sum-) "49905607991db81d6757177b80bef3dc")
(setf (get key_sim::lec4Response :datatype-) "key_sim/lec4Response")
(setf (get key_sim::lec4Response :definition-)
      "float32 x
float32 y
float32 z
---
bool is_valid

")



(provide :key_sim/lec4 "49905607991db81d6757177b80bef3dc")


