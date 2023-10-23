#9935 문자열 폭발

import sys

s = sys.stdin.readline().rstrip()
target = sys.stdin.readline().rstrip()

length = len(target)
stack = []

for c in s:
    stack.append(c)
    if len(stack) >= length:
        if "".join(stack[-length:]) == target:
            for _ in range(length):
                stack.pop()

if stack:
    print("".join(stack))
else:
    print("FRULA")