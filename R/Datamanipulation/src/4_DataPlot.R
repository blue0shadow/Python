df <- as.data.frame(ggplot2::mpg)
head(df)
str(df)

df$drv <- as.factor(df$drv)
df$cyl <- as.factor(df$cyl)

#1변수 플롯
plot(df$hwy)
plot(df$drv)

attach(df)

plot(cty, hwy)
plot(hwy~cty) #same
plot(drv, hwy)
plot(drv, cyl)

#data frame all
plot(df)

#bar plot
t_cyl <- table(cyl)
t_cyl

barplot(t_cyl)
t_class <- table(class)
barplot(t_class)

plot(cyl)
plot(as.factor(class))
     
#average plot
mean_bar <- tapply(hwy, drv, mean)
mean_bar
barplot(mean_bar, ylim = c(0, 40))

boxplot(cty)
boxplot(cty~drv)

hist(cty)
hist(cty, breaks = seq(0, 40, 5))

plot(cty~hwy, ann= F)#label del
title(main = "도시 연비와 도로연비와의 관계", xlab = "도로연비", ylab = "도시연비")
grid()

h_mean <- mean(hwy)
h_mean
abline(v = h_mean , col= "red")

#line chart
runif(30)
ts1 <- sort(round(runif(30) * 100))
ts1

ts2 <- sort(round(runif(30) * 100))
ts2

plot(ts1, type = "l")
lines(ts2, lty = "dashed", col="red")

detach(df)
