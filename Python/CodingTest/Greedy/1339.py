# 1339 단어 수학
n = int(input())
result = 0
dict = {}
for _ in range(0,n):
    str = list(input())
    str.reverse()
    t = 1
    for s in str:
        if dict.get(s) == None:
            dict[s] = t
        else:
             dict[s] += t

        t*=10

v = 9

keys = list(dict.keys())
keys.sort(key=lambda x: dict[x], reverse=True)

for key in keys:
    result += dict[key]*v
    v-=1

print(result)


