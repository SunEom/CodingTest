#5557 1학년

import sys

n = int(sys.stdin.readline())
arr = list(map(int, sys.stdin.readline().split()))
r = arr.pop()
memo =  {}

def dp(idx, result):
    answer = 0

    if idx == len(arr):
        if result == r:
            return 1
        else:
            return 0


    else:

        if 0 <= result + arr[idx] <=20:
            if (idx+1, result + arr[idx]) not in memo:
                memo[(idx+1, result + arr[idx])] = dp(idx+1, result + arr[idx])
            answer += memo[(idx+1, result + arr[idx])]

        if 0 <= result - arr[idx] <= 20:
            if (idx+1, result - arr[idx]) not in memo:
                memo[(idx+1, result - arr[idx])] = dp(idx+1, result - arr[idx])
            answer += dp(idx+1, result - arr[idx])

        return answer

print(dp(1, arr[0]))