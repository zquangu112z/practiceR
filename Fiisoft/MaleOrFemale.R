# Load data
MaleOrFemaleTrain <- read.table(
  "MaleOrFemaleTrain.ml",
  quote = "\"",
  comment.char = "",
  stringsAsFactors = TRUE
)
MaleOrFemaleTrain$V4 <- factor(MaleOrFemaleTrain$V4)

MaleOrFemaleResult <- read.table(
  "MaleOrFemaleResult.ml",
  quote = "\"",
  comment.char = "",
  stringsAsFactors = TRUE
)
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
