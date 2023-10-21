#7662 이중 우선순위 큐

import sys
import heapq

t = int(sys.stdin.readline())
for _ in range(t):
    maxHeap = []
    minHeap = []
    n = int(sys.stdin.readline())
    cnt = 0
    d = {}
    for _ in range(n):
        temp = list(sys.stdin.readline().split())
        order, num = temp[0], int(temp[1])
        if order == "I":
            heapq.heappush(minHeap, num)
            heapq.heappush(maxHeap, -num)
            cnt += 1
            if num in d:
                d[num] += 1
            else:
                d[num] = 1
        elif order == "D":
            if cnt == 0:
                continue
            else:
                cnt -= 1
                if num == 1:
                    while True:
                        p = -heapq.heappop(maxHeap)

                        if d[p] > 0:
                            d[p] -= 1
                            break
                elif num == -1:
                    while True:
                        p = heapq.heappop(minHeap)
                        if d[p] > 0:
                            d[p] -= 1
                            break

    if cnt == 0:
        print("EMPTY")
    else:
        maxValue = -sys.maxsize
        minValue = sys.maxsize

        for k in d.keys():
            if d[k] > 0:
                maxValue = max(maxValue, k)
                minValue = min(minValue, k)

        print(maxValue, minValue)