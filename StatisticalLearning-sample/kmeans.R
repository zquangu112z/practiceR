set.seed(2)
x <- matrix(rnorm(50*2), ncol = 2)
x[1:25,1] <- x[1:25,1]+3
x[1:25,2] <- x[1:25,2]-4
plot(x)
# K-means clustering with K = 2
?kmeans
km.out <- kmeans(x, 2, nstart=20)
km.out$cluster
plot(x, col=(km.out$cluster+1), main="K-means with K=2", xlab="", ylab="", pch=20, cex=2)
