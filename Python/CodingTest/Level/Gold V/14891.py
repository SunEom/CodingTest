#14891 톱니바퀴

import sys

arr = []
pos = [0,0,0,0]
for _ in range(4):
    temp = list(map(int, list(sys.stdin.readline().strip())))
    arr.append(temp)


k = int(sys.stdin.readline())

def spin(idx, prev, direction):
    if idx == 0:
        if idx + 1 != prev and arr[idx][(pos[idx] + 2) % 8] != arr[idx + 1][(pos[idx + 1] + 6) % 8]:
            spin((idx + 1)%4, idx, -direction)

    elif idx == 1 or idx == 2:

        if prev != idx+1 and arr[idx][(pos[idx] + 2) % 8] != arr[idx + 1][(pos[idx + 1] + 6) % 8]:
            spin((idx + 1)%4, idx, -direction)

        if prev != idx-1 and arr[idx][(pos[idx] + 6) % 8] != arr[idx - 1][(pos[idx - 1] + 2) % 8]:
            spin((idx + 3)%4, idx, -direction)
    else:
        if prev != idx-1 and arr[idx][(pos[idx] + 6) % 8] != arr[idx - 1][(pos[idx - 1] + 2) % 8]:
            spin((idx + 3)%4, idx, -direction)

    pos[idx] = ((pos[idx] - direction) + 8) % 8


for _ in range(k):
    n, d = map(int, sys.stdin.readline().split())
    spin(n-1, -1, d)

result = 0
for i in range(4):
    result += 2**i * arr[i][pos[i]]

print(result)