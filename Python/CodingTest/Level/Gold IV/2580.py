#2239 스도쿠

import sys

arr = [list(map(int, sys.stdin.readline().split())) for _ in range(9)]

zero = []
def bt(idx):
    i, j = zero[idx][0], zero[idx][1]
    for n in range(1, 10):
        available = True

        for r in range(9):
            if r == i:
                continue
            if arr[r][j] == n:
                available = False
                break

        for c in range(9):
            if c == j:
                continue
            if arr[i][c] == n:
                available = False
                break

        if not available:
            continue

        ta = i//3
        tb = j//3

        for r in range(ta*3,ta*3+3):
            if not available:
                break
            for c in range(tb*3,tb*3+3):
                if arr[r][c] == n:
                    available = False
                    break

        if available:
            arr[i][j] = n

            if idx == len(zero)-1:
                for k in range(9):
                    print(*arr[k])
                exit()

            bt(idx+1)
            arr[i][j] = 0




for i in range(9):
    for j in range(9):
        if arr[i][j] == 0:
            zero.append((i, j))

bt(0)