#1990 소수인팰린드롬

import sys

def isPalin(word):  #팰린드롬 판정
    if len(word)<2:
        return True
    if word[0] != word[-1]:
        return False
    return isPalin(word[1:-1])

def isPrime(number):  #소수판정
    for i in range(2, int(number**0.5)+1):
        if number % i ==0:
            return False
    return True

a, b = map(int, sys.stdin.readline().split())

arr = []

for i in range(a, b+1):
    if isPalin(str(i)):
        arr.append(i)

for n in arr:
    if isPrime(n):
        print(n)

print(-1)