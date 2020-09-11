x <- 0:99
x <-x[x%%3==0]
x

y <- 0:99
y <- y[y%%4 == 0]
y

union(x, y)#합집합
intersect(x, y)#교집합
setdiff(x, y)#차집합

data("airquality")
airquality
?airquality

str(airquality)
class(airquality)
?airquality

subset(airquality, Wind == max(airquality$Wind))
mean(airquality$Ozone, na.rm = TRUE)


data("quakes")
?quakes
str(quakes)
subset(quakes, mag == max(quakes$mag))
