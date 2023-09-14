# 1351 무한 수열

import sys

n, p, q = map(int, sys.stdin.readline().split())
d = {0:1}

def dp(n):
    if n in d.keys():
        return d[n]
    else:
        d[n] = dp(n//p) + dp(n//q)
        return d[n]

print(dp(n))