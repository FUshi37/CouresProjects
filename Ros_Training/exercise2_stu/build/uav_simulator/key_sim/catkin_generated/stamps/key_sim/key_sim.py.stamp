#!/usr/bin/env python

import pygame
from pygame.locals import *
import time
import sys
import rospy
from geometry_msgs.msg import Twist
from sensor_msgs.msg import Joy
import rospkg


def main():

    # initialize pygame to get keyboard event
    pygame.init()
    window_size = Rect(0, 0, 697, 319)
    screen = pygame.display.set_mode(window_size.size)

    # get an instance of RosPack with the default search paths
    rospack = rospkg.RosPack()

    # list all packages, equivalent to rospack list
    rospack.list() 

    # get the file path for rospy_tutorials
    img_path = rospack.get_path('key_sim') + "/files/keyboard.jpg"

    print("img_path:",img_path)

    #img = pygame.image.load("/home/jr/Documents/exercise2/src/uav_simulator/key_sim/files/keyboard.jpg")
    img = pygame.image.load(img_path)

    # initialize ros publisher
    twist_pub = rospy.Publisher('keyboard/twist', Twist, queue_size=10)
    joy_pub = rospy.Publisher('/joy', Joy, queue_size=10)
    rospy.init_node('key_sim_node')
    rate = rospy.Rate(50)

    # init joy message
    joy_ = Joy()    
    joy_.header.frame_id = 'map'
    for i in range(8):
      joy_.axes.append(0.0)
    for i in range(11):
      joy_.buttons.append(0)
    vel = 1
    while not rospy.is_shutdown():
        rate.sleep()
        screen.blit(img, (1,1))
        pygame.display.flip()
        # reset message axes
        for i in range(8):
            joy_.axes[i] = 0.0

        # reset buttons
        for i in range(11):
            joy_.buttons[i] = 0

        for event in pygame.event.get():
            # ---------------------- key dowm message ----------------------
            
            if event.type == KEYDOWN:
                # position control
                if event.key == pygame.K_UP:
                    print('forward')
                    joy_.axes[4] = vel
                    joy_pub.publish(joy_)
                if event.key == pygame.K_DOWN:
                    print('backward')
                    joy_.axes[4] = -vel
                    joy_pub.publish(joy_)
                if event.key == pygame.K_LEFT:
                    print('left')
                    joy_.axes[3] = vel
                    joy_pub.publish(joy_)
                if event.key == pygame.K_RIGHT:
                    print('right')
                    joy_.axes[3] = -vel
                    joy_pub.publish(joy_)
                # z control
                if event.key == pygame.K_w:
                    print('up')
                    joy_.axes[1] = vel
                    joy_pub.publish(joy_)
                if event.key == pygame.K_s:
                    print('down')
                    joy_.axes[1] = -vel
                    joy_pub.publish(joy_)
                # task control
                if event.key == pygame.K_n:
                    print('set goal')
                    joy_.buttons[6] = 1
                    joy_pub.publish(joy_)

		#Publish
                # joy_pub.publish(joy_)



if __name__ == '__main__':
    try:
        main()
    except rospy.ROSInterruptException:
        pass
