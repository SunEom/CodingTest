#11729 하노이 탑 이동 순서

import sys

n = int(sys.stdin.readline())

def hanoi(f, t, k, num):
    if num == 1:
        print(f"{f} {t}")
    else:
        hanoi(f, k, t, num-1)
        print(f"{f} {t}")
        hanoi(k, t, f, num - 1)

print(2**n-1)
hanoi(1, 3, 2, n)