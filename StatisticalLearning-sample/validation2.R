library(ISLR)
library(boot)  # contains cv.glm()
glm.fit <- glm(mpg~horsepower, data = Auto)
cv.err <- cv.glm(Auto, glm.fit)
cv.err$delta

cv.error <-  rep(0,5)
for(i in 1:5){
  glm.fit <- glm(mpg~poly(horsepower,i), data = Auto)
  # LOOCV
  cv.error[i] <- cv.glm(Auto, glm.fit)$delta[1]
  # K-fold validation
  cv.error[i] <- cv.glm(Auto, glm.fit)$delta[1] 
}
print(cv.error)

