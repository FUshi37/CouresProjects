; Auto-generated. Do not edit!


(cl:in-package plan_env-srv)


;//! \htmlinclude lec4-request.msg.html

(cl:defclass <lec4-request> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0)
   (y
    :reader y
    :initarg :y
    :type cl:float
    :initform 0.0)
   (z
    :reader z
    :initarg :z
    :type cl:float
    :initform 0.0))
)

(cl:defclass lec4-request (<lec4-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <lec4-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'lec4-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name plan_env-srv:<lec4-request> is deprecated: use plan_env-srv:lec4-request instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <lec4-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader plan_env-srv:x-val is deprecated.  Use plan_env-srv:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <lec4-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader plan_env-srv:y-val is deprecated.  Use plan_env-srv:y instead.")
  (y m))

(cl:ensure-generic-function 'z-val :lambda-list '(m))
(cl:defmethod z-val ((m <lec4-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader plan_env-srv:z-val is deprecated.  Use plan_env-srv:z instead.")
  (z m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <lec4-request>) ostream)
  "Serializes a message object of type '<lec4-request>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <lec4-request>) istream)
  "Deserializes a message object of type '<lec4-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'z) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<lec4-request>)))
  "Returns string type for a service object of type '<lec4-request>"
  "plan_env/lec4Request")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'lec4-request)))
  "Returns string type for a service object of type 'lec4-request"
  "plan_env/lec4Request")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<lec4-request>)))
  "Returns md5sum for a message object of type '<lec4-request>"
  "49905607991db81d6757177b80bef3dc")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'lec4-request)))
  "Returns md5sum for a message object of type 'lec4-request"
  "49905607991db81d6757177b80bef3dc")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<lec4-request>)))
  "Returns full string definition for message of type '<lec4-request>"
  (cl:format cl:nil "float32 x~%float32 y~%float32 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'lec4-request)))
  "Returns full string definition for message of type 'lec4-request"
  (cl:format cl:nil "float32 x~%float32 y~%float32 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <lec4-request>))
  (cl:+ 0
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <lec4-request>))
  "Converts a ROS message object to a list"
  (cl:list 'lec4-request
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':z (z msg))
))
;//! \htmlinclude lec4-response.msg.html

(cl:defclass <lec4-response> (roslisp-msg-protocol:ros-message)
  ((is_valid
    :reader is_valid
    :initarg :is_valid
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass lec4-response (<lec4-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <lec4-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'lec4-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name plan_env-srv:<lec4-response> is deprecated: use plan_env-srv:lec4-response instead.")))

(cl:ensure-generic-function 'is_valid-val :lambda-list '(m))
(cl:defmethod is_valid-val ((m <lec4-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader plan_env-srv:is_valid-val is deprecated.  Use plan_env-srv:is_valid instead.")
  (is_valid m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <lec4-response>) ostream)
  "Serializes a message object of type '<lec4-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'is_valid) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <lec4-response>) istream)
  "Deserializes a message object of type '<lec4-response>"
    (cl:setf (cl:slot-value msg 'is_valid) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<lec4-response>)))
  "Returns string type for a service object of type '<lec4-response>"
  "plan_env/lec4Response")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'lec4-response)))
  "Returns string type for a service object of type 'lec4-response"
  "plan_env/lec4Response")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<lec4-response>)))
  "Returns md5sum for a message object of type '<lec4-response>"
  "49905607991db81d6757177b80bef3dc")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'lec4-response)))
  "Returns md5sum for a message object of type 'lec4-response"
  "49905607991db81d6757177b80bef3dc")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<lec4-response>)))
  "Returns full string definition for message of type '<lec4-response>"
  (cl:format cl:nil "bool is_valid~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'lec4-response)))
  "Returns full string definition for message of type 'lec4-response"
  (cl:format cl:nil "bool is_valid~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <lec4-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <lec4-response>))
  "Converts a ROS message object to a list"
  (cl:list 'lec4-response
    (cl:cons ':is_valid (is_valid msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'lec4)))
  'lec4-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'lec4)))
  'lec4-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'lec4)))
  "Returns string type for a service object of type '<lec4>"
  "plan_env/lec4")