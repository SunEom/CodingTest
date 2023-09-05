#10162 전자레인지

t = int(input())

times = [300, 60, 10]

if t%10 != 0 :
    print(-1)
else:
    result = []
    for time in times:
        result.append(t//time)
        t %= time
    print(*result)