#2668 숫자 고르기

import sys
n = int(sys.stdin.readline())

check = [False for _ in range(n+1)]
arr =[0] + [int(sys.stdin.readline()) for _ in range(n)]

def solve(s):
    if check[s] :
        return

    visited = [False for _ in range(n+1)]
    visited[s] = True

    a = set()
    a.add(s)
    b = set()
    b.add(arr[s])

    stack = [arr[s]]

    while len(stack) != 0:
        p = stack.pop()

        if visited[p] == False:
            visited[p] = True
            a.add(p)
            stack.append(arr[p])
            b.add(arr[p])

    return a == b, a

result = []
for i in range(1, n+1):
    if check[i] == False:
        p, q = solve(i)
        if p:
            for o in q:
                check[o] = True
                result.append(o)

result.sort()
print(len(result))
for a in result:
    print(a)
