#!/bin/python3

import os
import sys



def hourglassValue(arr,x,y):

    returnValue = arr[x][y]         #row1
    returnValue += arr[x][y+1]      #row1
    returnValue += arr[x][y+2]      #row1
    returnValue += arr[x+1][y+1]    #row2
    returnValue += arr[x+2][y]      #row3
    returnValue += arr[x+2][y+1]    #row3
    returnValue += arr[x+2][y+2]    #row3

    return returnValue


def array2D(arr):

    maxValue = -64

    for row in range(0,4):
        for column in range(0,4):
            #HOURGLASSES
            #RETRIEVE HOURGLASS FROM THIS POSITION
            maxValue = max(hourglassValue(arr,row,column),maxValue)

    return maxValue       







if __name__ == '__main__':
    #fptr = open(os.environ['OUTPUT_PATH'], 'w')

    arr = []
    for _ in range(6):
        arr.append(list(map(int, input().rstrip().split())))
    result = array2D(arr)

    #fptr.write(str(result) + '\n')
    #fptr.close()



