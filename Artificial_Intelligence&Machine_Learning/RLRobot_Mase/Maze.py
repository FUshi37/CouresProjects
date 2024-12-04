import numpy as np
import random
import matplotlib.pyplot as plt
import copy
import cv2

class Maze(object):
    """
    Maze objects have several main attributes:
    - maze_data: wall conditions in every cells are coded as a 4-bit number,
        with a bit value taking 0 if there is a wall and 1 if there is no wall.
        The 1s register corresponds with a square's top edge, 2s register the
        right edge, 4s register the bottom edge, and 8s register the left edge.
    """
    def __init__(self, maze_size=5):
        self.valid_actions = ['u', 'r', 'd', 'l']  # Up, Right, Down, Left
        self.direction_bit_map = {'u': 1, 'r': 2, 'd': 4, 'l': 8}
        self.move_map = {
            'u': (-1, 0),
            'r': (0, +1),
            'd': (+1, 0),
            'l': (0, -1),
        }
        self.start_point = (0, 0)
        self.destination = (maze_size - 1, maze_size - 1)

        self.maze_data = self.generate_maze((maze_size, maze_size))
        self.maze_size = maze_size
        self.robot = {
            'loc': (0, 0),
            'dir': 'd',
        }
        self.reward = {}
        self.set_reward()

        self.path = []
        self.last_last_loc = None
        self.last_loc = None
        self.have_arrived = False

    def __repr__(self):
        height, width, walls = self.maze_data.shape
        self.draw_maze()
        self.draw_robot()

        plt.show()

        return 'Maze of size (%d, %d)' % (height, width)

    def is_hit_wall(self, location, direction):
        """
        Returns a boolean designating whether or not a cell is passable in the
        given direction. Cell is input as a tuple. Directions is input as single
        letter "up" , "right" , "down",  "left".
        direction_bit_map = {'u': 1, 'r': 2, 'd': 4, 'l': 8}
        将二进制的墙表示转换为10进制以判断是否撞墙
        """
        try:
            dec_num = 0
            for i in range(4):
                dec_num += self.maze_data[location][i] * 2 ** i

            return (dec_num & self.direction_bit_map[direction]) == 0
        except:
            print('Invalid direction or location provided!')
            pass        

    def set_reward(self, reward=None):
        """
        Set rewards for different situations.
        """
        if reward is None:
            self.reward = {
                "hit_wall": -10.,
                "destination": 50.,
                "default": 1,
            }
        else:
            self.reward = reward

    def move_robot(self, direction):
        """
        Move the robot location according to its location and direction
        Return the new location and moving reward
        """
        if direction not in self.valid_actions:
            raise ValueError("Invalid Actions")

        if self.is_hit_wall(self.robot['loc'], direction):
            self.robot['dir'] = direction
        else:
            new_x = self.robot["loc"][0] + self.move_map[direction][0]
            new_y = self.robot["loc"][1] + self.move_map[direction][1]
            self.robot['loc'] = (new_x, new_y)
            self.robot['dir'] = direction

        reward = self.get_reward(direction)
    
        return reward
    
    def get_reward(self, direction):
        """
        Get the reward of the robot moving in the direction
        """
        if direction not in self.valid_actions:
            raise ValueError("Invalid Actions")
        
        reward = 0

        if self.is_hit_wall(self.robot['loc'], direction) and self.robot['loc'] != self.destination:
            reward = self.reward['hit_wall']
        else:
            new_x = self.robot["loc"][0] + self.move_map[direction][0]
            new_y = self.robot["loc"][1] + self.move_map[direction][1]
            # if (new_x, new_y) == self.destination:
            #     reward = self.reward['destination']
                # self.have_arrived = True
            if self.robot['loc'] == self.destination:   # 修改了终点reward的判断条件
                reward = self.reward['destination']
            else:
                reward = self.reward['default']

        # add heuristic value to reward
        # reward -= (self.maze_size * 2 - self.heuristic(self.robot['loc'])) * 0.1
        # reward_to_des = self.heuristic(self.robot['loc'])
        # # print("h:", reward_to_des)
        # reward += reward_to_des
        # encourage the robot to explore more
        # if self.robot['loc'] not in self.path:
        #     self.path.append(self.robot['loc'])
        #     if self.have_arrived:
        #         reward -= 0.5
        #     else:
        #         reward -= 2.0

        # set penalty for vibrate between two locations
        # if self.last_last_loc == self.robot['loc']:
        #     reward += 20
                
        # if the next location is near the destination, give a reward
        # if self.heuristic(self.robot['loc']) < 2:
        #     reward -= 40

        self.last_last_loc = self.last_loc
        self.last_loc = self.robot['loc']

        return reward
    
    def heuristic(self, loc):
        """
        Calculate the heuristic value of the current location
        """
        return abs(loc[0] - self.destination[0]) + abs(loc[1] - self.destination[1])

    def sense_robot(self):
        return self.robot['loc']

    def reset_robot(self):
        self.robot["loc"] = (0, 0)
        self.path = []
        self.last_last_loc = None
        self.last_loc = None

    def draw_robot(self):
        # 绘制机器人所在位置
        x, y = self.robot['loc'][0] + 0.5, self.robot['loc'][1] + 0.5
        ellipse = plt.Circle((y, x), 0.4, color='red')
        plt.gca().add_patch(ellipse)

    def generate_maze(self, maze_size):
        """
            prim随机迷宫算法
            :param maze_size: 迷宫的宽度，生成迷宫尺寸为 maze_size * maze_size
        """
        map_shape = maze_size + (4,)
        mark = np.zeros(maze_size, dtype=int)
        maze_data = np.zeros(map_shape, dtype=int)

        mark[self.start_point] = 1
        walls = []

        for i in range(4):  # init the walls
            wall = self.start_point + (i,)
            if maze_data[wall] == 0 and not self.is_edge(wall, maze_size):
                walls.append(wall)

        while len(walls):
            index = random.randint(0, len(walls) - 1)
            wall = walls[index]

            grid_1 = (wall[0], wall[1])
            grid_2 = (0, 0)

            if wall[2] == 0:  # up
                grid_2 = (wall[0] - 1, wall[1])
            elif wall[2] == 1:  # right
                grid_2 = (wall[0], wall[1] + 1)
            elif wall[2] == 2:  # down
                grid_2 = (wall[0] + 1, wall[1])
            elif wall[2] == 3:  # left
                grid_2 = (wall[0], wall[1] - 1)

            if mark[grid_1] == 0 or mark[grid_2] == 0:
                # 打通两面墙
                maze_data[wall] = 1
                maze_data[grid_2 + (wall[2] + 2 if wall[2] +
                                                   2 < 4 else wall[2] - 2,)] = 1
                mark[grid_2] = 1
                # 将该格子的墙加入列表
                for j in range(4):
                    if maze_data[grid_2 + (j,)] == 0 and not self.is_edge(grid_2 + (j,), maze_size):
                        walls.append(grid_2 + (j,))
            else:
                walls.pop(index)
        return maze_data

    def draw_maze(self):
        grid_size = 1
        r, c, w = self.maze_data.shape

        # 设置左上角为坐标原点
        ax = plt.gca()
        ax.xaxis.set_ticks_position('top')
        ax.invert_yaxis()
        plt.axis('off')

        for i in range(r):  # 绘制墙壁
            for j in range(c):
                walls = self.maze_data[i, j]
                start_x = j * grid_size
                start_y = i * grid_size
                # print("(", start_x, start_y, ")", ",", self.maze_data[i, j])
                for z in range(4):
                    if walls[z] == 0:
                        # draw line U:0 R:1 D:2 L:3
                        if z == 0:
                            plt.hlines(start_y, start_x, start_x +
                                       grid_size, color="black")
                        elif z == 1:
                            plt.vlines(start_x + grid_size, start_y,
                                       start_y + grid_size, color="black")
                        elif z == 2:
                            plt.hlines(start_y + grid_size, start_x,
                                       start_x + grid_size, color="black")
                        elif z == 3:
                            plt.vlines(start_x, start_y, start_y +
                                       grid_size, color="black")
        # 绘制出入口
        rect_2 = plt.Rectangle(self.destination, grid_size,
                               grid_size, edgecolor=None, color="green")
        ax.add_patch(rect_2)

    def is_edge(self, wall, shape):
        # 如果为边缘的墙
        if wall[1] == 0 and wall[2] == 3:  # left edge
            return True
        elif wall[0] == 0 and wall[2] == 0:  # up edge
            return True
        elif wall[1] == shape[0] - 1 and wall[2] == 1:  # right edge
            return True
        elif wall[0] == shape[1] - 1 and wall[2] == 2:  # down edge
            return True
        else:
            return False

    def can_move_actions(self, position):
        # 获取当前机器人能够合法移动的方向（即不允许越过墙）
        actions = ['u', 'r', 'd', 'l']
        results = []
        # trans_position = (position[1], position[0])
        for a in actions:
            if not self.is_hit_wall(position, a):
                results.append(a)
        return results
    
    def generate_state_representation(self, filename="maze_state.png"):
        # 创建一个空白画布
        # print("generate_state_representation")
        fig, ax = plt.subplots()
        ax.set_xticks([])
        ax.set_yticks([])
        
        # 绘制迷宫
        self.draw_maze()

        # 绘制机器人
        x, y = self.robot['loc'][1] + 0.5, self.robot['loc'][0] + 0.5
        ellipse = plt.Circle((x, y), 0.4, color='red')
        ax.add_patch(ellipse)

        # fig.savefig(filename)
        fig.canvas.draw()
        # image = np.array(fig.canvas.renderer.buffer_rgba())
        image = np.frombuffer(fig.canvas.tostring_rgb(), dtype=np.uint8)
        image = image.reshape(fig.canvas.get_width_height()[::-1] + (3,))
        plt.close(fig)
        resized_image = cv2.resize(image, (128, 128), interpolation = cv2.INTER_AREA)  # 假设神经网络期望的大小为 128x128

        # 将图像转换为灰度图像
        gray_image = cv2.cvtColor(resized_image, cv2.COLOR_RGBA2GRAY)

        # 将图像值归一化到 [0, 1] 范围
        normalized_image = gray_image / 255.0
        # print(type(normalized_image))
        # 返回处理后的图像
        return normalized_image
    
    def process_image(self, filename):
        # 读取图像并转换为灰度图像
        image = cv2.imread(filename, cv2.IMREAD_GRAYSCALE)

        # 将图像大小调整为神经网络期望的大小
        resized_image = cv2.resize(image, (128, 128))  # 假设神经网络期望的大小为 128x128

        # 将图像值归一化到 [0, 1] 范围
        normalized_image = resized_image / 255.0
        cv2.imwrite("processed_image.png", normalized_image * 255.0)
        # 返回处理后的图像
    
        return normalized_image


if __name__ == "__main__":
    # import copy
    # maze = Maze(maze_size=3)
    # maze_copy = Maze(maze_size=3)
    # print(maze.sense_robot())
    # print(maze_copy.sense_robot())
    # maze.move_robot("r")
    # print(maze.sense_robot())
    # print(maze_copy.sense_robot())
    maze = Maze(maze_size=11)
    maze.generate_state_representation(filename="maze_state.png")
    maze.process_image("maze_state.png")