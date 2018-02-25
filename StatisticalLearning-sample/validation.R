library(ISLR)
library(boot)
set.seed(1)
train=sample(392,196)
fit = lm(mpg~horsepower, data=Auto, subset = train)

attach(Auto)
mean((mpg-predict(fit, Auto))[-train]^2)

fit2 = lm(mpg~poly(horsepower ,2), data = Auto , subset = train)
mean((mpg-predict(fit2, Auto))[-train]^2)

fit3 = lm(mpg~poly(horsepower ,3), data = Auto , subset = train)
mean((mpg-predict(fit3, Auto))[-train]^2)
