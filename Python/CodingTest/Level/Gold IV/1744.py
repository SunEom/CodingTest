#1744 수 묶기

import sys

n = int(sys.stdin.readline())

pos, neg, zeroCnt, oneCnt = [], [], 0, 0

for _ in range(n):
    k = int(sys.stdin.readline())
    if k == 1:
        oneCnt += 1
    elif k > 0:
        pos.append(k)
    elif k < 0:
        neg.append(k)
    else:
        zeroCnt += 1

pos.sort(reverse=True)
neg.sort()

result = 0

i = 0
while i+1 < len(pos):
    result += pos[i]*pos[i+1]
    i += 2

if i < len(pos):
    result += pos[i]

i = 0
while i+1 < len(neg):
    result += neg[i]*neg[i+1]
    i += 2

if i < len(neg) and zeroCnt == 0:
    result += neg[i]

result += oneCnt
print(result)
