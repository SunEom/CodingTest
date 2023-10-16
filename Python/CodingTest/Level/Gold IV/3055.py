#3055 탈출

import sys
r, c = map(int, sys.stdin.readline().split())

arr = []

water = []
start = (0,0)
goal = (0,0)

for i in range(r):
    temp = list(sys.stdin.readline().rstrip())
    arr.append(temp)
    for j in range(c):
        if temp[j] == "D":
            goal = (i,j)
        elif temp[j] == "S":
            start = (i,j)
        elif temp[j] == "*":
            water.append((i,j))

def solve():
    global water
    time = 0
    directions = [(1,0),(0,1),(-1,0),(0,-1)]
    pos = [start]

    while pos:
        newWater = []
        newPos = []
        time += 1
        #물이 먼저
        for wr, wc in water:
            for dr, dc in directions:
                tr = wr + dr
                tc = wc + dc

                if 0<=tr<r and 0<=tc<c and (arr[tr][tc] == "." or arr[tr][tc] == "S"):
                    arr[tr][tc] = "*"
                    newWater.append((tr, tc))
        water = newWater
        # 고슴도치
        for pr, pc in pos:
            for dr, dc in directions:
                tr = pr + dr
                tc = pc + dc

                if 0 <= tr < r and 0 <= tc < c:
                    if arr[tr][tc] == ".":
                        arr[tr][tc] = "S"
                        newPos.append((tr, tc))
                    if arr[tr][tc] == "D":
                        return time
        pos = newPos

    return -1

result = solve()

if result == -1:
    print("KAKTUS")
else:
    print(result)