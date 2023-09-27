#2877 4와 7

import sys
n = int(sys.stdin.readline())+1
s = format(n, "b")
print(s[1:].replace("0","4").replace("1","7"))