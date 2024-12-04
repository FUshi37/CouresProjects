; Auto-generated. Do not edit!


(cl:in-package ego_planner-msg)


;//! \htmlinclude TutorialGoal.msg.html

(cl:defclass <TutorialGoal> (roslisp-msg-protocol:ros-message)
  ((goal_x
    :reader goal_x
    :initarg :goal_x
    :type cl:float
    :initform 0.0)
   (goal_y
    :reader goal_y
    :initarg :goal_y
    :type cl:float
    :initform 0.0)
   (goal_z
    :reader goal_z
    :initarg :goal_z
    :type cl:float
    :initform 0.0))
)

(cl:defclass TutorialGoal (<TutorialGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TutorialGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TutorialGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ego_planner-msg:<TutorialGoal> is deprecated: use ego_planner-msg:TutorialGoal instead.")))

(cl:ensure-generic-function 'goal_x-val :lambda-list '(m))
(cl:defmethod goal_x-val ((m <TutorialGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ego_planner-msg:goal_x-val is deprecated.  Use ego_planner-msg:goal_x instead.")
  (goal_x m))

(cl:ensure-generic-function 'goal_y-val :lambda-list '(m))
(cl:defmethod goal_y-val ((m <TutorialGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ego_planner-msg:goal_y-val is deprecated.  Use ego_planner-msg:goal_y instead.")
  (goal_y m))

(cl:ensure-generic-function 'goal_z-val :lambda-list '(m))
(cl:defmethod goal_z-val ((m <TutorialGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ego_planner-msg:goal_z-val is deprecated.  Use ego_planner-msg:goal_z instead.")
  (goal_z m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TutorialGoal>) ostream)
  "Serializes a message object of type '<TutorialGoal>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'goal_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'goal_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'goal_z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TutorialGoal>) istream)
  "Deserializes a message object of type '<TutorialGoal>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'goal_x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'goal_y) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'goal_z) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TutorialGoal>)))
  "Returns string type for a message object of type '<TutorialGoal>"
  "ego_planner/TutorialGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TutorialGoal)))
  "Returns string type for a message object of type 'TutorialGoal"
  "ego_planner/TutorialGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TutorialGoal>)))
  "Returns md5sum for a message object of type '<TutorialGoal>"
  "d3b3ae32f2973af60bff0257f4299024")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TutorialGoal)))
  "Returns md5sum for a message object of type 'TutorialGoal"
  "d3b3ae32f2973af60bff0257f4299024")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TutorialGoal>)))
  "Returns full string definition for message of type '<TutorialGoal>"
  (cl:format cl:nil "float64 goal_x~%float64 goal_y~%float64 goal_z~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TutorialGoal)))
  "Returns full string definition for message of type 'TutorialGoal"
  (cl:format cl:nil "float64 goal_x~%float64 goal_y~%float64 goal_z~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TutorialGoal>))
  (cl:+ 0
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TutorialGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'TutorialGoal
    (cl:cons ':goal_x (goal_x msg))
    (cl:cons ':goal_y (goal_y msg))
    (cl:cons ':goal_z (goal_z msg))
))
