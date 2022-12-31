
#--------------------------------#
#        5-1주차 모범 답안       #
#--------------------------------#

# 1. R에서 제공하는 cars 데이터셋을 이용해서 speed 와 dist 에 대한 산점도를 그리시오.
#    (x축이 speed). speed 와 dist   (제동거리)에 대한 상관 관계를 설명해 보시오. 
data("cars")
speed <- cars$speed
dist <- cars$dist
plot(speed, dist,
     xlab = "speed",
     ylab = "dist", 
     col="red",
     pch=19)

cor(speed, dist)  
## speed변수와 dist변수의 상관계수는 0.8068949로, speed가 증가하면 dist(배기량)이 증가하는 비교적 높은 상관관계를 보인다고 할 수 있음



# 2. R에서 제공하는 pressure 데이터셋을 이용해서 temperature 와 pressure 에 대한 산점도를 그리시오.
#    (x축이 temperature). 두 변수간 상관 관계를 설명해 보시오.
data("pressure")
temp <- pressure$temperature
press <- pressure$pressure
plot(temp, press)
cor(temp, press)  
## temperature와 pressure의 상관계수는 0.7577923으로, temperature가 증가하면 pressure도 증가하는 비교적 높은 양의 상관관계를 보인다고 할 수 있음 



# 3. R에서 제공하는 state.x77 데이터셋에서 Population, Income, Illiteracy, Area 변수간 산점도를 그려
#    상관관계를 관찰하시오. (pairs() 함수 이용) 
target <- state.x77[, c("Population", "Income", "Illiteracy", "Area")]
pairs(target,
      main="state.x77")
cor(target)
## 4개의 변수를 2개씩 짝지어 상관관계를 봤을때, 뚜렷한 상관성을 보이는 짝이 있다고 할 수 없는 것으로 판단 됨 

# 4. iris 데이터셋에서 Species 정보에 따른 Sepal.Length, Sepal.Width (꽃받침의 길이, 폭)의 분포를 알아 보시오.
head(iris)
iris.sp <- iris[, 1:2]
point <- as.numeric(iris$Species)
color <- c("red", "blue", "green")
plot(iris.sp,
     main="iris plot",
     pch=c(point),
     col=color[point])
## setosa종의 꽃받침의 길이는 약 4.3cm ~ 약 5.8cm 사이에, 꽃받침의 폭은 약 2.3cm ~ 약 4.4cm 사이에 분포하고 있음
## versicolor종의 꽃받침의 길이는 최소 약 4.9cm에서 최대 약 7cm까지이며, 꽃받침의 폭은 최소 약 2cm에서 최대 약 3.4cm까지 분포하는 것을 알 수 있음  
## virginica종의 꽃받침의 길이는 짧게는 4.9cm에서 길게는 7.9cm, 넓이는 좁게는 약 2.2cm에서 넓게는 약 3.8cm인 것으로 나타남

## setosa 종은 비교적 다른 종들에 비해 구분이 잘 되는 반면에, 
## visicorlor와 virginica종은 setosa종과는 구분이 잘 되는 편이나 두 종은 서로 겹치는 부분이 존재하는 것으로 확인됨 







#--------------------------------#
#        5-2주차 모범 답안       #
#--------------------------------#

# 1. 다음은 10명의 수입과 교육받은 기간을 조사한 표이다. 
#    수입과 교육기간 사이에 어느정도 상관관계가 있는지 조사하시오. (산점도, 상관계수 구하기)
Income <- c(125000, 100000, 40000, 35000, 41000, 29000, 35000, 24000, 50000, 60000)
Years_of_Education <- c(19, 20, 16, 16, 18, 12, 14, 12, 16, 17)
plot(Income, Years_of_Education)
cor(Income, Years_of_Education) 
## 수입과 교육간의 상관계수는 0.7887259로, 수입이 높을 수록 교육기간이 길다고 할 수 있음 

# 2. 다음은 학생 10명의 성적(GPA)과 TV 시청시간을 조사한 표이다. 
#    성적과 TV시청시간 사이의 상관관계를 조사하시오. (산점도, 상관계수 구하기)
GPA <- c(3.1, 2.4, 2.0, 3.8, 2.2, 3.4, 2.9, 3.2, 2.7, 2.5)
TV_in_hours_per_week <- c(14, 10, 20, 7, 25, 9, 15, 13, 4, 21)
plot(GPA, TV_in_hours_per_week)
cor(GPA, TV_in_hours_per_week) 
## 성적과 tv시청 시간 사이의 상관계수는 -0.6257459로, 성적이 높은 학생일수록 tv 시청시간이 그렇지 않은 학생보다 적다고 할 수 있음 








#--------------------------------#
#        5-3주차 모범 답안       #
#--------------------------------#


# 1. 다음은 2015년부터 2026년도까지의 예상 인구수 추계자료이다. 선그래프를 작성하시오. 
Year <- c(2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022, 2023, 2024, 2025, 2026)
Pop <- c(51014, 51245, 51446, 51635, 51811, 51973, 32123, 52261, 52338, 52504, 52609, 52704)
plot(Year,
     Pop,
     main = "population",
     type="l",
     lty=1,
     lwd=1,
     xlab="Year",
     ylab="Population")

# 2. 다음은 2014년 4분기부터 2017년 3분기까지 남,녀의 경제활동참가율 통계이다. 선그래프를 작성하시오.
#    (남,녀를 각각 다른 선으로 표시) (2014년 4분기는 20144, 2015년1분기는 20151 과 같이 입력한다.)
qt <- c("20144", "20151", "20152", "20153", "20154",
           "20161", "20162", "20163", "20164", "20171", "20172", "20173")
male <- c(73.9, 73.1, 74.4, 74.2, 73.5, 73.0, 74.2, 74.5, 73.8, 73.1, 74.5, 74.2)
female <- c(51.4, 50.5, 52.4, 52.4, 51.9, 50.9, 52.6, 52.7, 52.2, 51.5, 53.2, 53.1)
plot(qt,
     male,
     main="M/W",
     type="l",
     lty=1,
     col="blue",
     xlab="분기",
     ylab="경제활동 참가율",
     ylim = c(min(female), max(male)))
lines(qt,
      female,
      type="l",
      col="red")

#____________________분기 구간 조정하고 싶을 경우
plot(qt,
     male,
     main="M/W",
     type="l",
     lty=1,
     col="blue",
     xlab="분기",
     ylab="경제활동 참가율",
     ylim = c(min(female), max(male)),
     xaxt = "n")    # x축 구간 보이지 않기 
lines(qt,
      female,
      type="l",
      col="red")
axis(side = 1, at = qt) # x축 구간 사용자가 설정 



#--------------------------------#
#        5-4주차 모범 답안       #
#--------------------------------#


# 1.  R 에서 제공하는 state.x77 (미국 50개주에 대한 통계) 데이터셋을 분석해 보시오. 
#     state.x77 에 지역정보(state.region) 추가하여 분석
#     st <- data.frame(state.x77, state.region)
#     head(st)

st <- data.frame(state.x77, state.region)
head(st)


### Step.1 일반정보 확인 ###
str(st) # str(): 사이즈, 변수의 개수 등 일반 정보 확인

# 'data.frame':	50 obs. of  9 variables:
## 'data.frame' : 자료구조
## 50 obs. : 행의 수
## 9 variables : 변수의 개수(2차원 행렬 상에서 column)

# $ Population  : num  3615 365 2212 2110 21198 ...
# $ Income      : num  3624 6315 4530 3378 5114 ...
# $ Illiteracy  : num  2.1 1.5 1.8 1.9 1.1 0.7 1.1 0.9 1.3 2 ...
# $ Life.Exp    : num  69 69.3 70.5 70.7 71.7 ...
# $ Murder      : num  15.1 11.3 7.8 10.1 10.3 6.8 3.1 6.2 10.7 13.9 ...
# $ HS.Grad     : num  41.3 66.7 58.1 39.9 62.6 63.9 56 54.6 52.6 40.6 ...
# $ Frost       : num  20 152 15 65 20 166 139 103 11 60 ...
# $ Area        : num  50708 566432 113417 51945 156361 ...
# $ state.region: Factor w/ 4 levels "Northeast","South",..: 2 4 4 2 4 4 1 2 2 2 ...
## $ Population ~ state.region : 변수(9가지)
## num : 변수 타입(num, Factor)
## 4 levels : state.region Factor의 위치 방향(?) 지역? (4가지)

class(st)                 # 자료구조 확인
head(st)                  # 자료의 앞 부분 몇 개만 확인할 수 있는 명령
dim(st)                   # dimension: 행과 열의 수 확인
table(st$state.region)    # 지역별 관측치 도수 분포

# 해석
## 자료구조는 data frame 사용
## 총 9개의 열(변수) 중 앞의 8개는 수치 데이터, 9번째는 각 행에 대한 그룹 정보 포함
## 총 50개의 행과 9개의 열로 구성
## 각 행(states)은 state.region의 4개의 그룹 중 하나에 속함 (Northeast, South, North Central, West)
## 각 그룹에 속한 행의 개수는 불균등(Northeast:9개, South:16개, North Central:12개, West:13개)


### Step.2 데이터 분포 확인 ###
summary(st[,1])          # 첫 번째 column (Population)
summary(st[,2])          # 두 번째 column (Income)
summary(st[,"Area"])     # column 이름으로 가져오기
summary(st$state.region) # data frame: $변수명 형식으로 가져오기
## summary(): max값, min값, 중앙값, 평균값 등 종합적 확인
# Min. Max. : 데이터의 산포를 알 수 있음
# mean/median : 데이터의 정규분포 정도 확인 / 두 값 유사(동일): 정규분포 / 두 값 차 큼: 치우친 분포

sd(st[,1])          # 첫 번째 column
sd(st[,2])          # 두 번째 column
sd(st[,"Area"])     # column 이름으로 가져오기
sd(st$Murder)       # data frame: $변수명 형식으로 가져오기
## sd(): 표준편차: 데이터의 퍼진 정도를 한 눈에 확인
# sd: 크면: 평균적으로 넓게 퍼짐 / 작으면: 평균 주변에 모여 있음


### Step.3 그룹별 분포 확인 ###
par(mfrow = c(4,2))
boxplot(Population~state.region, data = st, 
        main = "Population")
boxplot(Income~state.region, data = st, 
        main = "Income")
boxplot(Illiteracy~state.region, data = st, 
        main = "Illiteracy")
boxplot(Life.Exp~state.region, data = st, 
        main = "Life.Exp")
boxplot(Murder~state.region, data = st, 
        main = "Murder")
boxplot(HS.Grad~state.region, data = st, 
        main = "HS.Grad")
boxplot(Frost~state.region, data = st, 
        main = "Frost")
boxplot(Area~state.region, data = st, 
        main = "Area")


### Step.4 산점도 확인 ###
point <- as.numeric(st$state.region)   # 포인트 모양
levels(st$state.region)
color <- c("red", "green", "blue", "black")   # 포인트 컬러
pairs(st[,-9],
      pch=c(point),
      col=color[st[,9]])
## 해석 e.g) 주어진 데이터에 따르면, South 지역의 위치한 주들의 인구는 비교적 많지 않으며, 다수의 주들의 수입이 낮고, 문맹률이 높으며 평균 기대 수명 역시 짧음
## 또한, 타 지역에 위치한 주들에 비해 살인율이 높은 주들이 많은것으로 나타남
## 주어진 데이터에 따르면, South 지역에 위치한 주들에는 Alabama, Arkansas, Delaware, Florida, Georgia, Kentucky, Louisiana, Maryland, Mississippi, North Carolina, 
## Oklahoma, South Carolina, Tennessee, Texas, Virginia, West Virginia가 있다. 

