# 2839 설탕배달

n = int(input())
result = -1
for i in range(n//5,-1,-1):
    if (n-(i*5))%3 == 0:
        result = i
        result += (n-(i*5))//3
        break


print(result)