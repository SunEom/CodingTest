#5639 이진 검색 트리

import sys
sys.setrecursionlimit(10 ** 9)

pre = []

while True:
    try:
        pre.append(int(input()))
    except:
        break

def post(s, e):
    if s > e :
        return
    mid = e + 1

    for i in range(s+1, e+1):
        if pre[i] > pre[s]:
            mid = i
            break

    post(s+1, mid - 1)
    post(mid, e)
    print(pre[s])

post(0, len(pre)-1)

