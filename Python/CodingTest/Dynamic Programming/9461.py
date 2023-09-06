#9461 파도반 수열

import sys

t = int(sys.stdin.readline())

result = ""
cases = []

for _ in range(0,t):
    cases.append(int(sys.stdin.readline()))

dp = [0,1,1,1,2,2]

while len(dp) <= max(cases):
    dp.append(dp[-2] + dp[-3])

for case in cases:
    result += f"{dp[case]}\n"

print(result)