#2170 선긋기

import sys

n = int(sys.stdin.readline())

lines = [list(map(int, sys.stdin.readline().split())) for _ in range(n)]
lines.sort(key=lambda x:x[0])
endPoint = lines[0][1]
result = lines[0][1] - lines[0][0]

for i in range(1, len(lines)):
    if endPoint >= lines[i][1]:
        continue

    if endPoint > lines[i][0]:
        result += lines[i][1] - endPoint
    else:
        result += lines[i][1] - lines[i][0]

    endPoint = lines[i][1]

print(result)