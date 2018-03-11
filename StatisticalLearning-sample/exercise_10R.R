# 10.R.1 Suppose we want to fit a linear regression, but the number of variables is much larger than the number of observations. In some cases, we may improve the fit by reducing the dimension of the features before.
# In this problem, we use a data set with n = 300 and p = 200, so we have more observations than variables, but not by much. Load the data x, y, x.test, and y.test from 10.R.RData.
# First, concatenate x and x.test using the rbind functions and perform a principal components analysis on the concatenated data frame (use the "scale=TRUE" option). To within 10% relative error, what proportion of the variance is explained by the first five principal components?

load("StatisticalLearning-sample/10.R.RData")
x.new <- rbind(x, x.test)
pr.out <- prcomp(x.new, scale=TRUE)
names(pr.out)
pr.var <- pr.out$sdev^2
pve <- pr.var/sum(pr.var)
sum(pve[1:5])

x.pr <- data.frame(pr.out$x[, 1:5])

x.pr.train <- x.pr[1:300,]
dat.train <- x.pr.train
dat.train$Y <- y
names(dat.train)

x.pr.test <- x.pr[301:1300,]
dat.test <- x.pr.test
# dat.test$Y <- y.test
dim(dat.test)
# dat.test$Y <- y.test

fit <- lm(Y~PC1+PC2+PC3+PC4+PC5, data = dat.train)
summary(fit)
pred <- predict(fit, newdata = dat.test)
length(pred)


# 10.R.2 The previous answer suggests that a relatively small number of "latent variables" account for a substantial fraction of the features' variability. We might believe that these latent variables are more important than linear combinations of the features that have low variance.
# We can try forgetting about the raw features and using the first five principal components (computed on rbind(x,x.test)) instead as low-dimensional derived features. What is the mean-squared test error if we regress y on the first five principal components, and use the resulting model to predict y.test?

# calculate mean square error
sum((y.test-pred)^2)/1000
# [1] 0.9922779

# 10.R.3: Now, try an OLS linear regression of y on the matrix x. What is the mean squared predition error if we use the fitted model to predict y.test from x.test?
dat.x <- data.frame(x)
dat.x$Y <- y
fit2 <- lm(Y~., data = dat.x)
pred2 <- predict(fit2, newdata = data.frame(x.test))
sum((y.test-pred2)^2)/1000
# [1] 3.657197
