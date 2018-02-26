load("./5R.RData")

fit <- glm(y~., data=Xy)
summary(fit)

boot.fn <- function(data,idx){
  return(coef(glm(y~., data = data, subset = idx)))
}

require(boot)
set.seed(1)
boot.fn(Xy,sample(1:100,100,replace=TRUE))

boot(Xy, boot.fn, R = 1000)


## block bootstrap 
## One of your bootstrap resamples would like,
## new.rows = c(101:200, 401:500, 101:200, 901:1000, 301:400, 1:100, 1:100, 801:900, 201:300, 701:800)
## new.Xy = Xy[new.rows, ]

attach(Xy)
alpha=function(x1,x2,y){ 
  (summary(glm(y~x1 + x2))$coefficients)[2,1] 
}
alpha.fn=function(data, index){ 
  a<-sample(1:10,10,replace=T) 
  newrow =integer()
  
  for (i in 1:10) { 
    oldrow=newrow 
    v=(1+(a[i]-1)*100):(a[i]*100) 
    newrow=c(oldrow, v) 
  }
  new.data = data[newrow, ] 
  with(new.data[index,],alpha(X1,X2,y))
}
cv = rep(0,1000) 
for (j in 1:1000) { 
  cv[j]=alpha.fn(Xy,1:1000) 
}
sd(cv)
