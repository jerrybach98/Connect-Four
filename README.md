# Connect Four
A command-line interface (CLI) Connect Four game written in Ruby that allows two players to compete against each other. The game board is updated after each turn, and the players can see the results on the terminal.

## How to Play:
**Play Online:**\
[![Try with Replit](https://replit.com/badge?caption=Try%20with%20Replit)](https://replit.com/@jerrybach98/Connect-Four)\
Or to play locally, you must have Ruby installed. See [here](https://www.ruby-lang.org/en/downloads/) for more details. This program was written in Ruby 3.2.2. Clone this repository, navigate to the directory and type ruby lib/main.rb in your terminal.

## Tech Stack
- **Language:** Ruby
- **Testing:** RSpec

## Features:
* 2-player game functionality
* Game board display with color-coded tokens
* Win condition checks for rows, columns, and diagonals
* Option to play until a draw or a winner is determined
* Input validation to ensure tokens are placed in a valid column


## Lessons Learned:
* Developing a command line interface application using object-oriented programming principles.
* Writing comprehensive tests with RSpec to ensure the correctness of the game logic.
* Adjusting RSpec to achieve the desired test output.
* Testing instance doubles and stubs to isolate dependencies during testing.
* Understanding the importance of the single responsibility principle and modular code for test-driven development.
* Creating a functioning game that captures user input and implements the game's logic.
* Manipulating nested arrays to represent and dynamically update the game board.


## Further ehancements:
* Install gems for easier terminal viewing of the board by adding more visual design elements.
* Add a feature to allow users to restart the game after a win or draw.
* Implement AI for single-player mode so players can compete against the computer.
* Add a score tracker that counts wins for each player across multiple games.