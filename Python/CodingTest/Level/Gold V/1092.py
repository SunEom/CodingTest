#1092  배

import sys

n = int(sys.stdin.readline())

cranes = list(map(int, sys.stdin.readline().split()))

m = int(sys.stdin.readline())

boxes = list(map(int, sys.stdin.readline().split()))

count = [0 for _ in range(len(cranes))]
if max(cranes) < max(boxes):
    print(-1)
else:
    boxes.sort(reverse= True)
    cranes.sort(reverse=True)
    result = 0
    while len(boxes) != 0 :
        result += 1
        for crane in cranes:
            for i in range(len(boxes)):
                if boxes[i] <= crane:
                    boxes.pop(i)
                    break

    print(result)





