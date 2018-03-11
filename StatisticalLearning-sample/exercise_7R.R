# Load the data from the file 7.R.RData, and plot it using plot(x,y). What is the slope coefficient in a linear regression of y on x (to within 10%)?
load("StatisticalLearning-sample/7.R.RData")
dat <- data.frame(x,y)
fit1 <- glm(y~x, data = dat)
summary(fit1)

# For the model y ~ 1+x+x^2, what is the coefficient of x (to within 10%)?
fit2 <- glm(y~1+x+I(x^2), data = dat)
summary(fit2)
