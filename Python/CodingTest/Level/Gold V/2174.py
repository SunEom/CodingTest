#2174 로봇 시뮬레이션

import sys


direction = {"E":(0, 1), "W": (0,-1), "S":(-1, 0), "N":(1,0)}

a, b = map(int, sys.stdin.readline().split())
n, m = map(int, sys.stdin.readline().split())

robots = [[]]

def solve():
    for _ in range(n):
        x, y, d = sys.stdin.readline().split()
        robots.append([int(y), int(x), d])

    for _ in range(m):
        num, o, c = sys.stdin.readline().split()
        num = int(num)
        c = int(c)

        for _ in range(c):
            if o == "F":
                robots[num][0] += direction[robots[num][2]][0]
                robots[num][1] += direction[robots[num][2]][1]
                if not 1 <= robots[num][0] <= b or not 1 <= robots[num][1] <= a:
                    print(f"Robot {num} crashes into the wall")
                    return
                else:
                    for i in range(1, len(robots)):
                        if num != i and (robots[i][0], robots[i][1]) == (robots[num][0], robots[num][1]):
                            print(f"Robot {num} crashes into robot {i}")
                            return
            elif o == "L":
                if robots[num][2] == "E":
                    robots[num][2] = "N"
                elif robots[num][2] == "W":
                    robots[num][2] = "S"
                elif robots[num][2] == "S":
                    robots[num][2] = "E"
                elif robots[num][2] == "N":
                    robots[num][2] = "W"
            elif o == "R":
                if robots[num][2] == "E":
                    robots[num][2] = "S"
                elif robots[num][2] == "W":
                    robots[num][2] = "N"
                elif robots[num][2] == "S":
                    robots[num][2] = "W"
                elif robots[num][2] == "N":
                    robots[num][2] = "E"
    print("OK")

solve()