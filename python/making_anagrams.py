from collections import Counter

# Python program to illustrate the intersection
# of two lists in most simple way
"""
def intersection(lst1, lst2):
    lst3 = [value for value in lst1 if value in lst2]
    return lst3
    
def number_needed(a, b):
    #USE SET INTERSECTION TO GET VALUES THAT ARE DISTINCT IN EACH STRING
    #COUNT NUMBER OF LETTERS IN
    aList = list(a.replace(" ", ""))
    bList = list(b.replace(" ", ""))
    intersectList = intersection(aList,bList)

    number_needed = (len(aList)-len(intersectList)) + (len(bList)-len(intersectList))
    

    print(intersectList)
    print(len(intersectList))
    print(len(aList))
    print(len(bList))


    return number_needed
"""

##########################################################
"""
SOLUTION TO THIS PROBLEM IS AS FOLLOWS:
#GET EACH UNIQUE CHARACTER
#GET COUNT OF EACH LETTER IN EACH STRING (A and B)
#FOR EACH UNIQUE CHARACTER, 
#   GET THE DIFFERENCE BETWEEN THE TWO (CAN USE ABSOLUTE VALUE)
"""

def number_needed(a, b):

    #COULD JUST CREATE DICTIONARY OF ALPHABET...
    aChars = set(a)
    bChars = set(b)
    allChars = aChars.union(bChars)
    #print(allChars)
    #print(len(allChars))


    #CREATE DICTIONARIES OF COUNT OF CHARCTERS IN EACH STRING
    aDict = {}
    bDict = {}
    for char in allChars:
        aDict[char] = a.count(char)
        bDict[char] = b.count(char)

    #print(aDict)
    #print(bDict)

    #CALCULATE DIFFERENCE IN CHARACTERS
    totalDiff = 0
    for char in allChars:
        totalDiff += abs(aDict[char] - bDict[char])


    return totalDiff

"""
def number_needed(a, b):
    char_list = list(set(a + b))
    inp1 = Counter(a)
    inp2 = Counter(b)

    print(inp1)
    print(inp2)

    count = 0
    for each in char_list:
        count += abs(inp1[each] - inp2[each])
    return count
"""




# Driver Code
#lst1 = [4, 9, 1, 17, 11, 26, 28, 54, 69, 9]
#lst2 = [9, 9, 74, 21, 45, 11, 63, 28, 26]
#print(intersection(lst1, lst2))

#a = input().strip()
#b = input().strip()

a = "fsqoiaidfaukvngpsugszsnseskicpejjvytviya".strip()
b = "ksmfgsxamduovigbasjchnoskolfwjhgetnmnkmcphqmpwnrrwtymjtwxget".strip()


print(number_needed(a, b))

