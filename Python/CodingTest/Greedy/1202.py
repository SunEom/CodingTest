#1202 보석도둑
from heapq import heappop, heapify, heappush
n, k = list(map(int, input().split()))
result = 0
diamond = []
bags = []

for _ in range(0,n):
    m, v = list(map(int, input().split()))
    diamond.append((m, v))

for _ in range(0,k):
    bags.append(int(input()))

diamond.sort(key=lambda x: (x[1],x[0]), reverse=True)

heapify(bags)

maxBag = max(bags)

for d in diamond:
    weight = d[0]
    pay = d[1]

    if maxBag < weight:
        continue

    t = []

    while True:
        if len(bags) == 0:
            break
        pop = heappop(bags)
        if pop >= weight:

            result += pay
        else :
            t.append(pop)

    for item in t:
        heappush(bags,item)

print(result)

