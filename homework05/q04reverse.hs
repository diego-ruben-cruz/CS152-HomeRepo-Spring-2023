{-
Description:
Haskell file for HW5.
Create your own implementation of reverse, which reverses a list in haskell

Name: Diego Cruz
SID: 013540384

Course: CS 152
Section: 01
Homework: HW5
Date: 01 May 2023

To compile:
ghc -o q4 q04reverse.hs

To run:
./q4
-}

reverseList :: [a] -> [a]
reverseList [] = [] -- This is the base case that handles emptylist
reverseList (x:xs) = reverseList xs ++ [x]
{-
x refers to the head
xs refers to the tail
The ++ operator appends the head to the end of the list, as used here
-}


main :: IO ()
main = do
        print (reverseList [1,2,3,4,5])
        if null (reverseList [])
            then putStrLn "List is empty"
            else putStrLn "List was not empty!"