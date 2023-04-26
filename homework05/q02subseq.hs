{-
Description:
Haskell file for HW5.
Write a function subseq that takes three arguments
- start position
- end position
- list
The function should return the subsequence between
the start and end.

Name: Diego Cruz
SID: 013540384

Course: CS 152
Section: 01
Homework: HW5
Date: 26 Apr 2023

To compile:
:load q02subseq.hs

To run:
main
-}

-- This is the main definition of the subseq function.
subseq :: Int -> Int -> [a] -> [a]
subseq lowerbound upperbound list = take (upperbound - lowerbound + 1) (drop lowerbound list)

main :: IO ()
main = do
    let result0 = subseq 2 5 [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    print result0
    let result1 = subseq 2 7 "a puppy"
    print result1