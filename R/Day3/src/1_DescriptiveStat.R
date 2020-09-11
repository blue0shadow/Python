#단순임의추출
##비복원 추출
dt <- iris$Petal.Length
str(dt)
sample(dt, 10)

#복원추출
sample(dt, 10, replace = T)

sample(1:5, 5)
sample(1:5, 5, replace = T)

#가중치 부여
sample(1:5, 5, replace = T, prob = c(10, 20, 20, 5, 1))

#층화 임의추출
install.packages("sampling")
library(sampling)

##strata
x <- strata(data=iris, stratanames = c("Species"), size = c(3, 3, 3), method = "srswor")
x

#getdata
getdata(iris, x)

##층 마다 다른수의 표본 추출
strata(data=iris, stratanames = c("Species"), size = c(3, 2, 1), method = "srswr")

#다수의 층에서 표본추출
iris$Species2 <- rep(1:2, 75) #1,2를 75번 반복
strata(data=iris, stratanames = c("Species","Species2"), size = c(1, 2, 1, 2, 1, 2), method = "srswr")

#게통추출 : doBy::Sample_by
install.packages("doBy")
library(doBy)

x <- data.frame(x = 1:10)
x

sample_by(data = x, formula = ~1, frac = .2, systematic = T)
sample_by(data = iris, formula = ~Species, frac = .2, systematic = T)


#기술통계
##평균
mean(dt)

#표본분산
var(dt)

##자유도 확인
dt
m <- mean(dt)
m
sum((dt - m) ^ 2) / length(dt)
sum((dt - m) ^ 2) / (length(dt) - 1)


##표본 표준편차
sd(dt)

#요약
fivenum(dt)
summary(dt)

#최빈값
##분할표 작성 : 데이터의 빈도 수를 표형태로 출력
table(dt)
which.max(table(dt))
names(table(dt))[5]

#검정을 위한 분할표 작성 : table, xtabs
table(iris(Species))

xtabs(~Species, data = iris)

d <- data.frame(x = c("1", "2", "3", "4"),
                y = c("A", "B", "A", "B"),
                num = c(3, 5, 8, 7))
d

xtabs(num ~ x + y, data =d)

#합계산
xt <- xtabs(num ~ x + y, data =d)
margin.table(xt, 1)
margin.table(xt, 2)
margin.table(xt)

#비율계산 : prop.table
xt
prop.table(xt, 1)
prop.table(xt, 2)
prop.table(xt)

#독립성 검정
## 데이터 로드 : MASS::survey
library(MASS)
data(survey)
str(survey)

#성별 , 운동의 정도
ta <- xtabs( ~Sex + Exer , data = survey)
ta
chisq.test(xtabs( ~Sex + Exer , data = survey))
#자유도 :2 

xtabs(~W.Hnd + Clap , data = survey)
chisq.test(xtabs(~W.Hnd + Clap , data = survey))
fisher.test(xtabs(~W.Hnd + Clap , data = survey))
#기준값보다 작은 p-value : 귀무가설 기각 가능

# 맥니멈 검정
##사건의 전후에 따른 분포변화
Performance <-
  matrix(c(794, 86, 150, 570),
         nrow = 2,
         dimnames = list("1st Survey" = c("Approve", "Disapprove"),
                         "2nd Survey" = c("Approve", "Disapprove")))
Performance
mcnemar.test(Performance)

#t-test
mpg <- as.data.frame(ggplot2::mpg)
library(dplyr)

## compact, suv자동차의 도시연비 차이
mpg_diff <- mpg %>%
  select(class, cty) %>%
  filter(class %in% c("compact", "suv"))

table(mpg_diff$class)

t.test(data = mpg_diff, cty ~ class , var.equal = T)
# var_equal = 분산은 같다고 가정
##p-value 작다 -> 신뢰성 있음

#일반 휘발유와 고급 휘발유의 연비 차이
mpg_diff2 <- mpg %>%
  select(fl, cty) %>%
  filter(fl %in% c("r", "p"))

table(mpg_diff2$fl)
t.test(data = mpg_diff2, cty ~ fl , var.equal = T)
#p-calue = 0.2875
##귀무가설 기각 수준 = 0.5
### 별차이 없다

#상관분석
economics <- as.data.frame(ggplot2::economics)
str(economics)
cor.test(economics$unemploy, economics$pce)
# 양의 상관 관례 -> 비례 관계 이다.

#상관행렬
head(mtcars)
car_cor <- cor(mtcars)
round(car_cor,2)

#히트맵
install.packages("corrplot")
library(corrplot)
corrplot(car_cor)
corrplot(car_cor, method = "number")

corrplot(car_cor,
         method = "color",
         type = "lower",
         order = "hclust",
         addCoef.col= "black",
         tl.col = "gray",
         tl.srt = 45,
         diag = F)

