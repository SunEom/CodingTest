#10026 적록색약

import sys

n = int(sys.stdin.readline())

arr = [list(sys.stdin.readline().strip()) for _ in range(n)]

def nsolve():
    direction = [(0, 1),(1,0),(-1, 0),(0,-1)]
    visited = [[ False for _ in range(n)] for _ in range(n)]
    result = 0
    queue = []
    for i in range(n):
        for j in range(n):
            if not visited[i][j]:
                result += 1
                queue.append((i, j, arr[i][j]))
                visited[i][j] = True

                while len(queue) > 0:
                    x, y, c = queue.pop(0)

                    for dx, dy in direction:
                        tx = x + dx
                        ty = y + dy

                        if 0 <= tx < n and 0 <= ty < n and not visited[tx][ty] and arr[tx][ty] == c:
                            queue.append((tx, ty, c))
                            visited[tx][ty] = True


    return result

def wsolve():
    direction = [(0, 1),(1,0),(-1, 0),(0,-1)]
    visited = [[ False for _ in range(n)] for _ in range(n)]
    result = 0
    queue = []
    for i in range(n):
        for j in range(n):
            if not visited[i][j]:
                result += 1
                queue.append((i, j, arr[i][j]))
                visited[i][j] = True

                while len(queue) > 0:
                    x, y, c = queue.pop(0)

                    for dx, dy in direction:
                        tx = x + dx
                        ty = y + dy

                        if 0 <= tx < n and 0 <= ty < n and not visited[tx][ty]:
                            if (c == "R" or c =="G") and (arr[tx][ty] == "R" or arr[tx][ty] == "G"):
                                queue.append((tx, ty, c))
                                visited[tx][ty] = True
                            elif c == "B" and arr[tx][ty] == "B":
                                queue.append((tx, ty, c))
                                visited[tx][ty] = True

    return result
print(nsolve(), wsolve())