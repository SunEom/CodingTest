#1003 피보나치 함수
import sys

t = int(sys.stdin.readline())
result = ""
cases = []

for _ in range(0, t):
    cases.append(int(sys.stdin.readline()))

dp = [(0,0)] * (max(cases) + 1)

dp[0] = (1,0)
if len(dp) > 1:
    dp[1] = (0,1)

for i in range(2, len(dp)):
    dp[i] = (dp[i-1][0]+ dp[i-2][0], dp[i-1][1]+ dp[i-2][1])

for case in cases:
    result += f"{dp[case][0]} {dp[case][1]}\n"

print(result)