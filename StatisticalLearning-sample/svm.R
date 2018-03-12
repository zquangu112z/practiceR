library(e1071)

# generate observation
set.seed(1)
x <- matrix(rnorm(20 * 2), ncol = 2)
x
y <- c(rep(-1, 10), rep(1, 10))
x[y == 1,] <- x[y == 1,] + 1
x

plot(x, col = (3 - y)) # col means color
dat = data.frame(x = x, y = as.factor(y))

# When the cost argument is large,
# then the margins will be narrow
# and there will be few support vectors on the margin or violating the margin
svmfit <- svm(
  y ~ .,
  data = dat,
  kernel = "linear",
  cost = 10,
  scale = FALSE
)
plot(svmfit , dat)
svmfit$index
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
xtest <- matrix(rnorm(20*2), ncol = 2)
ytest <- sample(c(-1, 1), 20, replace = TRUE)
xtest
ytest
xtest[ytest==1,] <- xtest[ytest==1, ] + 1
testdat <- data.frame(x=xtest, y=as.factor(ytest))
# predict 
ypred <- predict(bestmod, testdat)
table(ypred, ytest)

