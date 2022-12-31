
#--------------------------------#
#       11-1주차 모범 답안       #
#--------------------------------#

library(mice)   
ds <- ampute(iris[,1:4], 0.2)$amp    



# (1) 각 컬럼별로 결측값이 몇 개인지 보이시오.
colSums(is.na(ds))

col_na <- function(y){
  return(sum(is.na(y)))
}

na_count <- sapply(ds, col_na)
na_count

# (2) 결측값이 포함된 행들의 데이터를 보이시오.
ds[!complete.cases(ds),]


# (3) 결측값이 포함된 행은 몇 개인지 보이시오.
sum(rowSums(is.na(ds)))


# (4) 결측값이 포함된 행들을 제외하고 새로운 데이터셋(ds.new)을 만들어 보이시오.

ds.new <- ds[complete.cases(ds),]
ds.new
sum(is.na(ds.new))



#--------------------------------#
#       11-2주차 모범 답안       #
#--------------------------------#

# (1) state.x77 데이터셋을 st 에 저장한 후  st 의 각 변수(컬럼) 들에 대해 이상치가 존재하는지 boxplot 그려 확인하시오.
st <- data.frame(state.x77)
str(st)
boxplot(st[,1]) # Population
boxplot(st[,2]) # Income
boxplot(st[,3])
boxplot(st[,4])
boxplot(st[,5])
boxplot(st[,6])
boxplot(st[,7])
boxplot(st[,8]) # Area

# (2) 이상치가 존재하는 경우 이상치를 NA 로 저장하시오.
out.val.pop <- boxplot.stats(st$Population)$out
st$Population[st$Population %in% out.val.pop] = NA


out.val.ic <- boxplot.stats(st$Income)$out
st$Income[st$Income %in% out.val.ic] = NA


out.val.ar <- boxplot.stats(st$Area)$out
st$Area[st$Area %in% out.val.ar] = NA

sum(is.na(st))

# (3) st 에서 NA 가 존재하는 행들을 제거하여 st2 에 저장하시오.
st2 <- st[complete.cases(st),]
sum(is.na(st2))




#--------------------------------#
#       11-3주차 모범 답안       #
#--------------------------------#


# (1) state.x77 데이터셋을 Population 을 기준으로 오름차순 정렬을 하시오.
st <- data.frame(state.x77)
st[order(st$Population),]

# (2) state.x77 데이터셋을 Income 을 기준으로 내림차순 정렬을 하시오.
st[order(st$Income, decreasing = T),]


# (3) Illiteracy(문맹률) 인 낮은 상위 10개주의 이름과 문맹률을 보이시오.
ds <- st[order(st$Illiteracy),]
idx <- unique(ds$Illiteracy)[1:10]

ds.10 <- st[st$Illiteracy %in% idx, ]
ill.10 <- ds.10[order(ds.10$Illiteracy),]
subset(ill.10, select = Illiteracy)





#--------------------------------#
#       11-5주차 모범 답안       #
#--------------------------------#

# (1) state.x77 데이터셋의 자료를 state.region 에 있는 지역정보에 따라 5개 데이터 그룹으로 분리하시오.
# 분리된 데이터의 내용을 보이시오.
st <- data.frame(state.x77, state.region)

sp <- split(st, st$state.region)
sp

# (2) state.x77 에서 면적 (area)이 Alabama 보다 크고 California 보다 작은 주의 이름과 인구수(Population), 
# 소득(Income), 면적(Area)을 보이시오.

subset(st, Area > st['Alabama','Area'] & Area < st['California','Area'], select = c("Population", "Income", "Area"))

# (3)  iris 에서 40개의 행을 임의 추출하여 iris.40 에 저장하고, 나머지 행들은 iris.110에 저장하시오. 
# iris.40 과 iris.110 의 내용을 보이시오.

idx <- sample(nrow(iris), size = 40, replace = F)
iris.40 <- iris[idx,]
iris.40 
iris.110 <- iris[-idx,]
iris.110
# (4) iris 에서 3개의 품종(Species)을 2개씩 짝지어 보이시오. 

x <- as.character(unique(iris$Species))
com <- combn(x, 2)
for (i in 1:ncol(com)) {
  cat(com[,i], "\n")
} 
