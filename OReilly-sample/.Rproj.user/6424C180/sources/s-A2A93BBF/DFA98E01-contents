hand <- c("ace", "king", "queen", "jack", "ten")
length(hand)

hand1 <- c("ace", "king", "queen", "jack", "ten", "spades", "spades",
           "spades", "spades", "spades")
matrix(hand1, nrow = 5)
# give the same result
# matrix(hand1, ncol = 2)
# dim(hand1) <- c(5, 2)

deck <- data.frame(
  face = c("king", "queen", "jack", "ten", "nine", "eight", "seven", "six",
           "five", "four", "three", "two", "ace", "king", "queen", "jack", "ten",
           "nine", "eight", "seven", "six", "five", "four", "three", "two", "ace",
           "king", "queen", "jack", "ten", "nine", "eight", "seven", "six", "five",
           "four", "three", "two", "ace", "king", "queen", "jack", "ten", "nine",
           "eight", "seven", "six", "five", "four", "three", "two", "ace"),
  suit = c("spades", "spades", "spades", "spades", "spades", "spades",
           "spades", "spades", "spades", "spades", "spades", "spades", "spades",
           "clubs", "clubs", "clubs", "clubs", "clubs", "clubs", "clubs", "clubs",
           "clubs", "clubs", "clubs", "clubs", "clubs", "diamonds", "diamonds",
           "diamonds", "diamonds", "diamonds", "diamonds", "diamonds", "diamonds",
           "diamonds", "diamonds", "diamonds", "diamonds", "diamonds", "hearts",
           "hearts", "hearts", "hearts", "hearts", "hearts", "hearts", "hearts",
           "hearts", "hearts", "hearts", "hearts", "hearts"),
  value = c(13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 13, 12, 11, 10, 9, 8,
            7, 6, 5, 4, 3, 2, 1, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 13, 12, 11,
            10, 9, 8, 7, 6, 5, 4, 3, 2, 1)
)

write.csv(deck, file="mydeck.csv", row.names = FALSE)
deck <- read.csv("./mydeck.csv", header=TRUE)

deal <- function(cards) {
  cards[1,]
}
deal(deck)

# shuffle the deck
deal_suffle <- function(cards){
  cards2 <- cards[sample(1:52, size = 52), ]
  deal(cards2)
}
print(deal_suffle(deck))

deck$suit

# add a new column
deck$new <- 1:52
# delete the added column
deck$new <- NULL

# compare column 'face' with value 'ace'
deck$face == "ace"
# count the number of 'ace' in deck
sum(deck$face == 'ace')

# Assign a value of 1 to every card in deck4 that has a suit of hearts.
deck$value[deck$suit == "hearts"] <- 1
