#3078 좋은 친구

import sys

n, k = map(int, sys.stdin.readline().split())
result = 0

arr = [sys.stdin.readline().rstrip() for _ in range(n)]

queue = []

now = {k: 0 for k in range(2, 21)}
i = 0
for name in arr:
    if len(queue) > k:
        now[queue[i]] -= 1
        i +=1

    length = len(name)

    result += now[length]
    now[length] += 1
    queue.append(length)

print(result)
