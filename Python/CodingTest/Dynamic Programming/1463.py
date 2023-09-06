#1463 1로 만들기

import sys

# n = int(sys.stdin.readline())
# queue = [n]
# dp = [sys.maxsize] * (n+1)
# dp[n] = 0
#
# while len(queue) != 0:
#     pop = queue.pop(0)
#
#     if pop == 1:
#         break
#
#     if pop%3 == 0 :
#         if dp[pop//3] == sys.maxsize:
#             queue.append(pop // 3)
#             dp[pop//3] = dp[pop] + 1
#
#     if pop%2 == 0 :
#         if dp[pop//2] == sys.maxsize:
#             queue.append(pop // 2)
#             dp[pop//2] = dp[pop] + 1
#
#     if pop > 1 :
#         if dp[pop-1] == sys.maxsize:
#             queue.append(pop - 1)
#             dp[pop-1] = dp[pop] + 1
#
# print(dp[1])

n = int(sys.stdin.readline())

dp = [sys.maxsize] * (n+1)

dp[n] = 0

for i in range(n-1, 0, -1):
    if i*2 <= n:
        dp[i] = min(dp[i], dp[i*2]+1)

    if i * 3 <= n:
        dp[i] = min(dp[i], dp[i * 3] + 1)

    dp[i] = min(dp[i], dp[i+1]+1)

print(dp[1])