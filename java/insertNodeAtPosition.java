    // Complete the insertNodeAtPosition function below.

    /*
     * For your reference:
     *
     * SinglyLinkedListNode {
     *     int data;
     *     SinglyLinkedListNode next;
     * }
     *
     */
    static SinglyLinkedListNode insertNodeAtPosition(SinglyLinkedListNode head, int data, int position) {

        SinglyLinkedListNode newNode = new SinglyLinkedListNode(data);
        
        if (head == null)
            return newNode;

        SinglyLinkedListNode prevPos = head;
        SinglyLinkedListNode curPos = head.next;

        for (int i = 1; i < position; i++) {
            prevPos = curPos;
            curPos = curPos.next;
        }
        
        prevPos.next = newNode;
        newNode.next = curPos;
        
        return head;
    }