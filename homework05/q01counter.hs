{-
Description:
Haskell file for HW5.
Write the provided counter function but use nested lambas instead of let

Name: Diego Cruz
SID: 013540384

Course: CS 152
Section: 01
Homework: HW5
Date: 01 May 2023

To compile:
ghc -o q1 q01counter.hs

To run:
./q1
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
    putStrLn "Expected result of counter 0 => 2"
    putStr "Actual result of counter 0 => "
    print result0

    let result1 = counter 1
    putStrLn "Expected result of counter 1 => 3"
    putStr "Actual result of counter 1 => "
    print result1

    let result2 = counter 2
    putStrLn "Expected result of counter 2 => 4"
    putStr "Actual result of counter 2 => "
    print result2
