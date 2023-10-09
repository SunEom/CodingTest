#1806 부분 합

import sys

n, s = map(int, sys.stdin.readline().split())
arr = list(map(int, sys.stdin.readline().split()))

total = 0
left = 0
right = 0
result = sys.maxsize

while True:
    if total >= s:
        result = min(result, right - left)
        total -= arr[left]
        left += 1
    elif right == n:
        break
    else:
        total += arr[right]
        right += 1

if result == sys.maxsize:
    print(0)
else:
    print(result)