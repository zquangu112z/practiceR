# Load data
source("load_clean.R")
source("classifier.R")

plot(iris, col = iris$V5)

fit <- train(V5~., iris_train)
pred <- test(iris_test, fit)

# Confusion matrixs
cm <- table(iris_test$V5, pred)

# Accuracy
acc <- (cm[1,1] + cm[2,2] + cm[3,3])/sum(cm)
print(paste0("Accuracy: ", as.character(acc)))
