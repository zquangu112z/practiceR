library(tree)
library(ISLR)
attach(Carseats)


# append High to the dataset
High <- ifelse(Sales <= 8, "No", "Yes")
Carseats <- data.frame(Carseats, High)



set.seed(2)
train <- sample(1:nrow(Carseats), 200)
Carseats.test <- Carseats[-train, ]
tree.carseats <- tree(High ~ . - Sales, Carseats , subset = train)
tree.pred <- predict(tree.carseats, Carseats.test, type = "class")
table(tree.pred, Carseats.test$High)

# visualize tree
# plot(tree.carseats)
# text(tree.carseats, pretty = 0)

cv.carseats <- cv.tree(tree.carseats, FUN = prune.misclass)
names(cv.carseats)
cv.carseats
