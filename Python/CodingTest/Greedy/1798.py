#1798 수들의 합

n = int(input())
cnt = 0
i=0

while True:
    if i*2 < n:
        cnt += 1
        n-=i
        i+=1
    else:
        break

print(cnt)