#include <ros/ros.h>
#include <turtlesim/Pose.h>
#include <geometry_msgs/Twist.h>
#include <std_srvs/Empty.h>
#include <nav_msgs/Path.h>
#include <cmath>

ros::Publisher twist_pub;
ros::Publisher path_pub;
geometry_msgs::PoseStamped pose_msg;
nav_msgs::Path path_msg;
int move_flag ;
void DrawCircle(const turtlesim::Pose& pose, geometry_msgs::Twist twist_msg, float dist, int cnt)
{
    twist_msg.linear.x = 0.5;
    twist_msg.linear.y = 0.0;
    twist_msg.linear.z = 0.0;
    twist_msg.angular.x = 0.0;
    twist_msg.angular.y = 0.0;
    twist_msg.angular.z = 0.5;
    
    if (dist <= 0.01)
    {
      cnt++;
      // std::cout<<cnt<<std::endl;
      if(cnt == 2)
      {
        cnt = 0;
        twist_msg.linear.x = 0.0;
        twist_msg.angular.z = 0.0;
        ROS_INFO("Stop and Completed!");
        twist_pub.publish(twist_msg);
        ros::shutdown();
        return;
      }
    }
    twist_pub.publish(twist_msg); // Publish command
}
void DrawSquare(const turtlesim::Pose& pose, geometry_msgs::Twist twist_msg, float dist, int cnt, int x_start, int y_start)
{
  if(cnt==0)
    {
      twist_msg.linear.x = 0.5;
      twist_msg.linear.y = 0.0;
      twist_msg.linear.z = 0.0;
      twist_msg.angular.x = 0.0;
      twist_msg.angular.y = 0.0;
      twist_msg.angular.z = 0.0;
      if(pose.x-x_start>=2)
        cnt++;
    }
    else if(cnt == 1)
    {
      twist_msg.linear.x = 0.0;
      twist_msg.linear.y = 0.5;
      if(pose.y-y_start>=2)
        cnt++;
    }
    else if(cnt == 2)
    {
      twist_msg.linear.x = -0.5;
      twist_msg.linear.y = 0.0;
      if(pose.x-x_start<=0)
        cnt++;
    }
    else if(cnt == 3)
    {
      twist_msg.linear.x = 0.0;
      twist_msg.linear.y = -0.5;
      if(pose.y-y_start<=0)
        cnt++;
    }
    else if(cnt==4)
    {
        cnt = 0;
        twist_msg.linear.x = 0.0;
        twist_msg.linear.y = 0.0;
        ROS_INFO("Stop and Completed!");
        twist_pub.publish(twist_msg);
        ros::shutdown();
        return;
    }
    twist_pub.publish(twist_msg); // Publish command
}
void DrawNumber(const turtlesim::Pose& pose, geometry_msgs::Twist twist_msg, float dist, int cnt, int x_start, int y_start)
{
  if(cnt == 0)
    {
      twist_msg.linear.x = 1;
      if(pose.x-x_start>=1)
        cnt++;
    }
    else if(cnt == 1)
    {
      twist_msg.linear.x = 0.0;
      twist_msg.linear.y = -1;
      if(pose.y-y_start<=-1)
        cnt++;
    }
    else if(cnt == 2)
    {
      twist_msg.linear.x = -1;
      twist_msg.linear.y = 0;
      if(pose.x-x_start<=0)
        cnt++;
    }
    else if(cnt == 3)
    {
      twist_msg.linear.x = 1;
      if(pose.x-x_start>=1)
        cnt++;
    }
    else if(cnt == 4)
    {
      twist_msg.linear.x = 0.0;
      twist_msg.linear.y = -1;
      if(pose.y-y_start<=-2)
        cnt++;
    }
    else if(cnt == 5)
    {
      twist_msg.linear.x = -1;
      twist_msg.linear.y = 0;
      if(pose.x-x_start<=0)
        cnt++;
    }
    else if(cnt == 6)
    {
      twist_msg.linear.x = 1;
      if(pose.x-x_start>=1)
        cnt++;
    }
    else if(cnt == 7)
    {
      twist_msg.linear.x = 0;
      twist_msg.linear.y = 2;
      if(pose.y-y_start>=0)
        cnt++;
    }
    else if(cnt == 8)
    {
      twist_msg.linear.x = 1;
      twist_msg.linear.y = 0;
      if(pose.x-x_start>=3)
        cnt++;
    }
    else if(cnt == 9)
    {
      twist_msg.linear.x = 0;
      twist_msg.linear.y = -1;
      if(pose.y-y_start<=-2)
        cnt++;
    }
    else if(cnt == 10)
    {
      twist_msg.linear.x = -1;
      twist_msg.linear.y = 0;
      if(pose.x-x_start<=2)
        cnt++;
    }
    else if(cnt == 11)
    {
      twist_msg.linear.x = 0;
      twist_msg.linear.y = 1;
      if(pose.y-y_start>=0)
        cnt++;
    }
    else if(cnt == 12)
    {
      cnt = 0;
      twist_msg.linear.x = 0.0;
      twist_msg.linear.y = 0.0;
      ROS_INFO("Stop and Completed!");
      twist_pub.publish(twist_msg);
      ros::shutdown();
      return;
    }
    twist_pub.publish(twist_msg); // Publish command
}
void poseCallback(const turtlesim::Pose& pose) {
  static bool is_forward = true;
  static int count = 0;
  static float x_start = pose.x;
  static float y_start = pose.y;
  static float theta_start = pose.theta;
  static int cnt = 0;

  // Calculate distance from starting points
  float dist = std::sqrt(std::pow(pose.x - x_start, 2) + std::pow(pose.y - y_start, 2));
  if(move_flag  ==  1)
  {
    geometry_msgs::Twist twist_msg;
    DrawCircle(pose, twist_msg, dist, cnt);
  }
  else if(move_flag == 2)
  {
    geometry_msgs::Twist twist_msg;
    DrawSquare(pose, twist_msg, dist, cnt, x_start, y_start);

  }
  else if(move_flag == 3)
  {
    geometry_msgs::Twist twist_msg;      
    DrawNumber(pose, twist_msg, dist, cnt, x_start, y_start);
  }
  path_msg.header.stamp = ros::Time::now();
  path_msg.header.frame_id = "map";
  pose_msg.pose.position.x = pose.x;
  pose_msg.pose.position.y = pose.y;
  pose_msg.pose.orientation.w = 1.0;
  path_msg.poses.push_back(pose_msg);
  path_pub.publish(path_msg);
}

int main(int argc, char** argv) {
  ros::init(argc, argv, "lab1_node");
  ros::NodeHandle nh;

  nh.param("lab1_node/move_flag", move_flag, 1);

  twist_pub = nh.advertise<geometry_msgs::Twist>("turtle1/cmd_vel", 1);

  path_pub = nh.advertise<nav_msgs::Path>("path", 1);

  ros::Subscriber pose_sub = nh.subscribe("turtle1/pose", 1, poseCallback); 

  // reset the turtlesim when this node starts
  ros::ServiceClient reset = nh.serviceClient<std_srvs::Empty>("reset");
  std_srvs::Empty empty;
  reset.call(empty);

  ros::spin(); // Keep node running until ros::shutdown()
  return 0;
}
