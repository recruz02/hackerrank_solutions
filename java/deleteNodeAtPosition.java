    // Complete the deleteNode function below.

    /*
     * For your reference:
     *
     * SinglyLinkedListNode {
     *     int data;
     *     SinglyLinkedListNode next;
     * }
     *
     */
    static SinglyLinkedListNode deleteNode(SinglyLinkedListNode head, int position) {

        //CHECK FOR ZERO POSITION
        if (position == 0) {
            return head.next;   
        }
        
        //CHECK IF NULL
        if (head == null)
            return null;
        
        SinglyLinkedListNode prevNode = head;
        SinglyLinkedListNode node = head.next;
        
        //TRAVERSE THROUGH NODES TO GET TO CORRECT POSITION; START AT POSITION 1;
        for (int i = 1; i < position; i++) {
            prevNode = node;
            node = node.next;
        }

        //SET PREVIOUS NODE.NEXT TO NODE.NEXT TO "DELETE" NODE
        prevNode.next = node.next;
        
        return head;
    }