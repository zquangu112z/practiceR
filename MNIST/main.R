# Load data
source("load_clean.R")
source("classifier.R")

fit <- train(label~., mnist_train[c(1:40000),])
pred <- test(mnist_train[c(40000:42000),], fit)

# Confusion matrixs
cm <- table(iris_test$V5, pred)

# Accuracy
acc <- (cm[1,1] + cm[2,2] + cm[3,3])/sum(cm)
print(paste0("Accuracy: ", as.character(acc)))
