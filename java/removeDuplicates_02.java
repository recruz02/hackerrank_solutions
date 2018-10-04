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

        
        
        
