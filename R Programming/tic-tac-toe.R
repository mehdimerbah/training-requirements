#!/usr/bin/R
if (interactive()) {
  con <- stdin()
} else {
  con <- "stdin"
}

checkWinner <- function(mat){
	x_sum <- utf8ToInt("X")*3
	o_sum <- utf8ToInt("O")*3
	pos_diag_sum = 0
	neg_diag_sum = 0
	for(i in 1:3){
	check_sum_row = 0
	check_sum_col = 0
		for(j in 1:3){
		check_sum_row <- check_sum_row + utf8ToInt(mat[i,j])
		check_sum_col <- check_sum_col + utf8ToInt(mat[j,i])
			if(i==j){
				pos_diag_sum <- pos_diag_sum + utf8ToInt(mat[i,j])
			}
		}
		neg_idx <- 4-i
		neg_diag_sum <- neg_diag_sum + utf8ToInt(mat[i,neg_idx])
		if(check_sum_row == x_sum | check_sum_col == x_sum){
			return("X")
		}
		else if(check_sum_row == o_sum | check_sum_col == o_sum){
			return("O")
		}

	}
	if(pos_diag_sum == x_sum | neg_diag_sum == x_sum){
		return("X")
	}
	else if(pos_diag_sum == o_sum | neg_diag_sum == o_sum){
		return("O")
	}

return("Tie")
}


printGame <- function(mat){
	cat('---------------------')
	cat("\n")
	print(mat)
	cat("\n")
	cat('---------------------')
	cat("\n")
}

play <- function(){
	counter <- 0
	player <- "Player 1"
	tic_mat <- matrix(rep('_', times=9), nrow = 3, ncol = 3)
	rownames(tic_mat) <- c(1,2,3)
	colnames(tic_mat) <- c(1,2,3)
	printGame(tic_mat)

	## Main Loop
	while(counter <= 9){
		counter <- counter + 1

		if(counter %% 2 == 0){
			player <- "Player 2"
			symbol <- "O"
		}
		else{
			player <- "Player 1"
			symbol <- "X"
		}
		
		print(paste(player, "Where do you want your symbol?"))
		
		cat("Enter row: ")
		row <- readLines(con=con, n=1)
		row <- as.integer(row)
		cat("Enter column: ")
		col <- readLines(con=con, n=1)
		col <- as.integer(col)


		tic_mat[row,col] <- symbol
		printGame(tic_mat)

		if(counter >= 5){
			res <- checkWinner(tic_mat) 
			if( res == "X"){
				print("Player 1 wins!")
				break
			}
			else if( res == "O"){
				print("Player 2 wins!")
				break
			}
			else{
				if(counter == 9){
					print("Tie!")
				}
				else{
					next
				}
			}
		}
	}

}
play()
