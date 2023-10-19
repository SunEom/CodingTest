#5052 전화번호 목록

import sys

t = int(sys.stdin.readline())

for _ in range(t):
    n = int(sys.stdin.readline())
    arr = [sys.stdin.readline().rstrip() for _ in range(n)]
    arr.sort()
    success = True

    for i in range(0, n-1):
        if arr[i+1].startswith(arr[i]):
            print("NO")
            success = False
            break
    if success:
        print("YES")