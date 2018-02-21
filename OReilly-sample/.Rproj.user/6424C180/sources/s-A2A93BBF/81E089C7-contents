die <- c(1, 6)
typeof(die)  # double aka “numerics"

die <- 1:6
typeof(die)  # int

int <- c(-1L, 2L, 4L)

text <- c("Hello", "World")  # chr

comp <- c(1 + 1i, 1 + 2i, 1 + 3i)  # cplx

attributes(die)
# NULL

# set names
names(die) <- c('one', "tw", "th", "fo", "fi", "si")
attributes(die)

# dimension
dim(die) <- c(3, 2)
die

# matrices, byrow means 'fill by row'
m <- matrix(die, nrow = 2, byrow = TRUE)
m

# Dates and Times
now <- Sys.time()
now

list1 <- list(100:130, "R", list(TRUE, FALSE))
list1
list1[1]
