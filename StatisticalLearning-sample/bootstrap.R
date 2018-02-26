require(ISLR)
require(boot)
# Estimating the Accuracy of a Statistic of Interest
alpha.fn <- function(data, idx){
  X <- data$X[idx]
  Y <- data$Y[idx]
  alpha <- (var(Y)-cov(X,Y))/(var(X)+var(Y)-2*cov(X,Y))
  alpha
}

alpha.fn(Portfolio, 1:100)

set.seed(1)

alpha.fn(Portfolio, sample(100,100, replace = TRUE))
# the boot() function automates performing the above command many times 
boot(Portfolio, alpha.fn, R=1000)


# Estimating the Accuracy of a Linear Regression Model
boot.fn <- function(data,idx){
  return(coef(glm(mpg~horsepower, data = data, subset = idx)))
}
boot.fn(Auto,1:392)

set.seed(1)
boot(Auto, boot.fn, 1000)
