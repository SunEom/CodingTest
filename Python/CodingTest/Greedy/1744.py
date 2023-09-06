#1744 수 묶기

import sys

n = int(sys.stdin.readline())

result = 0
positive = []
negative = []
zero = []
one = []

for _ in range(0,n):
    num = int(sys.stdin.readline())
    if num == 1:
        one.append(num)
    elif num > 0:
        positive.append(num)
    elif num == 0:
        zero.append(num)
    else:
        negative.append(num)

positive.sort(reverse=True)
negative.sort()

while len(negative) >= 2:
    result += negative.pop(0) * negative.pop(0)

while len(positive)>= 2:
    result += positive.pop(0) * positive.pop(0)

while len(zero)!=0 and len(negative) != 0:
    zero.pop(0)
    negative.pop(0)

print(result + sum(positive) + sum(negative) + sum(one))