#2467 용액
import sys
n = int(sys.stdin.readline())
arr = list(map(int, sys.stdin.readline().split()))
arr.sort()
i, j = 0, len(arr)-1
resultA, resultB = arr[i], arr[j]
diff = abs(arr[j] + arr[i])

while True:
    if i >= len(arr) or j < 0 or i >= j:
        break

    tdiff = arr[j] + arr[i]

    if abs(tdiff) < abs(diff):
        diff = abs(tdiff)
        resultA, resultB = arr[i], arr[j]

    if tdiff > 0:
        j -= 1
    elif tdiff < 0:
        i += 1
    else:
        break

print(resultA, resultB)


