#1011 Fly me to the Alpha Centauri

import sys

# t = int(sys.stdin.readline())
# cases = []
# for _ in range(t):
#     x, y = map(int, sys.stdin.readline().split())
#     cases.append(y-x)
# dp = [-1 for _ in range(max(cases))]
#
# dp[0] = 0
# dp[1] = 1
# queue = [(1,1)]
#
# while len(queue) != 0:
#     (now, prev) = queue.pop(0)
#
#     for i in range(prev-1, prev+2):
#         if i >= 1 and now+i < len(dp) and dp[now+i] == -1:
#             dp[now+i] = dp[now] + 1
#             queue.append((now+i,i))
#
# for case in cases:
#     print(dp[case-1]+1)

# 규칙을 찾아 풀기..

T = int(input())

for i in range(T):
    x, y = map(int, input().split())  # 출발 및 도착 지점

    d = y - x  # 거리

    n = 0

    while True:
        if d <= n * (n + 1):
            break
        n += 1

    # 총 이동 거리가 n의 제곱보다 작거나 같을 때
    if d <= n ** 2:
        print(n * 2 - 1)

    # 총 이동 거리가 n의 제곱보다 클 때
    else:
        print(n * 2)