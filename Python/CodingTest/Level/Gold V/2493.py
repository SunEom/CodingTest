#2493 탑
import sys

n = int(sys.stdin.readline())
arr = list(map(int, sys.stdin.readline().split()))
result = [0 for _ in range(n)]
stack = []

for i in range(n-1, -1, -1):
    while len(stack)>0 and stack[-1][1] < arr[i]:
        p = stack.pop(-1)
        result[p[0]] = i+1
    stack.append((i, arr[i]))

print(*result)