# 训练数据
training_data = [
    ("Sunny", "Warm", "Normal", "Strong", "Warm", "Same", "Yes"),
    ("Sunny", "Warm", "High", "Strong", "Warm", "Same", "Yes"),
    ("Rainy", "Cold", "High", "Strong", "Warm", "Change", "No"),
    ("Sunny", "Warm", "High", "Strong", "Cool", "Change", "Yes"),
]

# 初始化 S 和 G 集合
S = [None] * (len(training_data[0]) - 1)
# G = [['?' for _ in range(len(training_data[0]) - 1)] for _ in range(len(training_data[0]) - 1)]
G = []

def find_s(training_example):
    if training_example[-1] == 'Yes':
        for i in range(len(training_example) - 1):
            if S[i] is None:
                S[i] = training_example[i]
            elif S[i] != training_example[i]:
                S[i] = '?'

def candidate_elimination(training_example):
    if training_example[-1] == 'No':
        for i in range(len(training_example) - 1):
            if S[i] != training_example[i] and S[i] != '?':
                new_list = []
                for j in range(6):
                    if j == i:
                        new_list.append(S[i])
                    new_list.append('?')
                G.append(new_list)

def version_space(training_example):
    find_s(training_example)
    candidate_elimination(training_example)
    print("Middle S:", S)
    print("Middle G:", G)
    # global S, G
    # attributes = training_example[:-1]
    # target = training_example[-1]
    # if target == 'Yes':
    #     for i in range(len(attributes)):
    #         if S[i] != attributes[i]:
    #             S[i] = '?'
    #             for j in range(len(G)):
    #                 if G[j][i] == attributes[i]:
    #                     G[j][i] = '?'
    # else:
    #     for i in range(len(attributes)):
    #         if S[i] == attributes[i]:
    #             S[i] = '?'
    #             for j in range(len(G)):
    #                 if G[j][i] != attributes[i] and G[j][i] != '?':
    #                     G[j] = ['?' if idx == i else value for idx, value in enumerate(G[j])]

# 执行算法
# for example in reversed(training_data):
# for example in training_data :
#     find_s(example)
    
# for example in training_data:
#     candidate_elimination(example)

for example in training_data:
    version_space(example)

# 打印结果
print("Final S:", S)
print("Final G:", G)
