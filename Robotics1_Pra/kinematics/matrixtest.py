import numpy as np

if __name__ == "main":
    # 求矩阵的逆
    A = np.mat([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
    print("A\n", A)
    inverse = A.I
    print("inverse of A\n", inverse)
    print("Check\n", A * inverse)
    print()