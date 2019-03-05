# bases everything from your R project file
source(here::here("R/package-loading.R"))

1

# note to yourself

# object assignment (to get <- type Alt minus)
weight_kilos <- 100
weight_kilos

# vector
# a string of things, c puts things together in a vector
c("a", "b")
c(1,2)
1:10

# data frame
# series of vectors of the same length in columns, i.e. a dataset
head(iris)

# column names
colname(iris)
# learn about structure
str(weight_kilos)
str(iris)
# basic summary of data
summary(iris)






#split up your do file. Code - insert section
# data wrangling ----------------------------------------------------------
# set what a function does - put it in quotes
"+"

# create a function
summing <- function(a, b) {
  add_numbers <- a+b
  return(add_numbers)
}
summing(2, 2)

usethis::use_r("package-loading")

write_csv(iris, here::here("data/iris.csv"))

iris_data <- read_csv(here::here("data/iris.csv"))
head(iris_data)

# exercise ----------------------------------------------------------------

# Object names
# DayOne
# dayone
day_one

# T <- FALSE
var_T <- FALSE

# c <- 9
var_c <- 9

# mean <- function(x) sum(x)
var_mean <- function(x) sum(x)

# Spacing
# x[,1]
# x[ ,1]
# x[ , 1]
x[, 1]

# mean (x, na.rm = TRUE)
# mean( x, na.rm = TRUE )
mean(x, na.rm = TRUE)


# function (x) {}
# function(x){}
function(x) {}


# height<-feet*12+inches
height <- (feet * 12) + inches

#mean(x, na.rm=10)
mean(x, na.rm = 10)

# sqrt(x ^ 2 + y ^ 2)
sqrt(x^2 + y^2)

#df $ z
df$z

# x <- 1 : 10
x <- 1:10

# Indenting - requires an indent or curly brackets or does not reco it is the same
#if (y < 0 && debug)
  message("Y is negative")
if (y < 0 && debug) {
  message("y is negative")
}





