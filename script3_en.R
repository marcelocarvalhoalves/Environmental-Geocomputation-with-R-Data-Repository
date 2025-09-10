# Practice with geographic databases using geocomputing and R
# Create numeric and integer values
a <- 10 # Register value in object
a = 10 # Register value in object
show(a) # See content
a # See content
print(a) # See content
class(a) # See class

a <- as.integer(10) # Convert numeric to integer
a
class(a)

# Create character attribute values
x <- 'Lavras'
y <- 'MG'
class(x)
class(y)
countries <- c('Brasil', 'Brasil', 'Argentina', 'Paraguai', 'Bolívia')
countries
class(countries)
length(countries) # See how many names
nchar(countries) # See number of characters in each name

# Logical or Boolean values
z <- FALSE
z
class(z)
z <- c(TRUE, TRUE, FALSE)
z
x <- 10
class(x)
x > 3 # Is x greater than 3?
x == 3 # Is x equal to 3?
x == 10 # Is x equal to 10?
x <= 5 # Is x less than or equal to 5?

# Factors
countries <- c('Brasil', 'Brasil', 'Argentina', 'Paraguai', 'Bolívia')
class(countries)
countries
f1 <- as.factor(countries)
class(f1)
f1
f2 <- c(5:10, 5:10, 5:10)
f2
f3 <- as.factor(f2)
f3
# Temporal variables
d1 <- as.Date('2019-4-11')
d2 <- as.Date('2019-3-11')
class(d1)
class(d2)
d1 - d2
# Advanced classes of temporal representation
d3 <- as.POSIXlt(d1)
d3
class(d3)
d4 <- as.POSIXct(d1)
d4

# Matrix structure
m1 <- matrix(ncol = 3, nrow = 4)
m1
m12 <- matrix(1:12, ncol = 3, nrow = 4)
m12
m12r <- matrix(1:12, ncol = 3, nrow = 4, byrow = TRUE)
m12r

# Array structure
b <- array(1:12)
b
a <- matrix(1:12)
a

# List structure
l1 <- list(1:10)
l1
e <- list(c(2,10), 'abc')
e
names(e) <- c('first', 'last')
e

# data frame
ID <- as.integer(1:4)
name <- c('Lavras', 'B?zios', 'Ilh?us', 'Lumin?rias')
state <- as.factor(c('MG','RJ','BA','MG'))
score <- c(10.2, 9, 13.5, 18)
d <- data.frame(ID, name, state, score, stringsAsFactors = FALSE)
d
class(d)

# Indexing
## Vector indexing
v <- 1:10
v
class(v)
v[1] # Get the first value from the database
v[10] # Get the last value from the database

## Matrix indexing
m <- matrix(1:9, nrow = 3, ncol = 3, byrow = TRUE)
colnames(m) <- c('a', 'b', 'c')
m
## Find a value in row 2, column 2
m[2,2]
## Another value
m[1,3] # Line 1, column 3

## List indexing
e <- list(list(1:3), c('a', 'b', 'c', 'd'), m)
e[2] # Index 2nd item in the list
e[[2]] # Index 2nd item in the list

## Data frame indexing
d <- data.frame(m)
d
class(d)
d[,2] # Access column 2
d[2] #  Access column 2
d[2,] #  Access row 2

# Evaluate raster data arrays
## Load packages
library(stars)
library(dplyr)

## Get sample image from stars package
tif <- system.file("tif/L7_ETMs.tif",
                   package = "stars")
class(tif)

## Read as stars object and map bands with a single legend
read_stars(tif) %>%
  slice(index = 1:6, along = "band") %>%
  plot(axes=T)
