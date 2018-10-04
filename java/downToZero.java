import java.io.*;
import java.math.*;
import java.text.*;
import java.util.*;
import java.util.regex.*;

public class Solution {
    
    static Set<Integer> allMultiplesOf(int x) {
        Set<Integer> multiples = new HashSet<Integer>();
        
        for (int i = x-1; i > 1; i--) {
            if ((x % i) == 0) {
                int maxMultiple = Math.max(i, (x/i));
                if (!multiples.contains(maxMultiple))
                    multiples.add(maxMultiple);
            }
        }
        
        return multiples;
    }
    
    
    static int downToZero(int n) {

        //PSUEDO CODE: 
        //1) FIND ALL MULTIPLES OF N
        //2) FOR EACH MULTIPLE OF N, RECURSIVELY ATTEMPT COUNT OF DOWNTOZERO;
        //3) RETURN "MIN" OF ALL DOWN TO ZERO CALCULATIONS
        
        Set<Integer> multiples = allMultiplesOf(n);
        System.out.println(multiples);
        int returnValue = n;    //max return value is number n (iterating down to 0)
        int counter = 0;
        
        for (Integer multiple : multiples) {
            counter = 0;
            
            if (n == 0)
                return 0;
            else if (n == 1)
                return 1;
            else {
                counter++;
                counter += Math.min(downToZero(multiple),downToZero(n-1));
            }
            
            returnValue = Math.min(returnValue,counter);
        }

            
  
        return returnValue;
    }

    private static final Scanner scanner = new Scanner(System.in);

    public static void main(String[] args) throws IOException {
        BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter(System.getenv("OUTPUT_PATH")));

        int q = Integer.parseInt(scanner.nextLine().trim());

        for (int qItr = 0; qItr < q; qItr++) {
            int n = Integer.parseInt(scanner.nextLine().trim());

            int result = downToZero(n);

            bufferedWriter.write(String.valueOf(result));
            bufferedWriter.newLine();
        }

        bufferedWriter.close();
    }
}
