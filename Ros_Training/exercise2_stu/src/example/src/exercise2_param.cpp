#include <iostream>
#include <cmath>

#include <ros/ros.h>
#include <geometry_msgs/PoseStamped.h>
#include <nav_msgs/Odometry.h>

#include "plan_env/lec4.h"
#include "ego_planner/TutorialGoal.h"

using namespace std;

ros::Subscriber odom_sub;
ros::Publisher param_goal_pub;
ros::ServiceClient client;
int waypoint_num_;
double waypoints_[50][3];

double spin_rate;

// 
void OdomCallback(const nav_msgs::Odometry& msg) {
    ROS_WARN_ONCE("odom CB");
    static int way_point_count = 0;

    if (way_point_count >= waypoint_num_) {
        ROS_WARN_ONCE("all points pub");
        return;
    }
    float dist = std::sqrt(std::pow(waypoints_[way_point_count][0] - msg.pose.pose.position.x, 2) + 
                            std::pow(waypoints_[way_point_count][1] - msg.pose.pose.position.y, 2) + 
                            std::pow(waypoints_[way_point_count][2] - msg.pose.pose.position.z, 2));

    //TODO 
    /***your code for publishing drone goal***/
    ego_planner::TutorialGoal goal_msgs;
    goal_msgs.goal_x = waypoints_[way_point_count][0];
    goal_msgs.goal_y = waypoints_[way_point_count][1];
    goal_msgs.goal_z = waypoints_[way_point_count][2];
    if(dist <= 0.01)
    {
      way_point_count++;
    }

    if(way_point_count < waypoint_num_)
      param_goal_pub.publish(goal_msgs);
    else
    {
      ros::shutdown();
      return;
    }
}

int main(int argc, char** argv) {
  ros::init(argc, argv, "exercesie2_param_node");
  ros::NodeHandle n("~");

  odom_sub = n.subscribe("/odom", 10, OdomCallback);
  param_goal_pub = n.advertise<ego_planner::TutorialGoal>("/waypoint_generator/tutorial_goal", 10);

  //TODO 
  /*your code for param reading*/
  n.param("/waypoint_num_", waypoint_num_, 5);
  n.param("waypoints0_x", waypoints_[0][0], 0.0);
  n.param("waypoints0_y", waypoints_[0][1], 0.0);
  n.param("waypoints0_z", waypoints_[0][2], 0.0);
  n.param("waypoints1_x", waypoints_[1][0], 0.0);
  n.param("waypoints1_y", waypoints_[1][1], 0.0);
  n.param("waypoints1_z", waypoints_[1][2], 0.0);
  n.param("waypoints2_x", waypoints_[2][0], 0.0);
  n.param("waypoints2_y", waypoints_[2][1], 0.0);
  n.param("waypoints2_z", waypoints_[2][2], 0.0);
  n.param("waypoints3_x", waypoints_[3][0], 0.0);
  n.param("waypoints3_y", waypoints_[3][1], 0.0);
  n.param("waypoints3_z", waypoints_[3][2], 0.0);
  n.param("waypoints4_x", waypoints_[4][0], 0.0);
  n.param("waypoints4_y", waypoints_[4][1], 0.0);
  n.param("waypoints4_z", waypoints_[4][2], 0.0);
 
  
  n.param("/spin_rate", spin_rate, 10.0);
  ros::Duration(0.5).sleep();

  ros::Rate loop_rate(spin_rate);

  while (ros::ok()) {
    ros::spinOnce();
    loop_rate.sleep();
  }
}