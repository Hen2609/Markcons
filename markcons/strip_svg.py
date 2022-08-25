import sys
import re

svg = sys.stdin.readlines()[0]

result = re.match("<.*?>(.*)<\/.*>",svg)

print(result.group(1))