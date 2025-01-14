// Generated by gencpp from file ego_planner/TutorialGoal.msg
// DO NOT EDIT!


#ifndef EGO_PLANNER_MESSAGE_TUTORIALGOAL_H
#define EGO_PLANNER_MESSAGE_TUTORIALGOAL_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace ego_planner
{
template <class ContainerAllocator>
struct TutorialGoal_
{
  typedef TutorialGoal_<ContainerAllocator> Type;

  TutorialGoal_()
    : goal_x(0.0)
    , goal_y(0.0)
    , goal_z(0.0)  {
    }
  TutorialGoal_(const ContainerAllocator& _alloc)
    : goal_x(0.0)
    , goal_y(0.0)
    , goal_z(0.0)  {
  (void)_alloc;
    }



   typedef double _goal_x_type;
  _goal_x_type goal_x;

   typedef double _goal_y_type;
  _goal_y_type goal_y;

   typedef double _goal_z_type;
  _goal_z_type goal_z;





  typedef boost::shared_ptr< ::ego_planner::TutorialGoal_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::ego_planner::TutorialGoal_<ContainerAllocator> const> ConstPtr;

}; // struct TutorialGoal_

typedef ::ego_planner::TutorialGoal_<std::allocator<void> > TutorialGoal;

typedef boost::shared_ptr< ::ego_planner::TutorialGoal > TutorialGoalPtr;
typedef boost::shared_ptr< ::ego_planner::TutorialGoal const> TutorialGoalConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::ego_planner::TutorialGoal_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::ego_planner::TutorialGoal_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::ego_planner::TutorialGoal_<ContainerAllocator1> & lhs, const ::ego_planner::TutorialGoal_<ContainerAllocator2> & rhs)
{
  return lhs.goal_x == rhs.goal_x &&
    lhs.goal_y == rhs.goal_y &&
    lhs.goal_z == rhs.goal_z;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::ego_planner::TutorialGoal_<ContainerAllocator1> & lhs, const ::ego_planner::TutorialGoal_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace ego_planner

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::ego_planner::TutorialGoal_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::ego_planner::TutorialGoal_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ego_planner::TutorialGoal_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ego_planner::TutorialGoal_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ego_planner::TutorialGoal_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ego_planner::TutorialGoal_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::ego_planner::TutorialGoal_<ContainerAllocator> >
{
  static const char* value()
  {
    return "d3b3ae32f2973af60bff0257f4299024";
  }

  static const char* value(const ::ego_planner::TutorialGoal_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xd3b3ae32f2973af6ULL;
  static const uint64_t static_value2 = 0x0bff0257f4299024ULL;
};

template<class ContainerAllocator>
struct DataType< ::ego_planner::TutorialGoal_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ego_planner/TutorialGoal";
  }

  static const char* value(const ::ego_planner::TutorialGoal_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::ego_planner::TutorialGoal_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float64 goal_x\n"
"float64 goal_y\n"
"float64 goal_z\n"
"\n"
;
  }

  static const char* value(const ::ego_planner::TutorialGoal_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::ego_planner::TutorialGoal_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.goal_x);
      stream.next(m.goal_y);
      stream.next(m.goal_z);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct TutorialGoal_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::ego_planner::TutorialGoal_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::ego_planner::TutorialGoal_<ContainerAllocator>& v)
  {
    s << indent << "goal_x: ";
    Printer<double>::stream(s, indent + "  ", v.goal_x);
    s << indent << "goal_y: ";
    Printer<double>::stream(s, indent + "  ", v.goal_y);
    s << indent << "goal_z: ";
    Printer<double>::stream(s, indent + "  ", v.goal_z);
  }
};

} // namespace message_operations
} // namespace ros

#endif // EGO_PLANNER_MESSAGE_TUTORIALGOAL_H
