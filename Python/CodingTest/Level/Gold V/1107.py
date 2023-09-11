# 1107 리모컨

import sys

input = sys.stdin.readline
target = int(input())
n = int(input())
broken = list(map(int, input().split()))

result = abs(100 - target)

for nums in range(1000001):  # 이동할수 있는 체널 - 0~무한대
    nums = str(nums)

    for j in range(len(nums)):
        if int(nums[j]) in broken:
            break

        elif j == len(nums) - 1:
            result = min(result, abs(int(nums) - target) + len(nums))

print(result)