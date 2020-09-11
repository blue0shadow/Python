install.packages("dplyr")
library(dplyr)

data <- read.csv("data/data.csv",na.strings=NA)
df <- as.data.frame(data)
head(df)

is.na(df)
table(is.na(data$수용인원수))

round(mean(df$수용인원수,na.rm=TRUE))

df$수용인원수 <- ifelse(is.na(df$수용인원수), round(mean(df$수용인원수,na.rm=TRUE)) ,df$수용인원수) 

table(is.na(df$수용인원수))
nrow(df)

#행정구역별 숙박이 가능한 휴양림의 수와 
#수용인원수의 합계를 구하여,
#가장 많은 휴양림을 보유한 시도 5곳을 출력하시오.

df %>%
  filter(숙박가능여부  == "Y") %>%
  group_by(시도명)%>%
  summarise(total = (nrow(df) + sum(수용인원수)))%>%
  arrange(desc(nrow(df)))%>%
  head(5)

#휴양림면적당 수용인원수를 계산하여 ‘밀집도’변수를 추가하고, 
#가장 밀집도가 낮은 3곳과 가장 밀집도가 높은 3곳의 이름, 시도명, 밀집도, 전화번호를 하나의 테이블로 출력하고, 
#이때 높은 지역은 ‘HD’로 낮은 지역은 ‘LD’의 표기를 추가하시오. (단, 수용인원수가 0으로 표기된 지역은 제외)

df1 <- df %>%
  mutate(밀집도 = (수용인원수 / 휴양림면적)) %>%
  mutate(marker = ifelse(밀집도 == 0 , NA , ifelse(밀집도 >= mean(밀집도) , "HD","LD"))) %>%
  arrange(desc(밀집도)) %>%
  select(휴양림명, 시도명, 밀집도, 휴양림전화번호, marker) %>%
  head(3)
df1

df2 <- df %>%
  mutate(밀집도 = (수용인원수 / 휴양림면적)) %>%
  mutate(marker = ifelse(밀집도 == 0 , NA , ifelse(밀집도 >= mean(밀집도) , "HD","LD"))) %>%
  arrange(desc(밀집도)) %>%
  select(휴양림명, 시도명, 밀집도, 휴양림전화번호, marker) %>%
  tail(3)
df2

rbind(df1, df2)
