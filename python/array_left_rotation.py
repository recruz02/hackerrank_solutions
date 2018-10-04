def array_left_rotation(a, n, k):
    
    numRotations = k
    #print(len(a))
    myNewArray = [0]*len(a)


    #for each position:
    curPos = 0
    while curPos < len(a):
        #when we eventually wrap around:
        if (curPos - numRotations) < 0:
            newPosition = (len(a)) + (curPos - numRotations)
        else:
            newPosition = curPos-numRotations

        myNewArray[newPosition] = a[curPos]
        curPos += 1
    
    return myNewArray






n, k = map(int, input().strip().split(' '))
a = list(map(int, input().strip().split(' ')))
answer = array_left_rotation(a, n, k)
print(*answer, sep=' ')
