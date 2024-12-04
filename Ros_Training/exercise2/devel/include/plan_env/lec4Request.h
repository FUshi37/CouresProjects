// Generated by gencpp from file plan_env/lec4Request.msg
// DO NOT EDIT!


#ifndef PLAN_ENV_MESSAGE_LEC4REQUEST_H
#define PLAN_ENV_MESSAGE_LEC4REQUEST_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace plan_env
{
template <class ContainerAllocator>
struct lec4Request_
{
  typedef lec4Request_<ContainerAllocator> Type;

  lec4Request_()
    : x(0.0)
    , y(0.0)
    , z(0.0)  {
    }
  lec4Request_(const ContainerAllocator& _alloc)
    : x(0.0)
    , y(0.0)
    , z(0.0)  {
  (void)_alloc;
    }



   typedef float _x_type;
  _x_type x;

   typedef float _y_type;
  _y_type y;

   typedef float _z_type;
  _z_type z;





  typedef boost::shared_ptr< ::plan_env::lec4Request_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::plan_env::lec4Request_<ContainerAllocator> const> ConstPtr;

}; // struct lec4Request_

typedef ::plan_env::lec4Request_<std::allocator<void> > lec4Request;

typedef boost::shared_ptr< ::plan_env::lec4Request > lec4RequestPtr;
typedef boost::shared_ptr< ::plan_env::lec4Request const> lec4RequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::plan_env::lec4Request_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::plan_env::lec4Request_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::plan_env::lec4Request_<ContainerAllocator1> & lhs, const ::plan_env::lec4Request_<ContainerAllocator2> & rhs)
{
  return lhs.x == rhs.x &&
    lhs.y == rhs.y &&
    lhs.z == rhs.z;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::plan_env::lec4Request_<ContainerAllocator1> & lhs, const ::plan_env::lec4Request_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace plan_env

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::plan_env::lec4Request_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::plan_env::lec4Request_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::plan_env::lec4Request_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::plan_env::lec4Request_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::plan_env::lec4Request_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::plan_env::lec4Request_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::plan_env::lec4Request_<ContainerAllocator> >
{
  static const char* value()
  {
    return "cc153912f1453b708d221682bc23d9ac";
  }

  static const char* value(const ::plan_env::lec4Request_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xcc153912f1453b70ULL;
  static const uint64_t static_value2 = 0x8d221682bc23d9acULL;
};

template<class ContainerAllocator>
struct DataType< ::plan_env::lec4Request_<ContainerAllocator> >
{
  static const char* value()
  {
    return "plan_env/lec4Request";
  }

  static const char* value(const ::plan_env::lec4Request_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::plan_env::lec4Request_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float32 x\n"
"float32 y\n"
"float32 z\n"
;
  }

  static const char* value(const ::plan_env::lec4Request_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::plan_env::lec4Request_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.x);
      stream.next(m.y);
      stream.next(m.z);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct lec4Request_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::plan_env::lec4Request_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::plan_env::lec4Request_<ContainerAllocator>& v)
  {
    s << indent << "x: ";
    Printer<float>::stream(s, indent + "  ", v.x);
    s << indent << "y: ";
    Printer<float>::stream(s, indent + "  ", v.y);
    s << indent << "z: ";
    Printer<float>::stream(s, indent + "  ", v.z);
  }
};

} // namespace message_operations
} // namespace ros

#endif // PLAN_ENV_MESSAGE_LEC4REQUEST_H