#5427 불

import sys

t = int(sys.stdin.readline())

for _ in range(t):
    c, r = map(int, sys.stdin.readline().split())

    sg = []
    fires = []
    arr =[]

    for i in range(r):
        temp = list(sys.stdin.readline().strip())
        arr.append(temp)
        for j in range(c):
            if temp[j] == "@":
                sg = [(i, j, "@", 0)]
            elif temp[j] == "*":
                fires.append((i,j,"*",-1))

    queue = fires + sg

    directions = [(1,0),(0,1),(-1,0),(0,-1)]
    impossible = True
    idx = 0
    while idx < len(queue) and impossible:
        pr, pc, ps, pt = queue[idx]

        if ps == "@":
            for dr, dc in directions:
                tr, tc = dr+pr, dc+pc
                if 0<=tr<r and 0<=tc<c:
                    if arr[tr][tc] == ".":
                        arr[tr][tc] = "@"
                        queue.append((tr, tc, "@", pt+1))
                else:
                    print(pt+1)
                    impossible = False
                    break
        else:
            for dr, dc in directions:
                tr, tc = dr+pr, dc+pc
                if 0<=tr<r and 0<=tc<c:
                    if arr[tr][tc] == "." or arr[tr][tc] == "@":
                        arr[tr][tc] = "*"
                        queue.append((tr, tc, "*", pt))

        idx += 1


    if impossible:
        print("IMPOSSIBLE")