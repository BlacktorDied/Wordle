### Wordle Game
This Haskell program implements the classic word-guessing game called Wordle. In Wordle, players attempt to guess a secret word within a limited number of attempts. The game provides feedback on the correctness of each guess, aiding players in their subsequent attempts.

**Objective:** Guess the secret word within 6 attempts.

**Feedback:**
- `*`: Represents an unknown letter in the secret word.
- `-`: Indicates a correct letter in an incorrect position.
- `<letter>`: Denotes a correct letter in the correct position.

**Available Letters:** Displays the letters that haven't been guessed yet.

**Game Over:** If the player exhausts all attempts, the game reveals the secret word.

---

**Instructions:**

1. **Installation:**
   - Ensure you have Haskell installed on your system.
   - Save the provided Haskell code in a file, e.g., `Wordle.hs`.
   - Save a file containing a list of words (one word per line). Save it as `words.txt` in the same directory as the Haskell file.

2. **Compile & Execute:**
   - Open a terminal and navigate to the directory containing the Haskell file and the word list.
   - Compile and execute the Haskell program using the GHC compiler with the command:
     ```
     ghc --make Wordle.hs
     ```
     ```
     ghc --run Wordle.hs
     ```

3. **Gameplay:**
   - Follow the prompts to input your guesses.
   - Input a valid 5-letter word as your guess.
   - Receive feedback on the correctness of your guess.
   - Repeat until you guess the word correctly or exhaust all attempts.

---

**Notes:**
- The program clears the terminal screen for a better user experience.
- The game randomly selects a word from the provided word list.
- This code was generated using GitHub Copilot and refined with input from ChatGPT 3.5/4.

Enjoy playing Wordle!
