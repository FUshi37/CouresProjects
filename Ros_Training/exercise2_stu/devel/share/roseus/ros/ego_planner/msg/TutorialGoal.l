;; Auto-generated. Do not edit!


(when (boundp 'ego_planner::TutorialGoal)
  (if (not (find-package "EGO_PLANNER"))
    (make-package "EGO_PLANNER"))
  (shadow 'TutorialGoal (find-package "EGO_PLANNER")))
(unless (find-package "EGO_PLANNER::TUTORIALGOAL")
  (make-package "EGO_PLANNER::TUTORIALGOAL"))

(in-package "ROS")
;;//! \htmlinclude TutorialGoal.msg.html


(defclass ego_planner::TutorialGoal
  :super ros::object
  :slots (_goal_x _goal_y _goal_z ))

(defmethod ego_planner::TutorialGoal
  (:init
   (&key
    ((:goal_x __goal_x) 0.0)
    ((:goal_y __goal_y) 0.0)
    ((:goal_z __goal_z) 0.0)
    )
   (send-super :init)
   (setq _goal_x (float __goal_x))
   (setq _goal_y (float __goal_y))
   (setq _goal_z (float __goal_z))
   self)
  (:goal_x
   (&optional __goal_x)
   (if __goal_x (setq _goal_x __goal_x)) _goal_x)
  (:goal_y
   (&optional __goal_y)
   (if __goal_y (setq _goal_y __goal_y)) _goal_y)
  (:goal_z
   (&optional __goal_z)
   (if __goal_z (setq _goal_z __goal_z)) _goal_z)
  (:serialization-length
   ()
   (+
    ;; float64 _goal_x
    8
    ;; float64 _goal_y
    8
    ;; float64 _goal_z
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _goal_x
       (sys::poke _goal_x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _goal_y
       (sys::poke _goal_y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _goal_z
       (sys::poke _goal_z (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _goal_x
     (setq _goal_x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _goal_y
     (setq _goal_y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _goal_z
     (setq _goal_z (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get ego_planner::TutorialGoal :md5sum-) "d3b3ae32f2973af60bff0257f4299024")
(setf (get ego_planner::TutorialGoal :datatype-) "ego_planner/TutorialGoal")
(setf (get ego_planner::TutorialGoal :definition-)
      "float64 goal_x
float64 goal_y
float64 goal_z


")



(provide :ego_planner/TutorialGoal "d3b3ae32f2973af60bff0257f4299024")


