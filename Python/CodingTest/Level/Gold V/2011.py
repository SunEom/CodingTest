#2011 암호코드

import sys

s = sys.stdin.readline().strip()
solved = False
for i in range(0, len(s)):
    if s[i] == "0" :
        if i == 0  or int(s[i-1]) >= 3 or s[i-1] == "0":
            print(0)
            solved = True
            break


if not solved:
    arr = [0 for i in range(len(s))]

    if s[-1] == "0":
        arr[-1] = 0

        if len(s)>=2:
            arr[-2] = 1
    else:
        arr[-1] = 1

        if len(s) >= 2:
            if s[-2] == "0":
                arr[-2] = 0
            else:
                if int(s[-2:]) <=26:
                    arr[-2] = 2
                else:
                    arr[-2] = 1
    for i in range(len(s)-3, -1, -1):
        if s[i] != "0":
            arr[i] += arr[i+1]%1000000
            if int(s[i:i+2]) <= 26:
                arr[i] += arr[i+2]%1000000

    print(arr[0]%1000000)