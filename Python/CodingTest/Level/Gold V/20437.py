#20437 문자열 게임 2

import sys
t = int(sys.stdin.readline())

for _ in range(t):
    w = sys.stdin.readline().strip()
    k = int(sys.stdin.readline())
    pos = {}
    for i in range(len(w)):
        if w[i] in pos:
            pos[w[i]].append(i)
        else:
            pos[w[i]] = [i]

    minValue = sys.maxsize
    maxValue = -1

    for c, li in pos.items():
        if len(li) < k:
            continue

        for i in range(len(li)-k+1):
            value = li[i+k-1] - li[i] + 1
            minValue = min(minValue, value)
            maxValue = max(maxValue, value)

    if minValue == sys.maxsize:
        print(-1)
    else:
        print(minValue, maxValue)




