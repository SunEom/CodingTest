#11047 동전0

result = 0
n, k = list(map(int, input().split()))

coins = []

for i in range(0,n):
    coins.append(int(input()))

coins.sort(reverse=True)

for coin in coins:
    result += k//coin
    k %= coin
    if k == 0:
        break

print(result)