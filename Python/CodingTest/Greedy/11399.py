#11399 ATM
n = int(input())
li = list(map(int, input().split()))
li.sort()
result = li[0]
wait = li

for i in range(1,n):
    wait[i] += wait[i-1]
    result += wait[i]

print(result)

