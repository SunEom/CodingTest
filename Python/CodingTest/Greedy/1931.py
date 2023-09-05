#1931 회의실 배정

n = int(input())

conferences = []

now = 0
result = 0

for i in range(0,n):
    s, e = list(map(int, input().split()))
    conferences.append((s,e))

conferences.sort(key = lambda conference: (conference[1], conference[0]))

for conference in conferences:
    if conference[0] >= now:
        result += 1
        now = conference[1]

print(result)