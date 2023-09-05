#10610 30

n = list(map(int,list(input())))

if 0 not in n:
    print(-1)
elif sum(n)%3 != 0:
    print(-1)
else:
    n.sort(reverse=True)
    print(''.join(map(str, n)))