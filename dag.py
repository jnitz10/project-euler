import networkx as nx
import matplotlib.pyplot as plt

n = open('triangle.txt', 'r')

lines = n.readlines()
lines2 = [line.strip('\n') for line in lines]
lines3 = [line.split() for line in lines2]
nums = [list(map(int, line)) for line in lines3]
nums2 = [lst + [0] * (len(nums[-1]) - len(lst)) for lst in nums]



def getsum(lst):
    for i in range(len(lst)-2, -1, -1):
        for j in range(len(lst[i])):
            lst[i][j] = lst[i][j] + max(lst[i+1][j], lst[i+1][j+1])
        lst.pop()
    return lst[0][0]

print(getsum(nums))