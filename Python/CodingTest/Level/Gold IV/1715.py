#1715 카드 정렬하기

import sys
import heapq
n = int(sys.stdin.readline())
q = [int(sys.stdin.readline()) for _ in range(n)]

heapq.heapify(q)
result = 0

while len(q) > 1:
    a, b = heapq.heappop(q), heapq.heappop(q)
    result += a+b
    heapq.heappush(q, a+b)

print(result)