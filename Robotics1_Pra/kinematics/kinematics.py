import numpy as np
import math
import IK.IK as IK

# euler

# 改进D-H参数
alpha = [0, -math.pi/2, 0, 0, math.pi/2, math.pi/2]
a = [0, 0, 0.185, 0.170, 0, 0]
d = [0.230, 0, 0, 0.023, 0.077, 0.0855] #i+1
# a = [0, 0, 185, 170, 0, 0]
# d = [230, 0, 0, 23, 77, 85.5] #i+1
theta = [0, 0, 0, 0, 0, 0] #i+1
ik_theta = np.zeros((6,8)) #i+1


# 正运动学齐次变换矩阵函数
def T( i, j ):
    global alpha
    global d
    global a
    global theta
    if j == 2 :
        T = np.array([[math.cos(theta[j-1] - math.pi/2), -math.sin(theta[j-1] - math.pi/2), 0, a[i]],
                      [math.sin(theta[j-1] - math.pi/2)*math.cos(alpha[i]), math.cos(theta[j-1] - math.pi/2)*math.cos(alpha[i]), -math.sin(alpha[i]), -math.sin(alpha[i])*d[j-1]], 
                      [math.sin(theta[j-1] - math.pi/2)*math.sin(alpha[i]), math.cos(theta[j-1] - math.pi/2)*math.sin(alpha[i]), math.cos(alpha[i]), math.cos(alpha[i])*d[j-1]], 
                      [0, 0, 0, 1]])
    elif j == 4 :
        T = np.array([[math.cos(theta[j-1] + math.pi/2), -math.sin(theta[j-1] + math.pi/2), 0, a[i]],
                      [math.sin(theta[j-1] + math.pi/2)*math.cos(alpha[i]), math.cos(theta[j-1] + math.pi/2)*math.cos(alpha[i]), -math.sin(alpha[i]), -math.sin(alpha[i])*d[j-1]],
                      [math.sin(theta[j-1] + math.pi/2)*math.sin(alpha[i]), math.cos(theta[j-1] + math.pi/2)*math.sin(alpha[i]), math.cos(alpha[i]), math.cos(alpha[i])*d[j-1]],
                      [0, 0, 0, 1]])
    elif j == 5 :
        T = np.array([[math.cos(theta[j-1] + math.pi/2), -math.sin(theta[j-1] + math.pi/2), 0, a[i]],
                      [math.sin(theta[j-1] + math.pi/2)*math.cos(alpha[i]), math.cos(theta[j-1] + math.pi/2)*math.cos(alpha[i]), -math.sin(alpha[i]), -math.sin(alpha[i])*d[j-1]],
                      [math.sin(theta[j-1] + math.pi/2)*math.sin(alpha[i]), math.cos(theta[j-1] + math.pi/2)*math.sin(alpha[i]), math.cos(alpha[i]), math.cos(alpha[i])*d[j-1]],
                      [0, 0, 0, 1]])
    else :
        T = np.array([[math.cos(theta[j-1]), -math.sin(theta[j-1]), 0, a[i]],
                      [math.sin(theta[j-1])*math.cos(alpha[i]), math.cos(theta[j-1])*math.cos(alpha[i]), -math.sin(alpha[i]), -math.sin(alpha[i])*d[j-1]],
                      [math.sin(theta[j-1])*math.sin(alpha[i]), math.cos(theta[j-1])*math.sin(alpha[i]), math.cos(alpha[i]), math.cos(alpha[i])*d[j-1]],
                      [0, 0, 0, 1]])
    return T

# 逆运动学齐次变换矩阵函数
def T_inv( i, j, k ):
    global alpha
    global d
    global a
    global theta
    if j == 5:
        T_inv = np.array([[math.cos(ik_theta[j-1][k] + math.pi/2), -math.sin(ik_theta[j-1][k] + math.pi/2), 0, a[i]],
                    [math.sin(ik_theta[j-1][k] + math.pi/2)*math.cos(alpha[i]), math.cos(ik_theta[j-1][k] + math.pi/2)*math.cos(alpha[i]), -math.sin(alpha[i]), -math.sin(alpha[i])*d[j-1]],
                    [math.sin(ik_theta[j-1][k] + math.pi/2)*math.sin(alpha[i]), math.cos(ik_theta[j-1][k] + math.pi/2)*math.sin(alpha[i]), math.cos(alpha[i]), math.cos(alpha[i])*d[j-1]],
                    [0, 0, 0, 1]])
    else :
        T_inv = np.array([[math.cos(ik_theta[j-1][k]), -math.sin(ik_theta[j-1][k]), 0, a[i]],
                        [math.sin(ik_theta[j-1][k])*math.cos(alpha[i]), math.cos(ik_theta[j-1][k])*math.cos(alpha[i]), -math.sin(alpha[i]), -math.sin(alpha[i])*d[j-1]],
                        [math.sin(ik_theta[j-1][k])*math.sin(alpha[i]), math.cos(ik_theta[j-1][k])*math.sin(alpha[i]), math.cos(alpha[i]), math.cos(alpha[i])*d[j-1]],
                        [0, 0, 0, 1]])

    return T_inv

# 正运动学
def forward_kinematics( ):
    global alpha
    global d
    global a
    global theta
    T_0_1 = T( 0 , 1 )
    T_1_2 = T( 1 , 2 )
    T_2_3 = T( 2 , 3 )
    T_3_4 = T( 3 , 4 )
    T_4_5 = T( 4 , 5 )
    T_5_6 = T( 5 , 6 )
    T_0_2 = np.dot( T_0_1, T_1_2 )
    T_0_3 = np.dot( T_0_2, T_2_3 )
    T_0_4 = np.dot( T_0_3, T_3_4 )
    T_0_5 = np.dot( T_0_4, T_4_5 )
    T_0_6 = np.dot( T_0_5, T_5_6 )
    return T_0_6

# 从齐次变换矩阵中提取旋转矩阵和位移
def extract_R_and_p( T ):
    R = T[0:3, 0:3]
    p = T[0:3, 3]
    return R, p

# 通过旋转矩阵和位移构造齐次变换矩阵
def construct_T( R, p ):
    T = np.eye(4)
    T[0:3, 0:3] = R
    T[0:3, 3] = p
    return T


# 旋转矩阵到X-Y-Z欧拉角
def rotation_matrix_to_euler_angles( R ):
    alpha = math.atan2(-R[1,2], R[2,2])
    beta = math.atan2(R[0,2], math.sqrt(R[0,0]**2 + R[0,1]**2))
    gamma = math.atan2(-R[0,1], R[0,0])
    return alpha, beta, gamma

# X-Y-Z欧拉角到旋转矩阵
def euler_angles_to_rotation_matrix( alpha, beta, gamma ):
    R = np.array([[math.cos(beta)*math.cos(gamma), -math.cos(beta)*math.sin(gamma), math.sin(beta)],
                  [math.cos(alpha)*math.sin(gamma)+math.cos(gamma)*math.sin(alpha)*math.sin(beta), math.cos(alpha)*math.cos(gamma)-math.sin(alpha)*math.sin(beta)*math.sin(gamma), -math.cos(beta)*math.sin(alpha)],
                  [math.sin(alpha)*math.sin(gamma)-math.cos(alpha)*math.cos(gamma)*math.sin(beta), math.cos(gamma)*math.sin(alpha)+math.cos(alpha)*math.sin(beta)*math.sin(gamma), math.cos(alpha)*math.cos(beta)]])
    return R


# # 便于逆运动学求解的矩阵
# def TK1( T_Real, t1, t6 ):
#     global alpha
#     global d
#     global a
#     global theta
#     Tk1_1 = np.dot(np.linalg.inv(T_inv( 0 , 1 , t1 )) , T_Real)
#     Tk1_2 = np.dot(Tk1_1 , np.linalg.inv(T_inv( 5 , 6 , t6 )))
#     Tk1 = np.dot(Tk1_1 , Tk1_2)
#     # Tk1 = np.dot(np.dot(np.linalg.inv(T_inv( 0 , 1 , t1 )),T_Real),np.linalg.inv(T_inv( 5 , 6 , t6 )))

#     return Tk1

# # 便于逆运动学求解的矩阵2
# def TK2( T_Real, t1, t6, t5 ):
#     global alpha
#     global d
#     global a
#     global theta
#     Tk2 = np.dot(TK1( T_Real, t1, t6 ),np.linalg.inv(T_inv( 4, 5, t5 )))
#     # print("Tk1 = ")
#     # print(TK1( T_Real, t1, t6 ))
#     # print("T_inv( 4, 5, t5 ) = ")
#     # print(T_inv( 4, 5, t5 ))
#     print("Tk2 = ")
#     print(Tk2)

#     return Tk2

# 逆运动学
def inverse_kinematics( T_Real ):
    global alpha
    global d
    global a
    global theta
    global ik_theta

    # 求解theta1
    m1 = T_Real[0,2]*d[5] - T_Real[0,3]
    n1 = T_Real[1,2]*d[5] - T_Real[1,3]
    ik_theta[0][:4] = (math.atan2(n1,m1) - math.atan2(-d[3],math.sqrt(m1**2+n1**2-d[3]**2)),)
    ik_theta[0][4:] = (math.atan2(n1,m1) - math.atan2(-d[3],-math.sqrt(m1**2+n1**2-d[3]**2)),)

    # 求解theta5
    # ik_theta[4][0:2] = (math.acos(T_Real[1,2]*math.cos(ik_theta[0][0]) - T_Real[0,2]*math.sin(ik_theta[0][0])),) #theta1 取第1值
    # ik_theta[4][2:4] = (-math.acos(T_Real[1,2]*math.cos(ik_theta[0][0]) - T_Real[0,2]*math.sin(ik_theta[0][0])),)
    # ik_theta[4][4:6] = (math.acos(T_Real[1,2]*math.cos(ik_theta[0][4]) - T_Real[0,2]*math.sin(ik_theta[0][4])),) #theta1 取第2值
    # ik_theta[4][6:] = (-math.acos(T_Real[1,2]*math.cos(ik_theta[0][4]) - T_Real[0,2]*math.sin(ik_theta[0][4])),)
    ik_theta[4][0:2] = (-math.asin(T_Real[0,2]*math.sin(ik_theta[0][0])-T_Real[1,2]*math.cos(ik_theta[0][0])),) #theta1 取第1值
    if ik_theta[4][0] >= 0 :
        ik_theta[4][2:4] = (math.pi - math.asin(T_Real[0,2]*math.sin(ik_theta[0][0])-T_Real[1,2]*math.cos(ik_theta[0][0])),) #theta1 取第1值
    else :
        ik_theta[4][2:4] = (-math.pi - math.asin(T_Real[0,2]*math.sin(ik_theta[0][0])-T_Real[1,2]*math.cos(ik_theta[0][0])),) #theta1 取第1值
    ik_theta[4][4:6] = (-math.asin(T_Real[0,2]*math.sin(ik_theta[0][4])-T_Real[1,2]*math.cos(ik_theta[0][4])),) #theta1 取第2值
    if ik_theta[4][4] >= 0 :
        ik_theta[4][6:] = (math.pi - math.asin(T_Real[0,2]*math.sin(ik_theta[0][4])-T_Real[1,2]*math.cos(ik_theta[0][4])),) #theta1 取第2值
    else :
        ik_theta[4][6:] = (-math.pi - math.asin(T_Real[0,2]*math.sin(ik_theta[0][4])-T_Real[1,2]*math.cos(ik_theta[0][4])),) #theta1 取第2值

    # 求解theta6
    m2 = [0,0]
    n2 = [0,0]
    m2[0] = T_Real[1,1]*math.cos(ik_theta[0][0]) - T_Real[0,1]*math.sin(ik_theta[0][0]) #theta1 取第1值
    m2[1] = T_Real[1,1]*math.cos(ik_theta[0][4]) - T_Real[0,1]*math.sin(ik_theta[0][4]) #theta1 取第2值
    n2[0] = T_Real[1,0]*math.cos(ik_theta[0][0]) - T_Real[0,0]*math.sin(ik_theta[0][0]) #theta1 取第1值
    n2[1] = T_Real[1,0]*math.cos(ik_theta[0][4]) - T_Real[0,0]*math.sin(ik_theta[0][4]) #theta1 取第2值
    ik_theta[5][0:2] = (math.atan2(n2[0],m2[0]) - math.atan2(math.cos(ik_theta[4][0]),0),) #theta1 取第1值
    ik_theta[5][2:4] = (math.atan2(n2[0],m2[0]) - math.atan2(math.cos(ik_theta[4][2]),0),) #theta1 取第1值
    ik_theta[5][4:6] = (math.atan2(n2[1],m2[1]) - math.atan2(math.cos(ik_theta[4][4]),0),) #theta1 取第2值
    ik_theta[5][6:] = (math.atan2(n2[1],m2[1]) - math.atan2(math.cos(ik_theta[4][6]),0),) #theta1 取第2值
    i = 0
    while i < 8 :
        if ik_theta[5][i] > math.pi*2 :
            ik_theta[5][i] = ik_theta[5][i] - 2*math.pi
        elif ik_theta[5][i] < -math.pi*2 :
            ik_theta[5][i] = ik_theta[5][i] + 2*math.pi
        i = i + 1

    # 求解theta3
    m3 = [0, 0, 0, 0]
    n3 = [0, 0, 0, 0]
    i = 0
    
    m3[0] = T_Real[2,3] - d[0] - T_Real[2,2]*d[5] - d[4]*T_Real[2,1]*math.cos(ik_theta[5][0]) - d[4]*T_Real[2,0]*math.sin(ik_theta[5][0]) #theta1 取第1值
    n3[0] = T_Real[0,3]*math.cos(ik_theta[0][0]) + T_Real[1,3]*math.sin(ik_theta[0][0]) - T_Real[1,2]*d[5]*math.sin(ik_theta[0][0]) - \
        T_Real[0,2]*d[5]*math.cos(ik_theta[0][0]) - d[4]*T_Real[1,0]*math.sin(ik_theta[0][0])*math.sin(ik_theta[5][0]) - \
        d[4]*T_Real[0,1]*math.cos(ik_theta[0][0])*math.cos(ik_theta[5][0]) - d[4]*T_Real[0,0]*math.cos(ik_theta[0][0])*math.sin(ik_theta[5][0]) \
        - d[4]*T_Real[1,1]*math.sin(ik_theta[0][0])*math.cos(ik_theta[5][0]) #theta1 取第1值
    m3[1] = T_Real[2,3] - d[0] - T_Real[2,2]*d[5] - d[4]*T_Real[2,1]*math.cos(ik_theta[5][2]) - d[4]*T_Real[2,0]*math.sin(ik_theta[5][2]) #theta1 取第1值
    n3[1] = T_Real[0,3]*math.cos(ik_theta[0][0]) + T_Real[1,3]*math.sin(ik_theta[0][0]) - T_Real[1,2]*d[5]*math.sin(ik_theta[0][0]) - \
        T_Real[0,2]*d[5]*math.cos(ik_theta[0][0]) - d[4]*T_Real[1,0]*math.sin(ik_theta[0][0])*math.sin(ik_theta[5][2]) - \
        d[4]*T_Real[0,1]*math.cos(ik_theta[0][0])*math.cos(ik_theta[5][2]) - d[4]*T_Real[0,0]*math.cos(ik_theta[0][0])*math.sin(ik_theta[5][2]) \
        - d[4]*T_Real[1,1]*math.sin(ik_theta[0][0])*math.cos(ik_theta[5][2]) #theta1 取第1值
    m3[2] = T_Real[2,3] - d[0] - T_Real[2,2]*d[5] - d[4]*T_Real[2,1]*math.cos(ik_theta[5][4]) - d[4]*T_Real[2,0]*math.sin(ik_theta[5][4]) #theta1 取第2值
    n3[2] = T_Real[0,3]*math.cos(ik_theta[0][4]) + T_Real[1,3]*math.sin(ik_theta[0][4]) - T_Real[1,2]*d[5]*math.sin(ik_theta[0][4]) - \
        T_Real[0,2]*d[5]*math.cos(ik_theta[0][4]) - d[4]*T_Real[1,0]*math.sin(ik_theta[0][4])*math.sin(ik_theta[5][4]) - \
        d[4]*T_Real[0,1]*math.cos(ik_theta[0][4])*math.cos(ik_theta[5][4]) - d[4]*T_Real[0,0]*math.cos(ik_theta[0][4])*math.sin(ik_theta[5][4]) \
        - d[4]*T_Real[1,1]*math.sin(ik_theta[0][4])*math.cos(ik_theta[5][4]) #theta1 取第2值
    m3[3] = T_Real[2,3] - d[0] - T_Real[2,2]*d[5] - d[4]*T_Real[2,1]*math.cos(ik_theta[5][6]) - d[4]*T_Real[2,0]*math.sin(ik_theta[5][6]) #theta1 取第2值
    n3[3] = T_Real[0,3]*math.cos(ik_theta[0][4]) + T_Real[1,3]*math.sin(ik_theta[0][4]) - T_Real[1,2]*d[5]*math.sin(ik_theta[0][4]) - \
        T_Real[0,2]*d[5]*math.cos(ik_theta[0][4]) - d[4]*T_Real[1,0]*math.sin(ik_theta[0][4])*math.sin(ik_theta[5][6]) - \
        d[4]*T_Real[0,1]*math.cos(ik_theta[0][4])*math.cos(ik_theta[5][6]) - d[4]*T_Real[0,0]*math.cos(ik_theta[0][4])*math.sin(ik_theta[5][6]) \
        - d[4]*T_Real[1,1]*math.sin(ik_theta[0][4])*math.cos(ik_theta[5][6]) #theta1 取第2值

    print(m3[0]**2 + n3[0]**2 - (a[2] + a[3])**2)
    print(m3[1]**2 + n3[1]**2 - (a[2] + a[3])**2)
    print(m3[2]**2 + n3[2]**2 - (a[2] + a[3])**2)
    print(m3[3]**2 + n3[3]**2 - (a[2] + a[3])**2)
    if m3[0]**2 + n3[0]**2 <= (a[2] + a[3])**2 :
        ik_theta[2][0] = math.acos((m3[0]**2 + n3[0]**2 - a[2]**2 - a[3]**2) / (2*a[2]*a[3])) #theta1 取第1值
        ik_theta[2][1] = -math.acos((m3[0]**2 + n3[0]**2 - a[2]**2 - a[3]**2) / (2*a[2]*a[3])) #theta1 取第1值
    if m3[1]**2 + n3[1]**2 <= (a[2] + a[3])**2 :
        ik_theta[2][2] = math.acos((m3[1]**2 + n3[1]**2 - a[2]**2 - a[3]**2) / (2*a[2]*a[3])) #theta1 取第1值
        ik_theta[2][3] = -math.acos((m3[1]**2 + n3[1]**2 - a[2]**2 - a[3]**2) / (2*a[2]*a[3])) #theta1 取第1值
    if m3[2]**2 + n3[2]**2 <= (a[2] + a[3])**2 :
        ik_theta[2][4] = math.acos((m3[2]**2 + n3[2]**2 - a[2]**2 - a[3]**2) / (2*a[2]*a[3])) #theta1 取第2值
        ik_theta[2][5] = -math.acos((m3[2]**2 + n3[2]**2 - a[2]**2 - a[3]**2) / (2*a[2]*a[3])) #theta1 取第2值
    if m3[3]**2 + n3[3]**2 <= (a[2] + a[3])**2 :
        ik_theta[2][6] = math.acos((m3[3]**2 + n3[3]**2 - a[2]**2 - a[3]**2) / (2*a[2]*a[3])) #theta1 取第2值
        ik_theta[2][7] = -math.acos((m3[3]**2 + n3[3]**2 - a[2]**2 - a[3]**2) / (2*a[2]*a[3])) #theta1 取第2值

    # 求解theta2
    i = 0
    while i < 8 :
        # A = np.array([[-a[3]*math.sin(ik_theta[2][i]), a[3]*math.cos(ik_theta[2][i]) + a[2]],
        #             [a[3]*math.cos(ik_theta[2][i]) + a[2], a[3]*math.sin(ik_theta[2][i])]])
        # B = np.array([[m3[int(i/2)]], [n3[int(i/2)]]])
        # C = np.dot(np.linalg.inv(A),B)
        s = (a[2]*n3[int(i/2)]+a[3]*math.cos(ik_theta[2][i])*n3[int(i/2)]-a[3]*m3[int(i/2)]*math.sin(ik_theta[2][i])) / (a[2]**2+a[3]**2+2*a[2]*a[3]*math.cos(ik_theta[2][i])) 
        c = (a[2]*m3[int(i/2)]+a[3]*math.cos(ik_theta[2][i])*m3[int(i/2)]+a[3]*n3[int(i/2)]*math.sin(ik_theta[2][i])) / (a[2]**2+a[3]**2+2*a[2]*a[3]*math.cos(ik_theta[2][i])) 
        ik_theta[1][i] = math.atan2(s,c) 
        i = i + 1

    # 求解theta4
    i = 0
    while i < 8 :
        s4 = T_Real[0,1]*math.cos(ik_theta[0][i])*math.cos(ik_theta[5][i]) + T_Real[0,0]*math.cos(ik_theta[0][i])*math.sin(ik_theta[5][i]) + \
            T_Real[1][1]*math.cos(ik_theta[5][i])*math.sin(ik_theta[0][i]) + T_Real[1][0]*math.sin(ik_theta[0][i])*math.sin(ik_theta[5][i])
        c4 = T_Real[2,1]*math.cos(ik_theta[5][i]) + T_Real[2,0]*math.sin(ik_theta[5][i])
        ik_theta[3][i] = math.atan2(s4,c4) - ik_theta[2][i] - ik_theta[1][i]
        i = i + 1

    return ik_theta

# 主程序
if __name__ == '__main__':
    # 正运动学过程
    i = 0
    while i < 6 :
        # theta[i] = math.pi/12
        theta[i] = 0
        i = i + 1
    # theta = [math.pi/6, 0, math.pi/6, 0, math.pi/3, 0]
    # theta = [math.pi/6, math.pi/6, math.pi/3, 0, math.pi/3, math.pi/6]
    # theta = [math.pi/2, 0, math.pi/2, -math.pi/3, math.pi/3, math.pi/6]
    # theta = [-math.pi/6, -math.pi/6, -math.pi/3, 0, math.pi/12, math.pi/2]
    # theta = [math.pi/12, math.pi/12, math.pi/12, math.pi/12, math.pi/12, math.pi/12]

    forward_T = forward_kinematics()
    print(forward_T)
    print("euler = ", end="")
    print(rotation_matrix_to_euler_angles( extract_R_and_p( forward_T )[0] ))
    print("p = ", end="")
    print(extract_R_and_p( forward_T )[1])

    # 逆运动学过程
    iks = IK.IKSolver()
    # real_T = np.array([[ 0.39577807, -0.8131552,  -0.4267767,   0.13850343],
    # [ 0.36486746, -0.28723463,  0.88564553,  0.14642323],
    # [-0.84275231, -0.50623601,  0.1830127,   0.6260154 ],
    # [ 0,           0,           0,           1        ]])
    # rp = np.array([0.117, 0.334, 0.499, -2.019, -0.058, -2.190])
    # rp = [-0.066,0.339,0.444,-2.618,-0.524,-3.141]
    # rp = [0.3,0.25,0.26,-2.64,0.59,-2.35]
    # rp = [0.42,0,0.36,3.14,1,-1.57]
    rp = [0.32,-0.25,0.16,3,0.265,-0.84]
    

    # real_R = euler_angles_to_rotation_matrix( rp[3], rp[4], rp[5] )
    # real_p = np.array([rp[0],rp[1],rp[2]])
    # real_T = construct_T( real_R, real_p )
    # print(real_T)
    # ik_theta = inverse_kinematics( real_T )
    
    # [x, y, z, rx, ry, rz] (Cartesian, meter; X-Y'-Z'Euler, rad)
    q_result = iks.solve(rp)
    print(q_result.T)

    # 格式化ik_theta输出，为0的角度对应的组舍弃
    # i = 0
    # while i < 6 :
    #     j = 0
    #     while j < 8 :
    #         if ik_theta[i][j] == 0 :
    #             ik_theta[i][j] = ik_theta[i][j] + 2*math.pi
    #         j = j + 1
    #     i = i + 1

    # print("ik_theta = ")
    # print(ik_theta)