package homework01;

import java.util.ArrayList;

public class spOdd {

    /**
     * Basic function to filter the odd numbers present in a given array and output
     * them in an ArrayList
     * 
     * @param inputArray The given int array that will be filtered
     * @return An ArrayList that contains only the odd numbers from the previous
     *         array, no sorting
     */
    public static ArrayList<Integer> getOddNums(int[] inputArray) {
        ArrayList<Integer> outputArray = new ArrayList<Integer>();
        for (int i = 0; i < inputArray.length; i++) {
            if (inputArray[i] % 2 == 1) {
                outputArray.add(inputArray[i]);
            }
        }
        return outputArray;
    }

    // Main function for testing purposes
    public static void main(String[] args) {
        int[] mainArray = { 3, 8, 5, 7, 1, 9, 2 }; // variable containing sample input
        System.out.println("Original Array: [3, 8, 5, 7, 1, 9, 2]"); // Basic print of reference array

        ArrayList<Integer> output = spOdd.getOddNums(mainArray); // Main execution of odd number retrieval
        System.out.print("\nHere are the odd numbers of the array: ["); // Print statement before loop iterates thru
                                                                        // ArrayList from odd number retrieval
        for (int i = 0; i < output.size() - 1; i++) {
            System.out.print(output.get(i) + ", "); // Cycles through the ArrayList until it gets to the second-to-last
                                                    // value, then stops for last value to do cleanup
        }
        System.out.println(output.get(output.size() - 1) + "]"); // Cleanup that includes last value of ArrayList and
                                                                 // wraps up the output string
    }
}