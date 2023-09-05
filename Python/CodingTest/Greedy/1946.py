#1946 신입사원

T = int(input())
result = ""

for _ in range(0,T):
    N = int(input())
    case = []
    tResult = 1
    for _ in range(0,N):
        s, m = list(map(int, input().split()))
        case.append((s,m))
    case.sort(key=lambda x:x[0])

    minValue = case[0][1]

    for c in case[1:]:
        if c[1] < minValue:
            minValue = c[1]
            tResult += 1

    result += f"{tResult}\n"

print(result)

