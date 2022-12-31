

# < 본 코드는 참고용으로 보세요>
#________________________________________________________



## 테이블 형태로된 데이터를 그대로 사용하여 모자이크플롯 그리기

# 1.HospVisits 데이터가 내장되어 있는 패키지(vcdExtra) 설치 및 불러오기
install.packages("vcdExtra")
library(vcdExtra)

# 2.HospVisits 데이터셋 불러오기 및 저장
data("HospVisits")
dt <- HospVisits

# 3.mosaicplot 그리기
mosaicplot(~visit+stay, data = dt, color = T)

#________________________________________________________



## 테이블 형태로된 데이터를 csv로 만들기

# 1.HospVisits 데이터가 내장되어 있는 패키지(vcdExtra) 설치 및 불러오기
install.packages("vcdExtra")
library(vcdExtra)

# 2.HospVisits 데이터셋 불러오기 및 저장
data("HospVisits")
dt <- HospVisits

# 3.저장한 dt 데이터셋을 데이터 프레임으로 변환
df <- as.data.frame(dt)

# 4.도수(count)로 된 Freq 열을 풀기 위한 함수가 내장된 패키지(tidyverse) 설치 및 불러오기 
install.packages("tidyverse")
library(tidyverse)

# 5.uncount()함수를 이용해 count된 Freq 열을 하나의 행으로 변환 
ds <- uncount(df, weights = Freq) 

# 6.행이름 바꾸기
colnames(ds) <- c("freq", "stay")
head(ds)

# 7.csv 파일로 저장 
write.csv(ds, file = "hospital.csv", row.names = F)

# 8.저장된 csv 파일 읽어오기
hospital <- read.csv("hospital.csv")
head(hospital)


# 9. factor level 순서 바꾸기 

install.packages("gdata")
library(gdata)

hospital$freq <- reorder.factor(hospital$freq, new.order = c("Never", "Infrequent", "Regular"))
hospital$stay <- reorder.factor(hospital$stay, new.order = c("2-9", "10-19", "20+"))

str(hospital)

table(hospital)


# 10.mosaicplot 그리기
mosaicplot(~freq+stay, data = hospital, color = T)


#________________________________________________________

## 추가) 강의내용과 같이 데이터셋의 class명 변경하기 

# stringr 패키지 설치
install.packages("stringr")
library(stringr)

# freq 열만 뽑아내기
get.freq <- hospital$freq

# freq 열의 class 명 바꾸기
freq<- str_replace_all(get.freq, "Regular", "(3)Regular")
freq<- str_replace_all(freq, "Infrequent", "(2)Infrequent")
freq<- str_replace_all(freq, "Never", "(1)Never")



# stay 열만 뽑아내기
get.stay <- hospital$stay

# stay 열의 class 명 바꾸기
stay<- str_replace_all(get.stay, "20+", "(3)20")
stay<- str_replace_all(stay, "10-19", "(2)10-19")
stay<- str_replace_all(stay, "2-9", "(1)2-9")


# 새로 바뀐 hospital 데이터셋 확인
hospital2 <- data.frame(freq, stay)


#table로 변환하기
table(hospital2)


mosaicplot(~freq+stay, data = hospital2, color = TRUE)
