def pcp_solver(A, B):
    from itertools import product
    
    if len(A) != len(B):
        return None
    
    n = len(A)
    for length in range(1, 11):  # 限制序列的最大长度为10
        for indices in product(range(n), repeat=length):
            concat_A = ''.join(A[i] for i in indices)
            concat_B = ''.join(B[i] for i in indices)
            if concat_A == concat_B:
                return [index + 1 for index in indices]

    return None

# 定义问题
problems = [
    (["bbb", "abb"], ["bb", "babbb"]),
    (["a", "aa", "baaa"], ["aab", "bb", "a"]),
    (["baa", "a", "b"], ["b", "baa", "aa"]),
    (["bab", "b", "a"], ["a", "bab", "b"]),
    (["bba", "a", "b"], ["b", "bbb", "ab"])
]

# 解决每个问题并输出结果
for i, (A, B) in enumerate(problems, start=1):
    solution = pcp_solver(A, B)
    if solution:
        print(f"问题 {i} 的解决方案: {solution}")
    else:
        print(f"问题 {i} 无解决方案")