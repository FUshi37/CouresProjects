// Auto-generated. Do not edit!

// (in-package ego_planner.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class TutorialGoal {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.goal_x = null;
      this.goal_y = null;
      this.goal_z = null;
    }
    else {
      if (initObj.hasOwnProperty('goal_x')) {
        this.goal_x = initObj.goal_x
      }
      else {
        this.goal_x = 0.0;
      }
      if (initObj.hasOwnProperty('goal_y')) {
        this.goal_y = initObj.goal_y
      }
      else {
        this.goal_y = 0.0;
      }
      if (initObj.hasOwnProperty('goal_z')) {
        this.goal_z = initObj.goal_z
      }
      else {
        this.goal_z = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type TutorialGoal
    // Serialize message field [goal_x]
    bufferOffset = _serializer.float64(obj.goal_x, buffer, bufferOffset);
    // Serialize message field [goal_y]
    bufferOffset = _serializer.float64(obj.goal_y, buffer, bufferOffset);
    // Serialize message field [goal_z]
    bufferOffset = _serializer.float64(obj.goal_z, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TutorialGoal
    let len;
    let data = new TutorialGoal(null);
    // Deserialize message field [goal_x]
    data.goal_x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [goal_y]
    data.goal_y = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [goal_z]
    data.goal_z = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 24;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ego_planner/TutorialGoal';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd3b3ae32f2973af60bff0257f4299024';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 goal_x
    float64 goal_y
    float64 goal_z
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new TutorialGoal(null);
    if (msg.goal_x !== undefined) {
      resolved.goal_x = msg.goal_x;
    }
    else {
      resolved.goal_x = 0.0
    }

    if (msg.goal_y !== undefined) {
      resolved.goal_y = msg.goal_y;
    }
    else {
      resolved.goal_y = 0.0
    }

    if (msg.goal_z !== undefined) {
      resolved.goal_z = msg.goal_z;
    }
    else {
      resolved.goal_z = 0.0
    }

    return resolved;
    }
};

module.exports = TutorialGoal;
