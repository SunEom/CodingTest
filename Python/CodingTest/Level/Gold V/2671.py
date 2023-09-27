#2671 잠수함 식별

import sys
import re

s = sys.stdin.readline().strip()
p = re.compile("(100+1+|01)+")
if p.fullmatch(s):
    print("SUBMARINE")
else:
    print("NOISE")