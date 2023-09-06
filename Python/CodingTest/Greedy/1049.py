#1049 기타줄

import sys
n, m = map(int, sys.stdin.readline().split())

result = 0
a = []
b = []

for _ in range(0, m):
    (s, p) = map(int, sys.stdin.readline().split())
    a.append(s)
    b.append(p)

a.sort()
b.sort()

while n >= 6:
    if a[0] > 6 * b[0]:
        result += 6*b[0]
    else:
        result += a[0]

    n -= 6

if a[0] > n * b[0]:
    result += n * b[0]
else:
    result += a[0]

print(result)