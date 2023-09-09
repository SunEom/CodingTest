# 1041 주사위

import sys

n = int(sys.stdin.readline())
arr = list(map(int, sys.stdin.readline().split()))

possible2 = [(0,1),(0,2),(0,3),(0,4),(1,2),(1,3),(1,5),(2,4),(2,5),(3,4),(3,5),(4,5)]
possible3 = [(0,1,2),(0,1,3),(0,3,4),(0,2,4),(5,1,2),(5,1,3),(5,3,4),(5,2,4)]

arr2 = []
arr3 = []

for p in possible2:
    arr2.append(arr[p[0]] + arr[p[1]])

for p in possible3:
    arr3.append(arr[p[0]] + arr[p[1]] + arr[p[2]])

arr2.sort()
arr3.sort()

if n == 1 :
    print(sum(arr)-max(arr))
elif n == 2:
    print(arr3[0]*4 + arr2[0]*4)
else:
    print(arr2[0]*(8*(n-2)+4) + arr3[0]*4 + min(arr)*(5*(n-2)*(n-2) + 4*(n-2)))
