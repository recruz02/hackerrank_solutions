    // Complete the insertNodeAtTail function below.

    /*
     * For your reference:
     *
     * SinglyLinkedListNode {
     *     int data;
     *     SinglyLinkedListNode next;
     * }
     *
     */
    static SinglyLinkedListNode insertNodeAtTail(SinglyLinkedListNode head, int data) {

        SinglyLinkedListNode tail = new SinglyLinkedListNode(data);

        if (head == null) {
            head = tail;
            return head;
        }
        
        //TRAVERSE TO TAIL; CHECK "NODE.NEXT FOR NULL"
        SinglyLinkedListNode node = head; 
        while (node.next != null) {
            node = node.next;
        }
        
        //INSERT NODE AT TAIL;
        node.next = tail;
        
        return head;
    }
