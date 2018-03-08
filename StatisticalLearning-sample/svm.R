# generate observation
set.seed(1)
x <- matrix(rnorm(20 * 2), ncol = 2)
x
y <- c(rep(-1, 10), rep(1, 10))
x[y == 1,] <- x[y == 1,] + 1
x

plot(x, col=(3-y))
dat = data.frame(x = x, y = as.factor(y))
library(e1071)
svmfit <- svm(y~., data=dat, kernel="linear", cost=0.1, scale=FALSE)
plot(svmfit , dat )

summary(svmfit)