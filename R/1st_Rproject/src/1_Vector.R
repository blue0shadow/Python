x <- c(10.4, 5.6, 3.1, 6.4, 21.7)
c(10.4, 5.6, 3.1, 6.4, 21.7) ->x
x
lg <- c(TRUE, FALSE, FALSE)
lg
y <- c(x, 0, x)
y
assign("z", c(10.4, 5.6, 3.1, 6.4, 21.7))
z


s1 <- seq(length=51, from = -5, by = .2)
s1

s2 <- rep(1:5, times =5)
s2

s3 <- rep(1:5, each =5)
##연속적인 eaxh
s3

labs <- paste(c("x", "y"), 1:10, sep="_")
labs

fruit <- c(5, 10, 1, 20)
names(fruit) <- c("orange", "baana", "apple", "peach")
fruit

fruit["apple"]
fruit[c("orange", "apple")]

x <- c(11:15)
x
x[2]
x[x(1,3,5)]
x[-2]
x[2:4]
x[-c(2,4)]
x[x>12]
x[x>=12 & x <= 14]
x[2] <- 20; x
x[c(3,4)] <- 30;x
x[x <30 ] <- 10;x
x[-2] <- 100;x

x <- 0:9
z
mode(z)
d_chr <- as.character(z)
d_chr
mode(d_chr)
d <- as.integer(d_chr)
d
mode(d)

10 + 3
10 -3 
10*3
10/3
10^3
10**3
10%%3
10%/%3

10<3
10>3
10 == 3
10!=3
TRUE | TRUE
TRUE | FALSE
TRUE & TRUE
TRUE & FALSE
!TRUE
!FALSE
isTRUE(TRUE)
isTRUE(FALSE)

x<- c(1, 2,3)
y<- c(3, 4,5 )
z <- c(3, 1, 2)

x
y
z

union(x,y)
intersect(x,y)
setdiff(x,y)
setdiff(y,x)
setequal(x,y)
setequal(x,z)

w <- c(1, 2, 3, 4)
x <- c(5, 6, 7, 8)
y <- c(3, 4)
z <- c(5, 6, 7)
w;x;y;z

w + y
w + x
w + z

x <- 10:20
x
any(x>15)
all(x>15)
which(x>15)
subset(x, x>15)

x <- c(32, 1, NA, 46, 8)
y <- c(32, 1, NULL, 46, 8)
x;y
mean(x)
mean(x, na.rm =T)
mean(y)

c(1, 'a')
c(1, 1.1)
c(1, 1.1, 'a')

ch <- c('a', 'b', 'c')
num <- c(1,2,3)
ch + num
