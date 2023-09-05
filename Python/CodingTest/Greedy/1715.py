#1715 카드 정렬하기

from heapq import heappush, heappop

minHeap = []

n = int(input())
result = 0

for _ in range(0,n):
    heappush(minHeap, int(input()))

while len(minHeap) != 1:
    s = heappop(minHeap) + heappop(minHeap)
    result += s
    heappush(minHeap, s)

print(result)


