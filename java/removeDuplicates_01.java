    // Complete the removeDuplicates function below.

    /*
     * For your reference:
     *
     * SinglyLinkedListNode {
     *     int data;
     *     SinglyLinkedListNode next;
     * }
     *
     */
    static SinglyLinkedListNode removeDuplicates(SinglyLinkedListNode head) {

        Dictionary<Integer, Integer> myValues = new Hashtable<Integer, Integer>();     
        myValues.put(head.data, head.data);
        
        SinglyLinkedList newList = new SinglyLinkedList();
        newList.insertNode(head.data);
        
        
        SinglyLinkedListNode prevPos = head;
        SinglyLinkedListNode curPos = head.next;
        Integer temp = 0;
        
        while (curPos != null) {

            System.out.println(curPos.data);
            temp = myValues.get(curPos.data);   //CHECK DICTIONARY
            
            if (temp == null) { //THIS IS A NEW VALUE, SO ADD TO THE DICTIONARY
                System.out.println("New value!");
                myValues.put(curPos.data, curPos.data);
                newList.insertNode(curPos.data);
            }
            else {  //THIS IS A DUPLICATE VALUE; NEED TO 'REMOVE IT' FROM THE LINKED LIST
                System.out.println("This is a duplicate value");
            }
            
            //MOVE CURSOR
            prevPos = curPos;
            curPos = curPos.next;
            temp = 0;

        }
        
        return newList.head;
    }

/*

//ANOTHER SOLUTION:

 static SinglyLinkedListNode removeDuplicates(SinglyLinkedListNode head) {
        if(head==null){
            return null;
        }
        SinglyLinkedList newList = new SinglyLinkedList();
        SinglyLinkedListNode node = head;
       
        Set<Integer> set = new HashSet<>();
       
        while(node!=null){
            int currNodeData = node.data;
            boolean isUniqueNode = set.add(currNodeData);
            if(isUniqueNode){
               newList.insertNode(currNodeData);
            }
            node = node.next;
            
        }
        
        return newList.head;
        
    }    
*/
        
        
        
