#1456 거의 소수
import sys

a, b = map(int, sys.stdin.readline().split())
r = int(b**0.5)
prime = [True]*(r+1)
prime[1] = False

for i in range(2, r+1):
    if prime[i]:
        for j in range(i*i, r+1, i):
            prime[j] = False

count = 0
for i in range(1, r+1):
    if prime[i]:
        t = i*i
        while True:
            if t < a:
                t *= i
                continue

            if t > b:
                break
            t *= i
            count += 1

print(count)