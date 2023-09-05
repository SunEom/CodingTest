# 2720 세탁소 사장 동혁

T = int(input())
coins = [25, 10, 5, 1]
result = ""
for _ in range(0,T):
    c = int(input())
    temp = []
    for coin in coins:
        temp.append(c//coin)
        c%=coin
    result += f"{''.join(map(lambda x: str(x)+' ',temp))}\n"

print(result)
