# Load data
load.dat <- function(dat_dir){
  dat <- read.table(
    dat_dir,
    quote = "\"",
    comment.char = "",
    stringsAsFactors = TRUE
  )
  dat
}

MaleOrFemaleTrain <- load.dat("Fiisoft/MaleOrFemale/MaleOrFemaleTrain.ml")
MaleOrFemaleTrain$V4 <- factor(MaleOrFemaleTrain$V4)

MaleOrFemaleResult <- load.dat("Fiisoft/MaleOrFemale/MaleOrFemaleResult.ml")
MaleOrFemaleResult$V4 <- factor(MaleOrFemaleResult$V4)

# Train
attach(MaleOrFemaleTrain)
fit <- glm(V4 ~ V1 + V2 + V3, data = MaleOrFemaleTrain, family = binomial)

# Test
probs <- predict(fit, newdata = MaleOrFemaleResult, type = "response")
print(probs)
pred <- ifelse(probs < 0.5, 1, 2)

# Confusion matrix
table(pred, MaleOrFemaleResult$V4)
