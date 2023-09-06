#9095 1,2,3 더하기
import sys

t = int(sys.stdin.readline())

result = ""

nums = []

for _ in range(0,t):
    num = int(sys.stdin.readline())
    nums.append(num)

dp = [0] * (max(nums)+1)

dp[0] = 0
dp[1] = 1
dp[2] = 2
dp[3] = 4
dp[4] = 7

for i in range(5, len(dp)):
    dp[i] = dp[i-1] + dp[i-2] + dp[i-3]

for num in nums:
    result += f"{dp[num]}\n"

print(result)