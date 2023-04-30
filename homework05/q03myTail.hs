{-
Description:
Haskell file for HW5.
Given that the tail function tends to 

Name: Diego Cruz
SID: 013540384

Course: CS 152
Section: 01
Homework: HW5
Date: 01 May 2023

To compile:
ghc -o q3 q03mytail.hs

To run:
./q3
-}

myTail :: [a] -> [a]
myTail list = if null list
                then []
                else tail list

main :: IO ()
main = do
    print (myTail [1,2,3,4,5])
    if null (myTail [])
        then putStrLn "List is empty"
        else putStrLn "List was not empty!"