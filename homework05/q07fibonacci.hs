{-
Description:
Haskell file for HW5.
Create a function to  

Name: Diego Cruz
SID: 013540384

Course: CS 152
Section: 01
Homework: HW5
Date: 01 May 2023

To compile:
ghc -o q7 q07fibonacci.hs

To run:
./q7
-}

fibonacci :: Int -> Int
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci input | input > 1 = fibonacci (input - 1) + fibonacci (input - 2)
                | otherwise = error "n must be a positive integer"

main :: IO ()
main = do
    putStrLn "Expected result of fibonacci 6 => 8"
    putStr "Actual result of fibonacci 6 => "
    print (fibonacci 6)