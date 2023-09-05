#5585 거스름돈

n = 1000 - int(input())

coins = [500, 100, 50, 10, 5, 1]

result = 0
i = 0
while n > 0:
    result += n//coins[i]
    n %= coins[i]
    i += 1

print(result)