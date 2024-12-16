# Tic Tac Toe Game in R

# Initialize an empty 3x3 board
board <- matrix("", nrow = 3, ncol = 3)

# Function to display the current board
display_board <- function() {
  cat("\n")
  for (i in 1:3) {
    cat(paste(board[i, ], collapse = " | "), "\n")
    if (i < 3) cat("---------\n")
  }
  cat("\n")
}

# Function to check if there's a winner
check_winner <- function(player) {
  # Check rows and columns
  for (i in 1:3) {
    if (all(board[i, ] == player) || all(board[, i] == player)) {
      return(TRUE)
    }
  }
  # Check diagonals
  if (all(diag(board) == player) || all(diag(board[, ncol(board):1]) == player)) {
    return(TRUE)
  }
  return(FALSE)
}

# Main game loop
current_player <- "X"
while (TRUE) {
  display_board()
  cat(paste("Player", current_player, ": Enter row (1-3) and column (1-3): "))
  row <- as.integer(readline())
  col <- as.integer(readline())
  
  # Check if the cell is empty
  if (board[row, col] == "") {
    board[row, col] <- current_player
    if (check_winner(current_player)) {
      display_board()
      cat("Player", current_player, "wins!\n")
      break
    }
    current_player <- ifelse(current_player == "X", "O", "X")
  } else {
    cat("Cell already taken. Try again.\n")
  }
}
