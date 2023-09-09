#1068 트리

import sys

n = int(sys.stdin.readline())
arr = list(map(int, sys.stdin.readline().split()))
target = int(sys.stdin.readline())
child = [[] for _ in range(n)]
memo = [-1 for i in range(n)]
root = 0

for i in range(0, n):
    if arr[i] != -1:
        child[arr[i]].append(i)
    else:
        root = i

def bfs(root):
    if root == target:
        return 0

    if child[root] == [target]:
        return 1
    queue = [root]
    result = 0
    while len(queue) != 0 :
        pop = queue.pop(0)

        for c in child[pop]:
            if c != target:
                if len(child[c]) == 0 or (len(child[c]) == 1 and child[c][0] == target):
                    result += 1
                else:
                    queue.append(c)

    return result

print(bfs(root))