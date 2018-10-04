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
        
        Integer temp = 0;        
        SinglyLinkedListNode curPos = head.next;


        while (curPos != null) {

            System.out.println(curPos.data);
            temp = myValues.get(curPos.data);   //CHECK DICTIONARY
            
            if (temp == null) { //THIS IS A NEW VALUE, SO ADD TO THE DICTIONARY
                System.out.println("New value!");
                myValues.put(curPos.data, curPos.data);
                newList.insertNode(curPos.data);
            }
            else {  //THIS IS A DUPLICATE VALUE; DON'T ADD TO LIST;
                System.out.println("This is a duplicate value");
            }
            
            //MOVE CURSOR
            curPos = curPos.next;
            temp = 0;
        }
        
        return newList.head;
    }

        
        
