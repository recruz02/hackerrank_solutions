""" Node is defined as
class node:
    def __init__(self, data):
        self.data = data
        self.left = None
        self.right = None
"""


def verifyLessThan(root, theValue):
    isLeftSide = True
    isRightSide = True
    isDataLessThan = root.data < theValue
    
    #recursively check the tree:   
    if (root.left is not None):
        isLeftSide = verifyLessThan(root.left, theValue) and root.left.data < theValue
    if (root.right is not None):
        isRightSide = verifyLessThan(root.right, theValue) and root.right.data < theValue
    
    return isLeftSide and isRightSide and isDataLessThan




def verifyGreaterThan(root, theValue):
    isLeftSide = True
    isRightSide = True
    isDataGreaterThan = root.data > theValue
    
    #recursively check the tree:
    if (root.left is not None):
        isLeftSide = verifyGreaterThan(root.left, theValue) and root.left.data > theValue
    if (root.right is not None):
        isRightSide = verifyGreaterThan(root.right, theValue) and root.right.data > theValue
    
    return isLeftSide and isRightSide and isDataGreaterThan
    

    
def checkBST(root):
    
    #CHECK LEFT TREE
    if (root.left is None):
        isLeftTreeBinary = True
        checkLeftNodeData = True
        isLeftLessThan = True
    else:
        checkLeftNodeData = (root.left.data < root.data)
        isLeftTreeBinary = checkBST(root.left)
        isLeftLessThan = verifyLessThan(root.left, root.data)
        
    
    
    #CHECK RIGHT TREE
    if (root.right is None):
        isRightTreeBinary = True
        checkRightNodeData = True
        isRightGreaterThan = True
    else:
        checkRightNodeData = (root.data < root.right.data)
        isRightTreeBinary = checkBST(root.right)
        isRightGreaterThan = verifyGreaterThan(root.right, root.data)

    
    #RETURN ALL TRUE
    return isLeftTreeBinary and isRightTreeBinary and checkLeftNodeData and checkRightNodeData and isLeftLessThan and isRightGreaterThan
    

    #ABSOLUTE WIN CASE:
    #LEFT.DATA < DATA = TRUE
    #RIGHT.DATA > DATA = TRUE
    #checkBST(root.left) = TRUE
    #checkBST(root.right) = TRUE
    #LEFT TREE VALUES ARE ALL LESS THAN DATA
    #RIGHT TREE VALUES ARE ALL GREATER THAN DATA
    

    
    
    