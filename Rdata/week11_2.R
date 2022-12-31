rm(list = ls())

# package 설치 및 불러오기
libs <- c("ggplot2", "ggmap", "jsonlite", "tidyverse")
#install.packages(libs)
unlist(lapply(libs, require, character.only=TRUE))


# CSV 포맷의 파일을 다음과 같이 읽어 들인다.  
subway <- read.csv("subway.csv", stringsAsFactors = F, encoding = 'UTF-8', header = T)
head(subway)
str(subway)
# 정수형으로 저장된 `income_date` 변수를 시간을 나타내는 표준서식으로 변환하여 분석에 활용 가능토록 한다.  
subway[,3] <- as.character(subway[,3])
subway[,3] <- as.Date(subway[,3], format = "%Y%m%d")
head(subway,2)

# 2014년 자료는 7월까지의 정보만 포함하고 있으므로 2014년 자료를 분석에서 제외하고, 
# 나머지 연도의 자료를 `subway2` 이름의 데이터프레임으로 저장한다. 
subway2 <- separate(subway, income_date, into = c("year", "month", "day"), sep = "-")

subway2 <- cbind(subway2, subway[,3])

colnames(subway2)[which(names(subway2) == "subway[, 3]")] <- "income_date"
str(subway2)
subway2 <- subway2 %>%
  filter( year != "2014")

head(subway2)


# 자료에 포함된 역명이 실제 사용되는 역이름과 동일한지 확인한다.  
# 본 데이터에 사용되는 역명은 `역명(노선)` 형식의 값을 취하고 있으므로 이를 `역명`으로 변환하여 분석시 활용하도록 한다.  
sort(unique(subway[ , 'stat_name']))


# 역명에 노선번호가 붙은 행을 `grep()`을 이용하여 찾고, 이를 `strsplit()`을 이용하여 역명과 노선번호를 분리하여 
# 변수 `stat_name`에 노선번호가 붙지 않는 역명으로 대체하는 코드는 아래와 같다.  

idx <- grep( "\\(" , subway2[ , "stat_name"] )
unique(subway2[idx, "stat_name"])
stat_name <- subway2[ , "stat_name"]
tmp <- sapply(subway2[idx, "stat_name"], strsplit, "\\(", USE.NAMES=FALSE)
stat_renamed <- sapply(tmp, function(x) x[1])
subway2[idx, "stat_name"] <- stat_renamed


# `subway_latlong.csv` 파일을 읽는다.
subname <- read.csv("subway_latlong.csv", stringsAsFactors = F)
head(subname)

# `subway.csv` 파일로부터의 역명과 동일한 형식으로 주어지는지 확인을 위해 아래와 같이 역명을 출력하여 살펴봄.  
head(sort(unique(subname[ , "STATION_NM"])), 10)

# 아래 코드를 통해 지하철노선별 역명을 `Line` 이름의 리스트 객체에 저장하여 추후 분석에 활용한다.  
Line <- tapply(subname[,"STATION_NM"], subname[,"LINE_NUM"], unique)
sapply(Line, head)


# 과제문제 ________________________________________________________________________________________

# (1) 제공된 파일중 subway.csv 와 subway_latlong.csv 파일을 읽은후 병합하여subway.tot 에 저장하시오. 
# 병합기준 컬럼은 STATION_CD 와 station 입니다.

subway.tot <- merge(x = subway2, y = subname,
                    by.x = "stat_name", by.y = "STATION_NM")
head(subway.tot, 3)
subway.tot$off_tot <- as.integer(subway.tot$off_tot)
str(subway.tot)



# (2) subway.tot 에서 역이름과 날짜를 기준으로 하루 평균 탑승인원(on_tot) 과 하차인원(off_tot) 을 
# 집계하여 보이시오.

agg.on <- aggregate(formula = on_tot ~ stat_name + income_date, data = subway.tot, FUN = mean)
agg.on

## 또는
agg.on <- aggregate(x = subway.tot$on_tot, by = list(station_name = subway.tot$stat_name, date = subway.tot$income_date), FUN = mean)
agg.on



agg.off <- aggregate(formula = off_tot ~ stat_name + income_date, data = subway.tot, FUN = mean)
agg.off

## 또는
agg.off <- aggregate(x = subway.tot$off_tot, by = list(station_name = subway.tot$stat_name, date = subway.tot$income_date), FUN = mean)
agg.off


# (3) subway.tot 에서 2011년도에 대해서만 역이름 기준 총 탑승인원(on_tot) 과 하차인원(off_tot) 을 
# 집계하여 보이시오.
subway.11 <- subset(subway.tot, subway.tot$year == "2011")


sn_on <- aggregate(formula = on_tot ~ stat_name, data = subway.11, FUN = sum)
sn_on

sn_off <- aggregate(formula = off_tot ~ stat_name, data = subway.11, FUN = sum)
sn_off

# (4) subway.tot 에서 2011년도에 대해서 호선(LINE_NUM)별 총 탑승인원(on_tot) 과 하차인원(off_tot) 을 
# 집계하여 보이시오. 

ln_on <- aggregate(formula = on_tot ~ LINE_NUM, data = subway.11, FUN = sum)
ln_on

ln_off <- aggregate(formula = off_tot ~ LINE_NUM, data = subway.11, FUN = sum)
ln_off


# tip______________________________________________________________________

# 아래의 코드는 역별 특정연도의 탑승객수를 합한하는 함수 `agg_fun()`을 정의하고, 
# Line 데이터와 이를 활용하여 요약된 결과를 데이터프레임에 저장하는 과정이다.  (호선별 역명과 연별 총 탑승객수를 알 수 있음)


agg_fun <- function(vec, dat){
  sub_Line <- dat[dat[,"stat_name"] %in% vec, ]
  tot <- aggregate(on_tot ~ year + stat_name, sub_Line, sum)
  return( tot )
}

total <- lapply(Line[1:8], FUN=agg_fun, dat=subway2)
df1 <- lapply(total, xtabs, formula = on_tot ~ stat_name + year)
lapply(df1, head)
