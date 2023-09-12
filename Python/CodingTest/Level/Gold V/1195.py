#1195 킥다운

import sys
def solve():
    arr1 = list(sys.stdin.readline().strip())
    arr2 = list(sys.stdin.readline().strip())

    if len(arr1) > len(arr2):
        arr1, arr2 = arr2, arr1  # 짧은: arr1, 긴: arr2

    result = len(arr1) + len(arr2)

    # 오른쪽으로 이동
    check = False
    for i in range(0, len(arr2)):
        if check:
            break
        for j in range(0, len(arr1)):
            if i+j < len(arr2):
                if arr2[i+j] == "2" and arr1[j] == "2":
                    break
                elif j == len(arr1)-1:
                    result = min(result, max(i + len(arr1), len(arr2)))
                    check = True
                    break
            else:
                result = min(result, max(i + len(arr1), len(arr2)))
                check = True
                break

    #왼쪽으로 이동
    check = False
    for i in range(1, len(arr1)):
        if check:
            break
        for j in range(0, len(arr2)):
            if i + j < len(arr1):
                if arr2[j] == "2" and arr1[i+j] == "2":
                    break
                elif j == len(arr2) - 1:
                    result = min(result, i + len(arr2))
                    check = True
                    break
            else:
                result = min(result, i + len(arr2))
                check = True
                break

    print(result)


solve()