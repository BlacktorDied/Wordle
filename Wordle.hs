import System.Console.ANSI
import System.Random (randomRIO)
import Data.List (intersect, nub)
import Data.Char (toLower)

-- Function to clear the terminal screen
clearScreen :: IO ()
clearScreen = System.Console.ANSI.clearScreen >> setCursorPosition 0 0

-- Function to read words from a file
readWordsFromFile :: FilePath -> IO [String]
readWordsFromFile filePath = do
    contents <- readFile filePath
    return (lines contents)

-- Function to choose a random word from a list
chooseRandomWord :: [String] -> IO String
chooseRandomWord words = do
    index <- randomRIO (0, length words - 1)
    return (words !! index)

-- Function to check if a word is valid
isValidWord :: String -> Bool
isValidWord word = length word == 5 && all (`elem` ['a'..'z']) word

-- Function to check if a guess is correct
isCorrectGuess :: String -> String -> Bool
isCorrectGuess secretWord guess = secretWord == guess

-- Function to get the feedback for each letter in the guess
getLetterFeedback :: String -> String -> String
getLetterFeedback secretWord guess =
    map (\(g, s) -> if g == s then g else if g `elem` secretWord then '-' else '*') (zip guess secretWord)

-- Function to get available letters
getAvailableLetters :: String -> String -> String
getAvailableLetters secretWord guess =
    map (\s -> if s `elem` guess && s `notElem` secretWord then '*' else s) ['a'..'z']

-- Function to play the Wordle game
playWordle :: [String] -> IO ()
playWordle words = do
    secretWord <- chooseRandomWord (filter isValidWord words)
    System.Console.ANSI.clearScreen
    putStrLn "Welcome to Wordle!"
    putStrLn "Rules:\n 1. *: unknown letter\n 2. -: correct letter & incorrect position\n 3. <letter>: correct letter & correct position\n 4. You have 6 guesses\n\n"
    putStrLn "Guess the secret word: *****"
    playTurns secretWord 1

-- Function to play the turns of the game
playTurns :: String -> Int -> IO ()
playTurns secretWord turn = do
    putStrLn ("Guess " ++ show turn ++ ": ") 
    guess <- getLine
    if isValidWord (map toLower guess)
        then do
            if isCorrectGuess secretWord guess
                then putStrLn "\nCongratulations! You guessed the word!"
                else do
                    let feedback = getLetterFeedback secretWord guess
                        availableLetters = getAvailableLetters secretWord guess
                    putStrLn ("Feedback: " ++ feedback)
                    putStrLn ("Available letters: " ++ availableLetters ++ "\n")
                    if turn == 6
                        then putStrLn ("\nGame over! The secret word was: " ++ secretWord)
                        else playTurns secretWord (turn + 1)
        else do
            putStrLn "Invalid guess! Please enter a valid 5-letter word.\n"
            playTurns secretWord turn


-- Main function
main :: IO ()
main = do
    words <- readWordsFromFile "words.txt"
    playWordle words
