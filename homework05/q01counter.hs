{-
Description:
Haskell file for HW5.
Write the provided counter function but use nested lambas instead of let

Name: Diego Cruz
SID: 013540384

Course: CS 152
Section: 01
Homework: HW5
Date: 26 Apr 2023

To compile:
:load q01counter.hs

To run:
main
-}
{-
-- This is the original function
counter x = let x = x + 1
            in
             let x = x + 1
             in
              x
-}
-- Write the revised function here
counter = (\x -> (\x -> x + 1) ((\x -> x + 1) x))

main :: IO ()
main = do
    let result0 = counter 0
    print result0
    let result1 = counter 1
    print result1
    let result2 = counter 2
    print result2
