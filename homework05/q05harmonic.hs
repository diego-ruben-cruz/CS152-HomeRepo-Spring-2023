{-
Description:
Haskell file for HW5.
Create harmonic function to compute the sum of a harmonic sequence given an nth term to compute to

Name: Diego Cruz
SID: 013540384

Course: CS 152
Section: 01
Homework: HW5
Date: 01 May 2023

To compile:
ghc -o q5 q05harmonic.hs

To run:
./q5
-}

harmonic :: Double -> Double
harmonic 1 = 1 -- Base case which handles 1 and ends recursion
harmonic input | input > 1 = (1/input) + harmonic (input - 1)
                | otherwise = error "n must be a positive integer"

main :: IO ()
main = do
    putStrLn "Expected result of harmonic 5: 2.2833"
    putStr "Actual result of harmonic 5: "
    print (harmonic 5)