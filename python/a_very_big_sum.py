#!/bin/python3

import os
import sys

#
# Complete the aVeryBigSum function below.
#

def myGenerator(ar):
    for number in ar:
        yield number

def aVeryBigSum(n, ar):
    returnValue = 0
    for number in myGenerator(ar):
        returnValue += number

    return returnValue


if __name__ == '__main__':
    #f = open(os.environ['OUTPUT_PATH'], 'w')
    #n = int(input())
    n = 5
    bigNums = "1000000001 1000000002 1000000003 1000000004 1000000005"
    ar = list(map(int, bigNums.rstrip().split()))
    result = aVeryBigSum(n, ar)
    print((str(result) + '\n'))
    #f.write(str(result) + '\n')
    #f.close()
