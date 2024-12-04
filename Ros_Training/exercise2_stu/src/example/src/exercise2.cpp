#include <iostream>
#include <ros/ros.h>
#include <geometry_msgs/PoseStamped.h>

#include "plan_env/lec4.h"
#include "ego_planner/TutorialGoal.h"
#include "sensor_msgs/Joy.h"

using namespace std;

// 宏定义键盘通道 方便代码阅读
#define CH_FORWARD 4
#define CH_LEFT    3
#define CH_UP      1
#define CH_PUB     6

//           接收rviz 目标点, 键盘消息
ros::Subscriber click_sub, key_sub;
//                可视化键盘目标点, 发送非占据目标点给无人机
ros::Publisher goal_key_vis_pub, safe_goal_pub;
//                  请求坐标点是否占据
ros::ServiceClient client;

double spin_rate;

// 键盘目标点坐标
double goal_key_x, goal_key_y, goal_key_z;

// part 2
// 检查坐标点是否占据,非占据则发送目标点给无人机
void CheckAndPubGoal(const double& goal_x,
                    const double& goal_y,
                    const double& goal_z){

  // TODO
  /* 通过server判断目标点是否占据 */
  plan_env::lec4 srv_msg;
  srv_msg.request.x = goal_x;
  srv_msg.request.y = goal_y;
  srv_msg.request.z = goal_z;

  // TODO
  /* 若非占据则发送给无人机 */
  if(client.call(srv_msg))
  {
    if(srv_msg.response.is_valid)
    {
      ego_planner::TutorialGoal goal_msgs;

      goal_msgs.goal_x = goal_x;
      goal_msgs.goal_y = goal_y;
      goal_msgs.goal_z = goal_z;
      safe_goal_pub.publish(goal_msgs);
    }
  }

  return;
} 

// part 2
// 接收 Rviz 2D Nav Goal,判断是否占据,非占据则发送给无人机
void ClickCallback(const geometry_msgs::PoseStamped& msg) {

  CheckAndPubGoal(msg.pose.position.x,msg.pose.position.y,1.0);

  return;
}

// part 3 
// 可视化键盘目标点
void VisKeyGoal(const double& goal_x,
                const double& goal_y,
                const double& goal_z){

  // TODO
  /* 发送数据类型为geometry_msgs::PoseStamped的消息供Rviz可视化 */
  geometry_msgs::PoseStamped pose_msgs;
  pose_msgs.header.frame_id = "world";
  pose_msgs.header.stamp = ros::Time::now();
  pose_msgs.pose.position.x = goal_x;
  pose_msgs.pose.position.y = goal_y;
  pose_msgs.pose.position.z = goal_z;
  goal_key_vis_pub.publish(pose_msgs);

  return;
} 

// part 3 
// 键盘回调函数
void KeyCallback(const sensor_msgs::Joy& msg) {

  // TODO
  /* 判断按键,并设定目标点 */
  if(msg.axes.at(CH_FORWARD) == 1)
  {
    goal_key_x += 0.5;
  }
  if(msg.axes.at(CH_FORWARD) == -1)
  {
    goal_key_x -= 0.5;
  }
  if(msg.axes.at(CH_LEFT) == 1)
  {
    goal_key_y += 0.5;
  }
  if(msg.axes.at(CH_LEFT) == -1)
  { 
    goal_key_y -= 0.5;
  }
  if(msg.axes.at(CH_UP) == 1)
  {
    goal_key_z += 0.5;
  }
  if(msg.axes.at(CH_UP) == -1)
  {
    goal_key_z -= 0.5;
  }

  // 可视化目标点
  VisKeyGoal(goal_key_x,goal_key_y,goal_key_z);

  // TODO
  /* 若键盘按下"N"则发送当前目标点 */
  if(msg.buttons.at(CH_PUB) == 1)
  {
      CheckAndPubGoal(goal_key_x, goal_key_y, goal_key_z);
  }
  return;
}

int main(int argc, char** argv) {
  ros::init(argc, argv, "exercesie2_node");
  ros::NodeHandle n("~");

  // TODO 
  // 注册相应 Subscriber Publisher ServiceClient
  safe_goal_pub = n.advertise<ego_planner::TutorialGoal>("/waypoint_generator/tutorial_goal", 10);
  click_sub = n.subscribe("/move_base_simple/goal", 1 ,ClickCallback);
  client = n.serviceClient<plan_env::lec4>("/call_valid");

  goal_key_vis_pub = n.advertise<geometry_msgs::PoseStamped>("/key_goal", 10);
  key_sub = n.subscribe("/joy", 1 ,KeyCallback);

  // 键盘目标点坐标初始化
  goal_key_x = goal_key_y = goal_key_z = 0;

  n.param("/spin_rate", spin_rate, 10.0);
  ros::Duration(0.5).sleep();

  ros::Rate loop_rate(spin_rate);

  while (ros::ok()) {
    ros::spinOnce();
    loop_rate.sleep();
  }
}