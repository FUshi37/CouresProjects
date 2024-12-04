from abc import ABC

import torch.nn as nn
import torch
import torch.nn.functional as F


class QNetwork(nn.Module, ABC):
    """Actor (Policy) Model."""

class QNetwork(nn.Module):
    def __init__(self, input_channels, action_size, seed):
        super(QNetwork, self).__init__()
        self.seed = torch.manual_seed(seed)
        
        # 定义卷积层
        self.conv1 = nn.Conv2d(input_channels, 32, kernel_size=8, stride=4)
        self.conv2 = nn.Conv2d(32, 64, kernel_size=4, stride=2)
        self.conv3 = nn.Conv2d(64, 64, kernel_size=3, stride=1)
        
        # 定义全连接层
        self.fc1 = nn.Linear(144, 512)
        self.fc2 = nn.Linear(512, action_size)
        
    def forward(self, state):
        # 图像经过卷积层和激活函数处理
        x = F.relu(self.conv1(state))
        x = F.relu(self.conv2(x))
        x = F.relu(self.conv3(x))
        
        # 将卷积后的结果展平
        x = x.view(x.size(0), -1)
        
        # 过全连接层
        x = F.relu(self.fc1(x))
        x = self.fc2(x)
        return x


if __name__ == "__main__":
    # print pytorch version
    print(torch.__version__)


    # os.environ["CUDA_LAUNCH_BLOCKING"] = "1"
    device = torch.device("cuda:0") if torch.cuda.is_available() else torch.device("cpu")
    # device = torch.device("cpu")
    net = QNetwork(2, 4, 0).to(device)

    x = torch.tensor([1, 1]).float().unsqueeze(0).to(device)
    #
    # torch.nn.DataParallel(net, device_ids=[0])
    print(net(x))
