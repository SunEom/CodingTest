#6198 옥상정원 꾸미기

import sys
input = sys.stdin.readline

n = int(input())
arr = [(i,int(input())) for i in range(n)]

stack = []
result = [0 for _ in range(n)]

for idx, height in arr:
    if len(stack) == 0:
        stack.append((idx, height))
    else:
        while len(stack) != 0 and stack[-1][1] <= height:
            p = stack.pop()
            result[p[0]] = idx - p[0] - 1
        stack.append((idx, height))

for idx, height in stack:
    result[idx] = n - 1 - idx
print(sum(result))
