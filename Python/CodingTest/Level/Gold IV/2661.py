#2661 좋은 수열

import sys

n = int(sys.stdin.readline())

def checkBad(s):
    for i in range(1, len(s)+1):
        for j in range(0, len(s)-2*i+1):
            if s[j:j+i] == s[j+i:j+i+i]:
                return True
    return False

def bt(s):
    if len(s) == n:
        print(s)
        exit()
    else:
        for i in ("1", "2", "3"):
            if not checkBad(s + i):
                bt(s + i)

bt("1")