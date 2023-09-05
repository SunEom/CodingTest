#16953 A -> B

A, B = list(map(int, input().split()))

queue = [(A,1)]

result = -1

while len(queue) != 0 :
    pop = queue.pop(0)
    if pop[0] * 2 == B or pop[0]*10 + 1 == B:
        result = pop[1]+1
        break
    if pop[0] * 2 < B:
        queue.append((pop[0] * 2, pop[1]+1))
    if pop[0]*10 + 1 < B:
        queue.append((pop[0]*10 + 1, pop[1] + 1))

print(result)