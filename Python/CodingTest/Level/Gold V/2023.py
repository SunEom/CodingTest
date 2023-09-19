#2023 신기한 소수

import sys

n = int(sys.stdin.readline())

def isPrime(n):
    if n <=1: return False
    else:
        for i in range(2, int(n**0.5)+1):
            if n%i == 0 :
                return False
        return True
def bt(s, l):
    if l == n:
        print(s)
        return

    for i in range(1, 10):
        temp = s*10 + i
        if isPrime(temp):
            bt(temp, l+1)



bt(0, 0)