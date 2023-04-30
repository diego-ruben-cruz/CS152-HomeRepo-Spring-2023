{-
Description:
Haskell file for HW5.
Create a functionally equivalent command to the 'cp' command in linux

Name: Diego Cruz
SID: 013540384

Course: CS 152
Section: 01
Homework: HW5
Date: 01 May 2023

To compile:
ghc -o q8 q08unixcp.hs

To run:
./q8
-}
import System.Directory (copyFile)

main = do
    copyFile "E:/SJSU/2023-01-Spring-CS152/homework05/example.txt" "E:/SJSU/2023-01-Spring-CS152/homework05/ex2.txt"
