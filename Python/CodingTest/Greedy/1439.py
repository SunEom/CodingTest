#1439 뒤집기

arr = list(map(int, list(input())))

changeCount = 0

prev = arr[0]

for n in arr[1:]:
    if prev != n:
        prev = n
        changeCount += 1

if changeCount%2 == 0 :
    print(changeCount//2)
else:
    print((changeCount+1) // 2)