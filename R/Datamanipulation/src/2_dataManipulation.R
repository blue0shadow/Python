install.packages("dplyr")
library(dplyr)

starwars
df <- as.data.frame(starwars)
head(df)

df %>% head(3)
df %>% tail(3)

#filter
df %>%
  filter(species == "Droid")

df %>%
  filter(skin_color == "light", eye_color == "brown")

#slice
df %>%
  slice(5:10)

#slice_sample :임의행 추출
df %>%
  slice_sample(n = 5)
df %>%
  slice_sample(prop = 0.1)

##dim(df)

df %>%
  filter(is.na(height)) %>%
  slice_max(height, n=3)

#select :열추출
df %>%
  select(hair_color, skin_color, eye_color)

df %>%
  select(hair_color:eye_color)

df %>%
  select(!(hair_color:eye_color))

df %>%
  select(name, ends_with("color"))

df %>%
  select(home_world = homeworld)

df %>%
  rename(home_world = homeworld)

#mutate :변수추가
df %>%
  mutate(height_m = height / 100)

df %>%
  mutate(height_m = height / 100) %>%
  select(height_m, height, everything())

df %>%
  mutate(
    height_m = height / 100,
    BMI = mass / (height_m ^ 2)
  ) %>%
  select(name, height_m, mass, BMI)

df %>%
  transmute(
    height_m = height / 100,
    BMI = mass / (height_m ^ 2)
  )

df %>%
  arrange(mass)

df %>%
  arrange(desc(mass))

df %>%
  summarise(height = mean(height, na.rm = T))

#그룹
df %>%
  group_by(species) %>%
  summarise(
    n = n(),
    height = mean(height, na.rm = T)
  ) %>%
  filter(n >1)

#종과 성별 별로 키와 몸무게
df %>%
  group_by(species, sex) %>%
  select(height, mass) %>%
  summarise(
    height = mean(height, na.rm = T),
    mass = mean(mass, na.rm = T)
  )

#테이블 병합
d1 <- data.frame(kids = c("Jack", "Jane", "John", "Lily"),
                 states = c("CA", "NY", "NV", "TX"))

d2 <- data.frame(kids = c("Jane", "Jack", "Kebin"),
                 age=c(10,12,8))

d3 <- data.frame( age=c(10,12,8),
                  name = c("Jane", "Jack", "Kebin"))

d1;d2;d3
 
inner_join(d1, d2, by = "kids")
left_join(d1, d2)
right_join(d1, d2)

inner_join(d1, d3, by = c("kids" = "name"))

#행 합치기
t1 <- data.frame(id = c(1:5),
                 test = seq(10, 50 , by=10))
t1

t2 <- data.frame(id = c(6:8),
                 test = seq(60, 80 , by=10))
t2

bind_rows(t1, t2)
