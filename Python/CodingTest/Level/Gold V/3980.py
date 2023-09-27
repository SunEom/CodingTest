#3980 선발 명단

import sys

t = int(sys.stdin.readline())

def bt(idx, checked, value):
    global result
    if idx == 11:
        result = max(result, value)
        return
    for i in range(11):
        if arr[idx][i] != 0 and checked[i] == False:
            t = checked.copy()
            t[i] = True
            bt(idx+1, t, value + arr[idx][i])


for _ in range(t):
    result = 0
    arr = []
    for _ in range(11):
        arr.append(list(map(int, sys.stdin.readline().split())))
    bt(0, [False for _ in range(11)], 0)
    print(result)
