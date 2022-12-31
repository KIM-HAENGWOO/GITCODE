
#--------------------------------#
#        4-2주차 모범 답안       #
#--------------------------------#

#    R에서 제공하는 infert 데이터셋의 education 컬럼에는
#    각 사람이 교육 받은 기간이 범주형 자료 형태로 저장되어 있다.
# 1. infert 데이터셋의 education 컬럼 값을 잘라내어 edu 에 저장한뒤 edu 의 값을 보이시오. 
head(infert)
edu <- infert$education
edu

# 2. edu 에 있는 값들을 중복을 제거하고 보이시오. 
unique(edu)

# 3. edu 에 있는 값들에 대해 도수 분포표를 작성하여 보이시오. 
t.edu <- table(edu)
t.edu

# 4. edu 에 있는 값들에 대해 막대 그래프를 작성하여 보이시오.
barplot(t.edu)








#--------------------------------#
#        4-3주차 모범 답안       #
#--------------------------------#

# 홍길동군의 과목별 성적은 다음과 같다.
# KOR  ENG  MATH  HIST  SOC  MUSIC  BIO  EARTH  PHY  ART
#  90   85    73    80   85     65   78     50   68   96

# 1. 이 데이터를 score 벡터에 저장하시오. (과목명은 데이터 이름으로 저장하시오) 
score <- c(90, 85, 73, 80, 85, 65, 78, 50, 68, 96)
names(score) <- c("KOR", "ENG", "MATH", "HIST", "SOC", "MUSIC", "BIO", "EARTH", "PHY", "ART")

# 2. score 벡터의 내용을 보이시오. 
score

# 3. 전체 성적의 평균은 얼마인가. 
mean(score)

# 4. 전체 성적의 중앙값은 얼마인가?
median(socre)

# 5. 전체 성적의 표준편차를 보이시오. 
sd(score)

# 6. 가장 성적이 높은 과목의 이름을 보이시오. 
score[score == max(score)]
subset(score, score == max(score))

# 7. 성적에 대한 boxplot 을 그리시오. 이상치에 해당하는 과목이 있으면 제시하시오. 
boxplot(score)

# 8. 성적에 대한 histogram 을 그리되 다음 조건을 만족하도록 하시오.
#   (그래프 title : Hong’s score, 막대색: 보라색) 
hist(score, 
     main = "Hong's score",
     xlab = "score", 
     ylab = "people",
     col = "purple",
     breaks = 5)



#(9~15) R에서 제공하는 mtcars 데이터셋을 이용하여 다음 문제를 해결하시오.
# 9. 중량(wt) 의 평균값, 중앙값, 절사평균값(절사범위:15%), 표준편차 를 구하시오. 
require(graphics)
head(mtcars)
mean(mtcars$wt)
median(mtcars$wt)
mean(mtcars$wt, trim = .15)
sd(mtcars$wt)


# 10. 중량(wt)에 대해 summary() 함수의 적용 결과를 보이시오.
summary(mtcars$wt)

# 11. 실린더수(cyl) 에 대해 도수분포표를 구하시오.
t <- table(mtcars$cyl)

# 12. 앞에서 구한 도수분포표를 막대그래프로 그려 보시오. 
barplot(t)

# 13. 중량(wt)의 히스토그램, 실린더(cyl), 기어(gear) 에 대한 막대 그래프를 한 화면에 보이게 작성 하시오. 
par(mfrow = c(1, 3))
hist(mtcars$wt)
barplot(table(mtcars$cyl), main = "barplot of mtcars$cyl")
barplot(table(mtcars$gear), main = "barplot of mtcars$gear")



# 14. 중량(wt)에 대해 boxplot 을 그려 보시오. Boxplot 으로 부터 관찰할 수 있는 정보를 적으시오.
par(mfrow = c(1,1))
boxplot(mtcars$wt)
# 자료의 범위 = 약 1~ 6 사이
# 중앙값 = 약 3.3
# 1사분위 = 약 2.5 / 3사분위 = 약 3.6으로 전체 자료의 50%가 이 범위에 위치하고 있다고 할 수 있음  
# 이상치 = 해당 boxplot에 따르면 약 5.2 이상의 값들을 이상치로 보며, 해당 데이터에는 이상치가 존재함을 알 수 있음
# 최대값 = 약 5.4 / 최소값 = 약 1.5
# 정상적인 데이터가 분포할 것으로 기대되는 범위는 약 1.04 ~ 약 5.15라고 할 수 있음
## IQR 구하기 
Q3 <- quantile(mtcars$wt, 0.75) 
Q1 <- quantile(mtcars$wt, 0.25)
iqr <- abs(Q3 - Q1)
iqr
# 또는 IQR() 함수 이용
iqr<- IQR(mtcars$wt)

Q3 + 1.5 * iqr 
Q1 - 1.5 * iqr


# 15. 배기량(disp)에 대해 boxplot 을 그려 보시오. Boxplot 으로 부터 관찰할 수 있는 정보를 적으시오.
boxplot(mtcars$disp)
summary(mtcars$disp)
# 자료의 범위 = 약 70~ 500 사이
# 중앙값 = 약 196
# 1사분위 = 약 120 / 3사분위 = 약 325로 전체 자료의 50%가 이 범위에 위치하고 있다고 할 수 있음  
# 이상치 =  해당 boxplot에 따르면 존재X
# 최대값 = 약 470 / 최소값 = 약 70
# 정상적인 데이터가 분포할 것으로 기대되는 범위는 약 -186.94 ~ 약 633.76이라고 할 수 있음
## IQR 구하기 

iqr <- IQR(mtcars$disp)

Q3 + 1.5 * iqr
Q1 - 1.5 * iqr












