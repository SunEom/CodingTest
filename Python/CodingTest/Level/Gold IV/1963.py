#1963 소수 경로

import sys

prime = [ True for _ in range(10000)]

prime[2] = True

for i in range(2, 10000):
    if prime[i]:
        for k in range(2*i, 10000, i):
            prime[k] = False

result = sys.maxsize

t = int(sys.stdin.readline())

arr = [list(map(int, sys.stdin.readline().split())) for _  in range(t)]

for now, target in arr:
    queue = [(now, 0)]
    visited = [ False for _ in range(10000)]

    while queue:
        p = queue.pop(0)
        if p[0] == target:
            print(p[1])
            break

        for i in range(1, 10):
            temp = i * 1000 + p[0] % 1000
            if prime[temp] and not visited[temp]:
                visited[temp] = True
                queue.append((temp, p[1]+1))

        for i in range(10):
            temp1 = (p[0]//1000)*1000 + i*100 + p[0]%100
            temp2 = (p[0]//100)*100 + i*10 + p[0]%10
            temp3 = (p[0]//10)*10 + i*1

            if prime[temp1] and not visited[temp1]:
                visited[temp1] = True
                queue.append((temp1, p[1]+1))

            if prime[temp2] and not visited[temp2]:
                visited[temp2] = True
                queue.append((temp2, p[1]+1))

            if prime[temp3] and not visited[temp3]:
                visited[temp3] = True
                queue.append((temp3, p[1]+1))

