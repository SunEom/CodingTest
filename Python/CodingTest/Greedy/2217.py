#2217 로프

n = int(input())

ropes = []

for i in range(0,n):
    ropes.append(int(input()))

ropes.sort(reverse=True)

weights = [ropes[0]]

for i in range(1, n):
    weights.append(ropes[i] * (i+1))

print(max(weights))