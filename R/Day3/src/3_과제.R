data <- read.csv("data/titanic_data.csv")
head(data)
str(data)
df <- as.data.frame(data)

#전체 데이터로부터 80%의 훈련 샘플을 단순 임의 복원 추출하세요.
#sample(df, nrow(df) * 0.8, replace = T)

idx <- sample(2, nrow(df), replace = T , prob = c(0.8, 0.2))
trdata <- data[idx == 1, ]
tedata <- data[idx == 2, ]

nrow(trdata)
nrow(tedata)

#Pclass (선실 등급)과 Survived(생존 여부) 변수로 분할표와 비율 분할표를 작성하여 결과를 해석하세요.
##분할표
div <- xtabs(~Pclass + Survived, data = df)
div

##비율분할표
prop.table(div,1)
prop.table(div,2)
prop.table(div)



#위 분할표를 카이 제곱 검정하여 두 변수간 독립성 여부를 확인하세요.
chisq.test(div)
## p-value가 0.05에 비해 매우 적다.
### 귀무가설 기각/ 선실등급과 생존여부 간에 관계가 있다. 




#Fare(운임요금)이  Survived(생존 여부)에 영향을 주는지를 알아보기 위한
#선형 모델을 구축하고, 결과를 해석하세요.


m <- lm(df$Fare ~ df$Survived)
m

summary(m)
#p-value가 0.5이하 귀무가설 기각, Fare,Survivied는 관련이 있다.
