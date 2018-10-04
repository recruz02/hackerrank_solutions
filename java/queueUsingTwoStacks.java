import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;

public class Solution {

    public static void main(String[] args) {
        /* Enter your code here. Read input from STDIN. Print output to STDOUT. Your class should be named Solution. */

        
        Stack<Integer> enqueueStack = new Stack<Integer>();
        Stack<Integer> dequeueStack = new Stack<Integer>();
        
        Scanner scanner = new Scanner(System.in);
        int numQueries = scanner.nextInt();        
        int scannerAction = 0;
        int scannerValue = 0;

        
        for (int i = 0; i < numQueries; i++) {
            scannerAction = scanner.nextInt();
            //System.out.println(scannerAction);
            
            if (scannerAction == 1) {   //do enqueue
                scannerValue = scanner.nextInt();
                enqueueStack.push(scannerValue);
                //System.out.println(scannerValue);
            }
            
            else if (scannerAction == 2) { //do dequeue;
                if (dequeueStack.isEmpty()) { //pop all values from enqueueStack to dequeueStack;
                    while(!enqueueStack.isEmpty()) {
                        dequeueStack.push(enqueueStack.pop());
                    }
                }
                
                //pop value from dequeueStack
                dequeueStack.pop();

            }
            else if (scannerAction == 3) { 
                //print top of dequeueStack; 
                //Nothing will print if both stacks are empty;
                
                if (dequeueStack.isEmpty()) { //pop all values from enqueueStack to dequeueStack;
                    while(!enqueueStack.isEmpty()) {
                        dequeueStack.push(enqueueStack.pop());
                    }
                }
                
                if (!dequeueStack.isEmpty()) {
                    System.out.println(dequeueStack.peek());
                }

            }
        
        }

    }
}