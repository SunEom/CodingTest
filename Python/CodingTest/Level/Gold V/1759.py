#1759 암호 만들기

import sys

l, c = map(int, sys.stdin.readline().split())
arr = list(sys.stdin.readline().split())
g = ["a","e","i","o","u"]

arr.sort()

def bt(s, prevIdx, gather, vowelCount):
    if len(s) == l and gather and vowelCount >= 2:
        print(s)

    for i in range(prevIdx+1, len(arr)):
        if arr[i] in g:
            bt(s+arr[i], i, True, vowelCount)
        else:
            bt(s+arr[i], i, gather, vowelCount+1)

for i in range(len(arr)):
    if arr[i] in g:
        bt(arr[i], i, True, 0)
    else:
        bt(arr[i], i, False, 1)

