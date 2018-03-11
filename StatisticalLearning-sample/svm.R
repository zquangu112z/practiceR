# generate observation
set.seed(1)
x <- matrix(rnorm(20 * 2), ncol = 2)
x
y <- c(rep(-1, 10), rep(1, 10))
x[y == 1,] <- x[y == 1,] + 1
x

plot(x, col = (3 - y))
dat = data.frame(x = x, y = as.factor(y))
library(e1071)
# When the cost argument is large,
# then the margins will be narrow
# and there will be few support vectors on the margin or violating the margin
svmfit <- svm(
  y ~ .,
  data = dat,
  kernel = "polynomial",
  cost = 10,
  scale = FALSE
)
plot(svmfit , dat)

summary(svmfit)

set.seed(1)
tune.out <-
  tune(svm,
       y ~ .,
       data = dat,
       kernel = "linear",
       ranges = list(cost = c(0.001, 0.01, 0.1, 1, 5, 10, 100)))
summary(tune.out)

# select the best model
bestmod =tune.out$best.model
summary(bestmod)
