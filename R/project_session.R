weight_kilo<-10
weight_kilo
head(iris)
colnames(iris)
str(iris)
summary(iris)

# basic commands ----------------------------------------------------------

# Object names
day_1
day_one
T <- FALSE
c <- 9
mean <- function(x) sum(x)

# Spacing
x[, 1]
x[, 1]
x[, 1]
mean(x, na.rm = TRUE)
mean(x, na.rm = TRUE)
function(x) {}
function(x) {
}
height <- feet * 12 + inches
mean(x, na.rm = 10)
sqrt(x ^ 2 + y ^ 2)
df $ z
x <- 1 : 10

# Indenting
if (y < 0 && debug)
  message("Y is negative")
sd
add_two <- function(x, y) {added <- x + y
return(added)
}
add_two(1, 2)

usethis:: use_r("package_loading")
source(here::here("R/package_loading.R"))


# save data ---------------------------------------------------------------

write_csv(iris, here::here("data/iris.csv"))
imported_iris <- read_csv(here::here("data/iris.csv"))
glimpse(imported_iris)

