states <- row.names(USArrests)
states
names(USArrests)
apply(USArrests, 2, mean) # The second input here denotes whether we wish to compute the mean of the rows, 1, or the columns, 2
apply(USArrests, 2, var)
pr.out <- prcomp(USArrests, scale=TRUE)
names(pr.out)
# loadings
pr.out$rotation
# scores
pr.out$x
biplot(pr.out, scale=0)
