#17609 회문

import sys

n = int(sys.stdin.readline())

def isPalin(l, r, chance):
    while l < r:
        if s[l] == s[r]:
            l += 1
            r -= 1
            continue
        elif chance:
            return min(isPalin(l+1,r, False), isPalin(l, r-1, False))
        else:
            return 2
    if chance:
        return 0
    else:
        return 1

for _ in range(n):
    s = sys.stdin.readline().strip()
    l, r = 0, len(s)-1
    print(isPalin(l, r, True))