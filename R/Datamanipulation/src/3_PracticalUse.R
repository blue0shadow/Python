# 실습 참고 교재 : 'Do it! 쉽게 배우는 R 데이터 분석', 김영우 저, 이지스퍼블리싱
# ggplot2::mpg data를 이용하여 다음 문제를 수행하세요.
install.packages("ggplot2")
library(ggplot2)
library(dplyr)
str(mpg)

data <- as.data.frame(mpg)
head(data)

## 실습 1. audi의 자동차 모델 중 고속도로 연비(hwy)가 가장 높은 5개의 자동차 데이터 출력
data %>%
  filter(manufacturer == "audi") %>%
  arrange(desc(hwy)) %>%
  head(5)

## 실습 2. 고속도로 연비(hwy)와 도시 연비(cty)를 통합한 평균 연비 변수를 추가하고 평균 연비가 가장 높은 자동차 3종 출력 
data %>%
  mutate(total = (hwy + cty)/2) %>%
  arrange(desc(hwy)) %>%
  head(3)


## 실습 3. 제조사와 구동 방식으로 그룹을 만들어 그룹별 도시 연비의 평균 구하기

data %>%
  group_by(manufacturer, drv) %>%
  summarise(mean_cty = mean(cty))

## 실습 4. 제조사별 'suv' 자동차의 평균 연비가 가장 높은 자동차 5개 출력

data %>%
  filter(class == "suv") %>%
  group_by(manufacturer) %>%
  mutate(total = (hwy + cty)/2) %>%
  summarise(mean_total = mean(total)) %>%
  arrange(desc(mean_total)) %>%
  head(5)


## 실습 5. 자동차 class 별 도시 연비의 평균 알아보고 평균이 높은 순으로 정렬해서 출력

data %>%
  group_by(class) %>%
  summarise(mean_cty = mean(cty)) %>%
  arrange(desc(mean_cty)) %>%
  head(5)

## 실습 6. 어떤 회사에서 'compact'(경차)를 가장 많이 생산할까?

data %>%
  filter(class == "compact") %>%
  group_by(manufacturer) %>%
  summarise(count = n()) %>%
  arrange(desc(count))


## 실습 7. 자동차 연료별 가격 정보를 참고하여, 자동차 모델별 연료 타입에 따른 연료 가격 테이블 만들기
### c : CNG : 2.35 / d : diesel : 2.38 / e : ethanol E85 : 2.11 / p : premium : 2.76 / r : regular : 2.22
head(data)
fuel <- data.frame ( fl = c("c", "d", "e", "p", "r"),
                     price = c(2.35, 2.38, 2.11, 2.76, 2.22))
fuel

data %>%
  left_join(fuel, by = 'fl') %>%
  select(model, fl, price) %>%
  head(10)

########################################################################################################
# ggplot2::midwest 데이터를 사용하여 문제를 해결하세요. 미국 중서부 지역의 인구통계 데이터
data <- as.data.frame(midwest)
str(data)

## 실습 8. '전체 인구 대비 미성년 인구 비율' 변수를 추가하고, 미성년 인구 비율이 가장 높은 상위 5개 지역을 출력

data <- data %>%
  mutate(ratio_child = (poptotal - popadults) / poptotal * 100)

data %>%
  arrange(desc(ratio_child)) %>%
  select(county, ratio_child) %>%
  head(5)

## 실습 9. 아래 분류표를 참고하여 미성년 비율 등급 변수를 추가하고, 각 등급별 몇 개의 지역이 있는지 확인
### Large : 40% 이상 / Middle : 30~40% / Small : 30% 미만

data <- data %>%
  mutate( grade = ifelse(ratio_child >= 40 , "Large", 
                         ifelse(ratio_child >= 30, "MIddle", "Small")))

#빈도 표
table(data$grade)


## 실습 10. '전체 인구 대비 아시아인 인구 비율' 변수를 추가하고, 하위 10개 지역의 주, 지역명, 비율을 출력
data %>%
  mutate(ratio_asian = (popasian / poptotal) * 100) %>%
  arrange(ratio_asian) %>%
  select(state, county, ratio_asian) %>%
  head(10)

