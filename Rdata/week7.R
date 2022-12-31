
#____________________________#
#        7-1 모범답안        #
#____________________________#

#1. “국회의원_선거구_유권자수.csv” 파일의 내용을 가지고 다음과 같은 treemap 을 작성하시오.

# ※  타일 하나는 각 선거구를 의미 
# 굵은 검은띠 블록은 선거구가 속한 시도를 의미
# 타일의 면적, 색깔은 선거인수를 의미
library(treemap)

setwd("C:/Users/HyeLyn/Desktop/KMOOC")
dat <- read.csv("국회의원_선거구_유권자수.csv", header = TRUE, encoding = "EUC-KR")
str(dat)
head(dat, 30)
treemap(dat,
        index = c("시도", "선거구명"),
        vSize = "선거인.수",
        vColor = "선거인.수",
        type = "value",
        bg.labels = "yellow")


# 2.  “국회의원_선거구_유권자수.csv” 파일의 내용으로 부터 시도별 선거인수를 집계(합계계산)하여 
# 다음과 같은 treemap 을 작성하시오. 
# 
# ※ 색깔은 선거인수를 의미

library(treemap)
dat <- read.csv("국회의원_선거구_유권자수.csv", header = TRUE)
str(dat)
head(dat)
psum <- aggregate(dat[,5], by=list(dat$시도), sum)

treemap(psum,
        index = c("Group.1"),
        vSize = "x",
        vColor = "x",
        type = "value",
        bg.labels = "yellow")




#____________________________#
#        7-2 모범답안        #
#____________________________#


# 1. state.x77 데이터로 부터 다음과 같은 버블차트를 작성하시오.
# st <- data.frame(state.x77) 과 같이 matrix를 data frame 으로 변환하여 사용
# 
# ※ 원의 크기는 인구(Population) 수를 의미
library(MASS)
str(state.x77)
st <- data.frame(state.x77)
symbols(st$Income, st$Illiteracy,
        circles = st$Population,
        inches = 0.4,
        fg = "white",
        bg = "green",
        lwd = 1.5,
        xlab = "Income",
        ylab = "Illiteracy",
        main = "US State data")
text(st$Income, st$Illiteracy,
     rownames(st),
     cex = 0.5,
     col = "black")



#____________________________#
#        7-3 모범답안        #
#____________________________#


#1. 월별(Month)기온(Temp)을boxplot으로작성하시오str(airquality)
head(airquality)
boxplot(Temp~Month, data = airquality, xlab = "Month Number", ylab = "Temp", main = "Different boxplots for each month", col = "orange")

# 2. 월별(Month) 풍속(Wind)을 boxplot 으로 작성하시오.
boxplot(Wind~Month, data = airquality, xlab = "Month Number", ylab = "Wind", main="Different boxplots for each month", col = "yellow")

# 3. 월별(Month) 오존농도(Ozone)을 boxplot 으로 작성하시오.
boxplot(Ozone~Month, data = airquality, xlab = "Month Number", ylab = "Ozone", main="Different boxplots for each month", col = "lightgray")




#____________________________#
#        7-4 모범답안        #
#____________________________#


# 1. HairEyeColor 데이터셋에 대해 모자이크 플롯을 작성하시오. 여기서 관찰할 수 있는 정보는 무엇인가? 
str(HairEyeColor)  
mosaicplot(~Eye+Hair, data = HairEyeColor, color = T)
#어떤 색의 눈과 머리색을 보유한 사람들의 분포를 알 수 있다.

# 2. 다음의 santa data 에 대해 모자이크 플롯을 작성하시오 (다음 slide 참조). 여기서 관찰할 수 있는 정보는 무엇인가?
santa <- data.frame(belief = c('no belief','no belief','no belief','no belief',
                           'belief','belief','belief','belief',
                           'belief','belief','no belief','no belief',
                           'belief','belief','no belief','no belief'),
                  sibling = c('older brother','older brother','older brother','older sister',
                            'no older sibling','no older sibling','no older sibling','older sister',
                            'older brother','older sister','older brother','older sister',
                            'no older sibling','older sister','older brother','no older sibling'))
mosaicplot(~belief+sibling, data = santa, color = TRUE, xlab = "산타를 믿는가", ylab = "언니 오빠", main = "언니 오빠의 영향력")
#산타를 믿는 사들은 no older sibling이 대다수, 산타를 믿지 않는 자들은 older brother이 대다수






#____________________________#
#        7-5 모범답안        #
#____________________________#


library(ggplot2)
# 1. R에서 제공하는 state.x77 데이터셋의 Income, Illiteracy 데이터를 가지고 ggplot 으로 산점도를 작성하시오.
st <- data.frame(state.x77)
ggplot(data = st, aes(x = Income, y = Illiteracy)) +
  geom_point()

# 2. R에서 제공하는 mtcars 데이터셋의 gear 데이터를 가지고 기어수별 빈도에 대해 ggplot 으로 막대 그래프를 작성하시오.
class(mtcars)
head(mtcars)
cnt <- table(mtcars$gear)
gear <- c(3,4,5)
data <- cbind(cnt, gear)
data <- data.frame(data)
ggplot(data, aes(x = gear, y = cnt)) +
  geom_bar(stat = "identity", width=0.7, fill = "steelblue")

# 3. R에서 제공하는 airmiles 데이터셋은 1937년~1960년까지 비행기 탑승객의 여행거리가 저장되어 있다.
# ggplot 으로 선그래프를 작성하시오.
# # (x축:년도, y축:여행거리. airmiles 는 벡터가 아니기 때문에 다음과 같이 벡터로 바꾼 다음 실행한다.  
#   am <- as.numeric(airmiles)
str(airmiles)
year <- 1937:1960
data <- cbind(year, airmiles)
air <- data.frame(data)
ggplot(air, aes(x = year, y = airmiles)) +
  geom_line(color = 'red', size = 1)

# 4. R에서 제공하는 iris 데이터셋의 Petal.Width 에 대해 품종(Species)별 상자그림(boxplot) 을 ggplot 으로 작성하시오.
ggplot() +
  geom_boxplot(data = iris, aes(x = Species, y = Petal.Width, fill=Species))
