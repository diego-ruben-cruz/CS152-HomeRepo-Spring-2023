{-
Description:
Haskell file for Exam 2.
Write a program that allows a user to select a number between 1 and 5 and then prints a famous quote
(quotes are of your choosing). After printing the quote, the program will ask whether the user would
like another. If the user enters n, the program ends; otherwise, the user gets another quote. The program
repeats until the user enters n. Try to use lazy evaluation and treat the user input as a list rather than
recursively calling main at the end.

Name: Diego Cruz
SID: 013540384

Course: CS 152
Section: 01
Date: 05 May 2023

To compile:
ghc -o q3 q03.hs

To run:
./q3
-}
import Text.Read (readMaybe)

-- Collection of quotes is here
quotes = [
    "Pray not for easy lives, my men. Pray for the strength to live through a hard one. -John F. Kennedy", 
    "Dare to see the world, for what it could be. -Dr. Harold Winston",
    "Life is more than a series of ones and zeroes. -Zenyatta",
    "Life, is a uniquely damaging event. -Dima",
    "The future is already here - It's just not very evenly distributed. -William Gibson"
    ]

-- Basic inspire function given number and list
inspire :: Int -> [Int] -> IO [Int]  
inspire num history = do
    putStrLn (quotes !! (num-1))
    return (history ++ [num])

-- Init Prompt function
initPrompt :: IO Int
initPrompt = do
    putStrLn "Pick a number between 1-5: "
    input <- getLine
    let parsedInput = readMaybe input :: Maybe Int
    case parsedInput of
        Just n | n >= 1 && n <= 5 -> return n
        _ -> do
            putStrLn "Invalid input. Please enter a number between 1-5."
            initPrompt

-- Follow-up Prompt function
followPrompt :: [Int] -> IO [Int]
followPrompt history = do
    putStrLn "Would you like another quote? (1-5/n): "
    input <- getLine
    case input of
        "n" -> do
            putStrLn "Goodbye!"
            return history
        _ -> case readMaybe input :: Maybe Int of
            Just n | n >= 1 && n <= 5 -> inspire n history >>= followPrompt
            _ -> do
                putStrLn "Invalid input. Please enter a number between 1-5 or 'n'."
                followPrompt history

main :: IO()
main = do
    num <- initPrompt
    history <- inspire num []
    history <- followPrompt history
    putStrLn ("Your history: " ++ show history)