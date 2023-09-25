#2504 괄호의 값

import sys

s = sys.stdin.readline().strip()
stack = []
fail = False
for i in range(len(s)):
    if fail :
        break
    c = s[i]

    if c == "(" or c == "[":
        stack.append(c)
    elif c == ")":
        temp = 0
        while True:
            if len(stack) == 0:
                fail = True
                break
            if stack[-1] == "(":
                stack.pop(-1)
                if temp == 0:
                    stack.append(2)
                else:
                    stack.append(temp * 2)
                break
            elif type(stack[-1]) == int:
                temp += stack.pop(-1)
            else:
                fail = True
                break
    elif c == "]":
        temp = 0
        while True:
            if len(stack) == 0:
                fail = True
                break
            if stack[-1] == "[":
                stack.pop(-1)
                if temp == 0:
                    stack.append(3)
                else:
                    stack.append(temp * 3)
                break
            elif type(stack[-1]) == int:
                temp += stack.pop(-1)
            else:
                fail = True
                break
if fail:
    print(0)
else:
    fail2 = False
    result = 0
    for n in stack:
        if type(n) != int:
            print(0)
            fail2 = True
            break
        result += n
    if fail2 == False:
        print(result)