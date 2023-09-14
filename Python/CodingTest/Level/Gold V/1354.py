#1354 무한 수열2

import sys

n, p, q, x, y = map(int, sys.stdin.readline().split())
d = {0:1}

def dp(n):
    if n in d.keys():
        return d[n]
    elif n <= 0:
        return 1
    else:
        d[n] = dp(n//p-x) + dp(n//q-y)
        return d[n]

print(dp(n))