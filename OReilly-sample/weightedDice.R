library("ggplot2")

prob <- c("1" = 1/8, "2" = 1/8, "3" = 1/8, "4" = 1/8, "5" = 1/8, "6" = 3/8)

roll <- function(){
  sum(sample(1:6, size = 2, replace = TRUE))
}
qplot(replicate(1000, roll()), binwidth = 1)

roll_weighted <- function(){
  sum(sample(1:6, size = 2, replace = TRUE, prob = prob))
}
qplot(replicate(1000, roll_weighted()), binwidth = 1)

rolls <- expand.grid(1:6, 1:6)
# add new column
rolls$value <- rolls$Var1 + rolls$Var2
rolls$prob1 <- prob[rolls$Var1]
rolls$prob2 <- prob[rolls$Var2]
rolls$prob <- prob[rolls$Var1]*prob[rolls$Var2]

# expected result
exp_result <- sum(rolls$value*rolls$prob)
