#2251 물통

import sys

a, b, c = map(int, sys.stdin.readline().split())
check = {(0,0,c): True}
s = set()
s.add(c)
def solve(q, w, e):
    if q == 0:
        s.add(e)
    if q > 0:
        # A를  B에 붓기
        t1 = min(q, b-w)

        #B가 꽉 차있지 않으면
        if t1 != 0 and (q-t1, w+t1, e) not in check:
            check[(q-t1, w+t1, e)] = True
            solve(q-t1, w+t1, e)

        # A를 C에 붓기
        t2 = min(q, c-e)

        # C가 꽉 차있지 않으면
        if t2 != 0 and (q - t2, w, e + t2) not in check:
            check[(q - t2, w, e + t2)] = True
            solve(q - t2, w, e + t2)

    if w > 0:
        # B를  A에 붓기
        t1 = min(w, a-q)

        # A가 꽉 차있지 않으면
        if t1 != 0 and (q + t1, w - t1, e) not in check:
            check[(q + t1, w - t1, e)] = True
            solve(q + t1, w - t1, e)

        # B를 C에 붓기
        t2 = min(w, c-e)

        # C가 꽉 차있지 않으면
        if t2 != 0 and (q, w - t2, e + t2) not in check:
            check[(q, w - t2, e + t2)] = True
            solve(q, w - t2, e + t2)

    if e > 0:
        # C를  A에 붓기
        t1 = min(e, a-q)

        # B가 꽉 차있지 않으면
        if t1 != 0 and (q + t1, w, e - t1) not in check:
            check[(q + t1, w, e - t1)] = True
            solve(q + t1, w, e - t1)

        # C를 B에 붓기
        t2 = min(e, b-w)

        # C가 꽉 차지 않으면
        if t2 != 0 and (q, w + t2, e - t2) not in check:
            check[(q, w + t2, e - t2)] = True
            solve(q, w + t2, e - t2)

solve(0, 0, c)
s = list(s)
s.sort()
print(*s)