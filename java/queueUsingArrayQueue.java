import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;

public class Solution {

    public static void main(String[] args) {
        /* Enter your code here. Read input from STDIN. Print output to STDOUT. Your class should be named Solution. */
        
        Queue myQueue = new ArrayDeque();

        
        Scanner scanner = new Scanner(System.in);
        int numQueries = scanner.nextInt();
        int scannerAction = 0;
        int scannerValue = 0;
        
        for (int i = 0; i < numQueries; i++) {
            scannerAction = scanner.nextInt();
            if (scannerAction == 1) {   //do enqueue
                scannerValue = scanner.nextInt();
                myQueue.add(scannerValue);
            }
            else if (scannerAction == 2) { //do dequeue;
                myQueue.remove();
            }
            else if (scannerAction == 3) { //print head of queue
                System.out.println(myQueue.peek());
            }
        
        }

    }
}