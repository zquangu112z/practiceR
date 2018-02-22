library("ggplot2")

roll <- function(){
  sum(sample(1:6, size = 2, replace = TRUE))
}
qplot(replicate(1000, roll()), binwidth = 1)

roll_weighted <- function(){
  sum(sample(1:6, size = 2, replace = TRUE, prob = c(1/8, 1/8, 1/8, 1/8, 1/8, 3/8)))
}
qplot(replicate(1000, roll_weighted()), binwidth = 1)