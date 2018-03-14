# Load data
dat <- read.table(
  "Fiisoft/Delivery/deliver3Group.ml",
  quote = "\"",
  comment.char = "",
  skip = 1, # ignore the first line
  colClasses=c(rep(NA, 2), rep("NULL",2)), # ignore the last 2 columns
  stringsAsFactors = TRUE
)

# K-means clustering with K = 3
km.out <- kmeans(dat, centers = 3, nstart=20)
km.out$cluster
plot(dat, col=(km.out$cluster+1), main="K-means with K=3", xlab="x", ylab="y", pch=20, cex=2)
