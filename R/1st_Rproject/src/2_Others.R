data <- c(1:8)
data
m1 <- matrix(data=data, nrow =2, ncol = 4)
m1
colnames(m1) <- paste(c("C"), 1:4, sep="")
m1
rownames(m1) <- c("R1", "R2")
m1

dimnames(m1) <- list(c("row1", "row2"),
                     c("col1", "col2", "col3", "col4"))
m1

m2 <- matrix(11:18, 2, 4, byrow = T,
             dimnames = list(c("row1", "row2"),
                             c("col1", "col2", "col3", "col4"))
             )
m2

m1
m1[1,1]
m1[2,]
m1[,3]
m1[2,c(1:2)]
m1[2,c(2,4)]

m2
m2['row1', 'col2']
m2['row1',]
m2[,'col2']
m2['row2', c('col1', 'col3')]

x <- matrix(1:4, nrow=2)
y <- matrix(5:8, nrow = 2)
x
y

x +y
x-y
x*y
x%*%y
t(x)
x
aperm(x)
solve(x)
det(x)


x;y

rbind(x,y)
cbind(x,y)


d1 <- array(1:36, dim = c(6, 3, 2))
d1

d1[2, 2, 2]
d1[,2, 2]
d1[2,,2]
d1[,,2]
dim(d1)

x <- 1:12
dim(x) <- c(3,4)
x

apply(x, 1, sum)
apply(x, 2, sum)

blood.type <- c("A", "B", "AB", "B", "O")
blood.type
class(blood.type)
mode(blood.type)

blood.type <- factor(blood.type)
blood.type
class(blood.type)
mode(blood.type)

grade <- ordered(c("advanced"), levels = c("beginner", "intermidiate", "advanced", "expert"))
grade
class(grade)

size <- factor(c("large", "large", "small"),
               levels = c("small", "medium","large", "x-large"),
               ordered= T)
size
class(size)
nlevels(grade)
levels(grade)
is.factor(grade)
is.ordered(grade)
is.ordered(blood.type)

no <- c(1:5)
name <- c("apple", "banana","carrot", "peach", "potato")
kind <- factor(c("fr", "fr", "ve", "fr", "ve"))
price <- c(1000, 2000, 500, 2500, 800)
qty <- c(10, 5, 7, 3, 12)
store <- data.frame(No=no, Name=name, Kind=kind, Price=price, Qty=qty)
store
class(store)
str(store)

students <- data.frame(name = c("Kate", "Andy", "Alice", "Sam"),
                       gender = c("F", "M", "F", "M"),
                       grade = c(2, 3, 1, 4))
students

df_ch = read.csv("C:/Users/Soochel Nam/Desktop/programmin/R/character-deaths.csv")
df_ch

head(df_ch)
class(df_ch)
str(df_ch)

cf_car = read.table("data/cars.txt", header = T)
cf_car
head(cf_car)
str(cf_car)

df_car = read.csv("data/cars.csv", header = T)
df_car
head(df_car)
str(df_car)

fr1 <- read.table("data/fruits.txt", skip=3)
fr1

fr2 <- read.table("data/fruits.txt", nrows=3)
fr2

data()
cars <- mtcars
head(cars)
str(cars)

cars[1,2]
cars[c(1:5),1, frop = F]

cars$mpg
#반환값 벡터
cars[["mpg"]]
cars["mpg"]

mean(cars$mpg)
#반환값 벡터
mean(cars[["mpg"]])
mean(cars["mpg"])


cars[1,1]
cars[1,1] <- 20
cars[1,1]

class(cars$cyl)
cars$cyl <- as.factor(cars$cyl)
cars$am <- as.factor(cars$am)
str(cars)

cars$plus <- cars$mpg + 100
head(cars)

cars$plus <- NULL
head(cars)


cars[, c("cyl", "gear", "hp")]
cars[, -c(2,4)]
#cars[, -c("cyl", "hp)]
cars[c("cyl", "gear", "hp")]
cars[, -c(2,4)]

cars[1:5,]
cars[c(10:20),]
cars[cars$cyl == 6, ]
cars[cars$cyl == 4 | cars$cyl == 6 , c("mpg", "hp", "cyl")]
cars[cars$cyl %in% c(4,6) , c("mpg", "hp", "cyl")]
