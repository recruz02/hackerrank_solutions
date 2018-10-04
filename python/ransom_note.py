#!/bin/python3
# Complete the checkMagazine function below.
def checkMagazine(magazine, note):
    

    d = {}
    
    # INITIALIZE DICTIONARY FOR EACH WORD IN MAGAZINE
    for word in magazine:
        d.setdefault(word, 0)
        d[word] += 1
    
    # DECREMENT VALUE FOR EACH KEY IN NOTE
    for word in note:
        if word in d:
            d[word] -= 1
            if d[word] < 0: # IF VALUE COUNT EVER GOES BELOW 0, CAN IMMEDIATELY RETURN FALSE
                print("No")
                return
        else:               # IF WORD IS NOT IN DICTIONARY, CAN IMMEDIATELY RETURN FALSE
            print("No")
            return

    # ALL CASES PASS; PRINT TRUE;
    print("Yes")
    
    

if __name__ == '__main__':
    mn = input().split()

    m = int(mn[0])

    n = int(mn[1])

    magazine = input().rstrip().split()

    note = input().rstrip().split()

    checkMagazine(magazine, note)
