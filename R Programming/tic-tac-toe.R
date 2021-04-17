#!/usr/bin/R


if (interactive()) {
  con <- stdin()
} else {
  con <- "stdin"
}
cat("X or O? ")
symbol <- readLines(con = con, n = 1)

tic_mat <- matrix(x, nrow = 3, ncol = 3)

check_if_win() <- function(){

	for(i in 1:10){
		if
	
	}

}
