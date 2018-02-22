# roll
wheel <- c("DD", "7", "BBB", "BB", "B", "C", "0")
prob <- c("DD"=0.03, "7"=0.03, "BBB" = 0.06,"BB"= 0.1, "B"=0.25, "C"=0.01, "0"=0.52)
get_symbols <- function() {
  sample(wheel, size = 3, replace = TRUE,
         prob = prob)
}

# get prize
score <- function(symbols){
  # cat(symbols)
  # cat("\n")
  if (all(symbols == symbols[1])){
    payouts <- c("DD" = 100, "7" = 80, "BBB" = 40, "BB" = 25, "B" = 10, "C" = 10, "0" = 0)
    prize <- unname(payouts[symbols[1]])
  }else if (all(symbols %in% c("B", "BB", "BBB"))){
    prize <- 5
  } else {
    prize <-  c(0, 2, 5)[sum(symbols == "C") + 1]
  }
  score <- prize * 2^sum(symbols == "DD")
}

# the right way to caculate score
score2 <- function(symbols) {
  diamonds <- sum(symbols == "DD")
  cherries <- sum(symbols == "C")
  # identify case
  # since diamonds are wild, only nondiamonds
  # matter for three of a kind and all bars
  slots <- symbols[symbols != "DD"]
  same <- length(unique(slots)) == 1
  bars <- slots %in% c("B", "BB", "BBB")
  # assign prize
  if (diamonds == 3) {
    prize <- 100
  } else if (same) {
    payouts <- c("7" = 80, "BBB" = 40, "BB" = 25,
                 "B" = 10, "C" = 10, "0" = 0)
    prize <- unname(payouts[slots[1]])
  } else if (all(bars)) {
    prize <- 5
  } else if (cherries > 0) {
    # diamonds count as cherries
    # so long as there is one real cherry
    prize <- c(0, 2, 5)[cherries + diamonds + 1]
  } else {
    prize <- 0
  }
  # double for each diamond
  prize * 2^diamonds
}

slot_display <- function(prize){
  # extract symbols
  symbols <- attr(prize, "symbols")
  # collapse symbols into single string
  symbols <- paste(symbols, collapse = " ")
  # combine symbol with prize as a regular expression
  string <- paste(symbols, prize, sep = "\n$")
  
  cat(string) # cat does not surround its output with quotation marks.
}

play <- function(){
  symbols <- get_symbols()
  # print(symbols) # no need to print it, attach it as an attribute of prize
  prize <- score(symbols)
  # attr(prize, "symbols") <- symbols
  structure(prize, symbols = symbols, class = "slots")
}

# one_play <- play()
# # slot_display(one_play)
# 
# # class(one_play) <- "slots"
# print.slots <- function(x, ...) {
#   slot_display(x)
# }
# 
# one_play  # equal to calling `print(one_play)`

# possibel outcome
outcomes <- expand.grid(wheel, wheel, wheel, stringsAsFactors = FALSE)
outcomes$prob1 <- prob[outcomes$Var1]
outcomes$prob2 <- prob[outcomes$Var2]
outcomes$prob3 <- prob[outcomes$Var3]
outcomes$prob <- outcomes$prob1*outcomes$prob2*outcomes$prob3

# sum(outcomes$prob)  # 1
outcomes$prize <- NA
for(i in 1:343){
  outcomes$prize[i] <- score2(c(outcomes$Var1[i], outcomes$Var2[i], outcomes$Var3[i]))
}

# expected result
sum(outcomes$prize * outcomes$prob)
## 0.538014 if use score
## 0.934356 if use score2


plays_till_broke <- function(start_with) {
  cash <- start_with
  n <- 0
  cast_big_n <- 0
  while (cash > 0) {
    cash <- cash - 1 + play()
    n <- n + 1
    if (cash > 100){
      cast_big_n <- cast_big_n + 1
    }
  }
  # number of times the total cash is over $100
  cat(cast_big_n)
  n
}
plays_till_broke(100)
