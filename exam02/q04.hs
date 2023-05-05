{-
Description:
Haskell file for Exam 2.

Implement the three following haskell functions:
ltrim removes all items from the start of the list that satisfy the predicate function.
rtrim removes all items from the end of the list that satisfy the predicate function.
trim removes all items from both the start and end of the list that satisfy the predicate function.

Name: Diego Cruz
SID: 013540384

Course: CS 152
Section: 01
Date: 05 May 2023

To compile:
ghc -o q4 q04.hs

To run:
./q4
-}

ltrim :: (a -> Bool) -> [a] -> [a]
ltrim pred = dropWhile pred . dropWhile (not . pred)

rtrim :: (a -> Bool) -> [a] -> [a]
rtrim pred lst = reverse $ dropWhile pred $ reverse lst

trim :: (a -> Bool) -> [a] -> [a]
trim pred lst = dropLastWhile pred (dropWhile pred lst)

-- Utility function for trim
dropLastWhile :: (a -> Bool) -> [a] -> [a]
dropLastWhile pred lst = reverse (dropWhile pred (reverse lst))

main :: IO ()
main = do
    let nums = [1,2,3,4,5]
    
    putStrLn "Expected value of ltrim (<3) nums: [3,4,5]"
    putStr "Actual value of ltrim (<3) nums: "
    let lnums = ltrim (<3) nums
    print lnums

    putStrLn "Expected value of rtrim (>3) nums: [1,2,3]"
    putStr "Actual value of rtrim (>3) nums: "
    let rnums = rtrim (>3) nums
    print rnums

    putStrLn "Expected value of trim (/=3) nums: [3]"
    putStr "Actual value of trim (/=3) nums: "
    let tnums = trim (/=3) nums
    print tnums