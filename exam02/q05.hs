{-
Description:
Haskell file for Exam 2.

Write a function rotabc that changes a's to b's, b's to c's and c's to a's in a string.
Only lowercase letters are affected.

Name: Diego Cruz
SID: 013540384

Course: CS 152
Section: 01
Date: 05 May 2023

To compile:
ghc -o q5 q05.hs

To run:
./q5
-}

-- See filter vs map question from hw5
rotabc :: String -> String
rotabc =
  map
    ( \c -> case c of
        'a' -> 'b'
        'b' -> 'c'
        'c' -> 'a'
        _ -> c
    )

main :: IO ()
main = do
  let examplestr = "cab"
  putStrLn "Current value of examplestr: \"cab\""
  putStrLn "Expected value of rotabc examplestr: \"abc\""
  putStr "Actual value of rotabc examplestr: "
  print (rotabc examplestr)