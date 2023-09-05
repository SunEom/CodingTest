#1541 잃어버린 괄호

from functools import reduce

arr = list(input().split(sep="-"))

arr = list(map(lambda item:  reduce(lambda x,y: x+y,list(map(int, item.split(sep="+")))), arr))
result = arr[0]

for item in arr[1:]:
    result -= item

print(result)