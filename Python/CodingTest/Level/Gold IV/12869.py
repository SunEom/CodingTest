#12869 뮤탈리스크

import sys
import math
from itertools import permutations
n = int(sys.stdin.readline())
arr = list(map(int, sys.stdin.readline().split()))

case2 = list(permutations([9, 3], 2))
case3 = list(permutations([9, 3, 1], 3))
result = sys.maxsize

visited = {}

if n == 1:
    print(math.ceil(arr[0]/9))
elif n == 2:
    queue = [(arr[0], arr[1], 0)]

    while True:
        p1, p2, p3 = queue.pop(0)

        if p1 <= 0 and p2 <= 0:
            print(p3)
            break

        for c1, c2 in case2:
            t1, t2 = p1 - c1, p2 - c2
            if (t1, t2) not in visited:
                queue.append((p1-c1, p2-c2, p3+1))
else:
    queue = [(arr[0], arr[1], arr[2], 0)]

    while True:
        p1, p2, p3, p4 = queue.pop(0)

        if p1 <= 0 and p2 <= 0 and p3 <= 0:
            print(p4)
            break

        for c1, c2, c3 in case3:
            t1, t2, t3 = p1-c1, p2-c2, p3-c3
            if (t1, t2, t3) not in visited:
                queue.append((p1 - c1, p2 - c2, p3 - c3, p4 + 1))
                visited[(t1, t2, t3)] = True
