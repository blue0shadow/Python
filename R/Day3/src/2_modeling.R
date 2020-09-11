x <- c(3.0, 6.0, 9.0, 12.0)
y <- c(3.0, 4.0, 5.5, 6.5)

x;y

m <- lm(y ~ x)
m

#매개변수 확인
coef(m)

#훈련집합의 예측값
fitted(m)

#오차(잔차)
residuals(m)

#평균제곱오차 , 편차제곱합 
deviance(m)
deviance(m) / length(x)

#모델 자세히 살펴보기
residuals(m)
summary(m)
#p-value가 0.5이하 귀무가설 기각, x,y는 관련이 있다.


#모델을 이용한 예측 : predict
##새로운 데이터

newx <- data.frame(x =c(1.2, 2.0, 20.65))
newx

predict(m, newdata = newx)
