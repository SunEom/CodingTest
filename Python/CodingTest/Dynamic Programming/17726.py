#17726 2xN 타일링

import sys

n = int(sys.stdin.readline())

dp = [0,1,2]

while len(dp) <= n :
    dp.append(dp[-1]%10007 + dp[-2]%10007)

print(dp[n]%10007)