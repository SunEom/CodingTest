#13305 주유소

n = int(input())
distance = list(map(int, input().split()))
cost = list(map(int, input().split()))

result = cost[0] * distance[0]
minCost = cost[0]


for i in range(1,n-1):
    if cost[i] < minCost:
        minCost = cost[i]
    result += minCost*distance[i]

print(result)