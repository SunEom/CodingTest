#2436 공약수

import sys
import math

a, b = map(int, sys.stdin.readline().split())
c = b//a

for i in range(int(math.sqrt(c)), 0, -1):
    j = int(c//i)

    if c % i == 0 and math.gcd(i, j) == 1:
        print(a*i, a*j)
        break