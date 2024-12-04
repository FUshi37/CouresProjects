import numpy as np
import random

import torch
import torch.nn.functional as F
from torch import optim

from QRobot import QRobot
from Maze import Maze
from ReplayDataSet import ReplayDataSet
from torch_py.QNetwork import QNetwork

class Robot(QRobot):
    valid_action = ['u', 'r', 'd', 'l']

    ''' QLearning parameters'''
    epsilon = 1  # 初始贪心算法探索概率
    gamma = 0.9  # 公式中的 γ
    epsilon_decay = 0.98  # 每次更新衰减率

    EveryUpdate = 1  # the interval of target model's updating
    EveryUpdateTarget = 10
    
    learning_rate = 2e-2
    """some parameters of neural network"""
    target_model = None
    eval_model = None
    batch_size = 32
    # learning_rate = 2e-2
    TAU = 1e-3
    step = 1  # 记录训练的步数

    """setting the device to train network"""
    device = torch.device("cuda:0") if torch.cuda.is_available() else torch.device("cpu")

    def __init__(self, maze):
        """
        初始化 Robot 类
        :param maze:迷宫对象
        """
        super(Robot, self).__init__(maze)
        maze.set_reward(reward={
            "hit_wall": 10.,
            "destination": -maze.maze_size**2 * 3.,
            "default": 1,
        })
        self.maze = maze
        self.maze_size = maze.maze_size
        
        self.epsilon = self.epsilon
        self.gamma = self.gamma
        
        self.epsilon_decay = self.epsilon_decay
        self.batch_size = pow(2, int(self.maze_size/2 + 3)) 
        if self.batch_size > 256:
            self.batch_size = 256
        self.learning_rate = self.learning_rate / self.maze_size 
        

        """build network"""
        self.target_model = None
        self.eval_model = None
        self._build_network()

        """create the memory to store data"""
        max_size = max(self.maze_size ** 2 * 3, 1e4)
        self.memory = ReplayDataSet(max_size=max_size)
        self.memory.build_full_view(maze)

    def _build_network(self):
        seed = 0
        random.seed(seed)

        """build target model"""
        self.target_model = QNetwork(state_size=2, action_size=4, seed=seed).to(self.device)

        """build eval model"""
        self.eval_model = QNetwork(state_size=2, action_size=4, seed=seed).to(self.device)

        """build the optimizer"""
        self.optimizer = optim.Adam(self.eval_model.parameters(), lr=self.learning_rate)
        # self.optimizer = optim.SGD(self.eval_model.parameters(), lr=self.learning_rate)

    def target_replace_op(self):
        """
            Soft update the target model parameters.
            θ_target = τ*θ_local + (1 - τ)*θ_target
        """

        # for target_param, eval_param in zip(self.target_model.parameters(), self.eval_model.parameters()):
        #     target_param.data.copy_(self.TAU * eval_param.data + (1.0 - self.TAU) * target_param.data)

        """ replace the whole parameters"""
        self.target_model.load_state_dict(self.eval_model.state_dict())

    def _choose_action(self, state):
        state = np.array(state)
        state = torch.from_numpy(state).float().to(self.device)
        if random.random() < self.epsilon:
            action = random.choice(self.valid_action)
        else:
            self.eval_model.eval()
            with torch.no_grad():
                q_next = self.eval_model(state).cpu().data.numpy()  # use target model choose action
            self.eval_model.train()

            action = self.valid_action[np.argmin(q_next).item()]
        return action

    def _learn(self, batch: int = 16):
        if len(self.memory) < batch:
            print("the memory data is not enough")
            return
        state, action_index, reward, next_state, is_terminal = self.memory.random_sample(batch)

        """ convert the data to tensor type"""
        state = torch.from_numpy(state).float().to(self.device)
        action_index = torch.from_numpy(action_index).long().to(self.device)
        reward = torch.from_numpy(reward).float().to(self.device)
        next_state = torch.from_numpy(next_state).float().to(self.device)
        is_terminal = torch.from_numpy(is_terminal).int().to(self.device)

        self.eval_model.train()
        self.target_model.eval()

        """Get max predicted Q values (for next states) from target model"""
        Q_targets_next = self.target_model(next_state).detach().min(1)[0].unsqueeze(1)

        """Compute Q targets for current states"""
        Q_targets = reward + self.gamma * Q_targets_next * (torch.ones_like(is_terminal) - is_terminal)

        """Get expected Q values from local model"""
        self.optimizer.zero_grad()
        Q_expected = self.eval_model(state).gather(dim=1, index=action_index)

        """Compute loss"""
        loss = F.mse_loss(Q_expected, Q_targets)
        loss_item = loss.item()

        """ Minimize the loss"""
        loss.backward()
        self.optimizer.step()

        """copy the weights of eval_model to the target_model"""
        if self.step % (self.EveryUpdateTarget) == 0:
            self.target_replace_op()
        return loss_item

    def train_update(self):
        state = self.sense_state()
        action = self._choose_action(state)
        reward = self.maze.move_robot(action)
        next_state = self.sense_state()
        is_terminal = 1 if next_state == self.maze.destination or next_state == state else 0

        self.memory.add(state, self.valid_action.index(action), reward, next_state, is_terminal)
        
        # if is_terminal:
        #     self.epsilon = 0.2
        
        """--间隔一段时间更新target network权重--"""
        if self.step % self.EveryUpdate == 0:
            # self._learn(batch=32)
            loss = self._learn(batch=self.batch_size)
            # print("step:%d, loss:%.2f" % (self.step, loss))
            # print(loss)

        """---update the step and epsilon---"""
        self.step += 1
        # self.epsilon = max(0.01, self.epsilon * 0.995)
        self.epsilon = max(0.01, self.epsilon * self.epsilon_decay)
        # print(self.epsilon)
        

        return action, reward

    def test_update(self):
        state = np.array(self.sense_state(), dtype=int)
        state = torch.from_numpy(state).float().to(self.device)

        self.eval_model.eval()
        with torch.no_grad():
            q_value = self.eval_model(state).cpu().data.numpy()

        action = self.valid_action[np.argmin(q_value).item()]
        reward = self.maze.move_robot(action)
        return action, reward


from QRobot import QRobot
from Maze import Maze
from Runner import Runner
from torch_py.MinDQNRobot import MinDQNRobot

"""  Deep Qlearning 算法相关参数： """

epoch = 100  # 训练轮数
maze_size = 11 # 迷宫size
training_per_epoch=int(maze_size * maze_size * 3)

""" 使用 DQN 算法训练 """

g = Maze(maze_size=maze_size)
myrobot = Robot(g)
# myrobot = MinDQNRobot(g)
# myrobot.memory.build_full_view(g)
runner = Runner(myrobot)
runner.run_training(epoch, training_per_epoch)

# # 生成训练过程的gif图, 建议下载到本地查看；也可以注释该行代码，加快运行速度。
# runner.generate_gif(filename="results/dqn_size10.gif")

"""Test Robot"""    
myrobot.reset()
for _ in range(25):
    a, r = myrobot.test_update()
    loc = myrobot.maze.robot['loc']
    print("action:%s, reward:%.2f, loc:%s" % (a, r, loc))
    if myrobot.maze.robot['loc'] == myrobot.maze.destination:
        print("success")
        break

print(g)
runner.plot_results()
