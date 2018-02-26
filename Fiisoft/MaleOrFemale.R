MaleOrFemaleTrain <- read.table("~/Fiisoft/practice-R/Fiisoft/MaleOrFemaleTrain.ml",
                                quote="\"", comment.char="", stringsAsFactors=TRUE)
pairs(MaleOrFemaleTrain, col = MaleOrFemaleTrain$V4)
MaleOrFemaleTrain$V4 <- factor(MaleOrFemaleTrain$V4, labels = c("M","F") )
attach(MaleOrFemaleTrain)



fit <- glm(V4~V1+V2+V3, data = MaleOrFemaleTrain  ,family = binomial)


# Test
MaleOrFemaleResult <- read.table("~/Fiisoft/practice-R/Fiisoft/MaleOrFemaleResult.ml",
                                quote="\"", comment.char="", stringsAsFactors=TRUE)
pairs(MaleOrFemaleResult, col = MaleOrFemaleResult$V4)
MaleOrFemaleResult$V4 <- factor(MaleOrFemaleResult$V4, labels = c("M","F") )
probs <- predict(fit, newdata=MaleOrFemaleResult, type = "response")
pred <- ifelse(probs<0.5,"M","F")

table(pred, MaleOrFemaleResult$V4)
