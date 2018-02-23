library(ISLR)
names(Smarket)
dim(Smarket)
?Smarket
summary(Smarket)
# visualize the dataset
pairs(Smarket, col = Smarket$Direction)

attach(Smarket)
# devide the dataset into training set and testing set
training <- Year<2005
# fit the model by Logistic Regression
glm.fit <- glm(Direction~Lag1+Lag2, data = Smarket, family = binomial, subset = training)
summary(glm.fit)

# test the model
newdata <- subset(Smarket, Year==2005)
glm.probs <- predict(glm.fit, newdata=Smarket[!training,], type = "response")
#threshold
glm.pred <- ifelse(glm.probs>0.5,"Up","Down")
Direction2005 <- Direction[Year==2005]
table(glm.pred, Direction[Year==2005])
mean(glm.pred==Direction[Year==2005])


## K-Nearest Neighbors
library(class)
?knn
attach(Smarket)
Xlag=cbind(Lag1,Lag2)
train=Year<2005
knn.pred=knn(Xlag[train,],Xlag[!train,],Direction[train],k=1)
table(knn.pred,Direction[!train])
mean(knn.pred==Direction[!train])
