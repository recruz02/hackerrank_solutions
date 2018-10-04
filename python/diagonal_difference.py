#!/bin/python3

import os
import sys

#
# Complete the diagonalDifference function below.
#
def diagonalDifference(a):
    

    n = len(a)
    primary_diagonal = 0
    secondary_diagonal = 0

    
    for position in range(n):
        myList = a[position]
        primary_diagonal += myList[position]
        secondary_diagonal += myList[(n-1)-position]
        #print("listItem: " + str(myList[position]))
        #print("Reverse listItem: " + str(myList[(n-1)-position]))

    return abs(primary_diagonal - secondary_diagonal)






if __name__ == '__main__':
    #f = open(os.environ['OUTPUT_PATH'], 'w')

    n = int(input())

    a = []

    for _ in range(n):
        a.append(list(map(int, input().rstrip().split())))

    result = diagonalDifference(a)
    print(str(result))

    #f.write(str(result) + '\n')
    #f.close()
