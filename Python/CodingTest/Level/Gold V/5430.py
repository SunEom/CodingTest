#5430 AC

import sys

t = int(sys.stdin.readline())

for _ in range(t):
    order = sys.stdin.readline().strip()

    n = int(sys.stdin.readline())
    arr = list(map(int, list(sys.stdin.readline().strip().replace("[","").replace("]","").replace(","," ").split())))
    err = False
    front = 0
    rear = len(arr)-1

    r = 1
    for o in order:
        if o == "R":
            r *= -1
        elif o == "D":
            if front > rear:
                print("error")
                err = True
                break
            else:
                if r == 1:
                    front += 1
                else:
                    rear -= 1
    if not err:
        s = "["
        if r == 1:
            for i in range(front, rear+1):
                if i == front:
                    s += f"{arr[i]}"
                else:
                    s += f",{arr[i]}"

        else:
            for i in range(rear, front-1, -1):
                if i == rear:
                    s += f"{arr[i]}"
                else:
                    s += f",{arr[i]}"
        s += "]"
        print(s)
