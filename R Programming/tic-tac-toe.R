#!/usr/bin/R


if (interactive()) {
  con <- stdin()
} else {
  con <- "stdin"
}
cat("X or O? ")
symbol <- readLines(con = con, n = 1)

tic_mat <- matrix(, nrow = 3, ncol = 3)

check_if_win() <- function(mat){
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
