#1149 RGB 거리

import sys

n = int(sys.stdin.readline())

houses = []

for _ in range(0, n):
    houses.append(list(map(int, sys.stdin.readline().split())))


for i in range(1, len(houses)):
    for j in range(0,3):
        if j == 0:
            houses[i][j] += min(houses[i-1][1], houses[i-1][2])
        elif j == 1:
            houses[i][j] += min(houses[i - 1][0], houses[i - 1][2])
        else:
            houses[i][j] += min(houses[i - 1][0], houses[i - 1][1])

print(min(houses[-1]))