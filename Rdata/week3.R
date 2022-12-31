
#--------------------------------#
#        3-1주차 모범 답안       #
#--------------------------------#

# 1
score <- matrix(data = c(10, 40, 60, 20, 21, 60, 70, 30), nrow = 4, dimnames = list(c(), c("m", "f")))

## 또는 
m <- c(10, 40, 60, 20)
f <- c(21, 60, 70, 30)
score <- cbind(m, f)

# 2
colnames(score) <- c("male", "female")
score

# 3
score[2,]


# 4
score[,"female"]
score[,2]





#--------------------------------#
#        3-2주차 모범 답안       #
#--------------------------------#



# 1
df <- data.frame(id = c(10, 20, 30, 40, 50),
                 name = c("Jhon", "Tom", "Paul", "Jane", "Grace"),
                 score = c(95, 46, 98, 74, 85))


# 2
df$score

df[,3]

df[,"score"]

### 모두 동일한 값을 나타내는 인덱싱 방법


# 3
df[,c("id", "score")]
## 또는
df[,c(1,3)]


# 4
df[2:3, ]
## 또는
df[c(2,3), ]


# 5
df[2, 3]

0#--------------------------------#
#        3-3주차 모범 답안       #
#--------------------------------#

# 1
st <- data.frame(state.x77)

# 2
st


# 3
colnames(st)

# 4
rownames(st)



# 5
dim(st)

# 6
str(st)


# 7
rowSums(st)
rowMeans(st)

# 8
colSums(st)
colMeans(st)

# 9
st["Florid",]

# 10
st.income <- st[, "Income"]
names(st.income) <- rownames(st)
st.income

# 11
st["Texas", "Area"]

# 12
st["Ohio", c("Population", "Income")]

# 13
st[st$Population >= 5000, ]

# 14
st[st$Income >= 4500, c("Population", "Income", "Area")]

# 15
sum(st$Income >= 4500)

# 16
st[st$Area > 100000 & st$Frost >= 120,]

# 17

ill.2 <- st[st$Illiteracy >= 2.0, ]
mean(ill.2$Income)



d1 <- subset(st, Illiteracy >= 2.0, select = "Income")
mean(d1$Income)

d2 <- st %>%
  filter(Illiteracy >= 2.0) %>%
  select(Income)
mean(d2$Income)


# 18
less2 <- subset(st, Illiteracy < 2.0, select = "Income")
less.mean <- mean(less2$Income)

more2 <- subset(st, Illiteracy >= 2.0, select = "Income")
more.mean <- mean(more2$Income)

less.mean - more.mean

# 19
max.le <- max(st$Life.Exp)
subset(st, Life.Exp == max.le )


# 20
penn.income <- st["Pennsylvania", "Income"]
subset(st, Income > penn.income, select = Income)



#--------------------------------#
#        3-4주차 모범 답안       #
#--------------------------------#



# 1
st <- data.frame(state.x77)
income5000 <- subset(st, Income >= 5000)
write.csv(income5000, file = "rich_state.csv")



# 2
ds <- read.csv("rich_state.csv")
rownames(ds) <- ds$X
ds <- ds[,-1]






#--------------------------------#
#        3-5주차 모범 답안       #
#--------------------------------#


# 1
myiris <- list(Group = iris$Species, Data = iris[,1:4])


# 2
myiris[1]
myiris[2]


# 3
weekdays <- factor(c("Sun", "Mon", "Tue", "Wed", "Thurs", "Fri", "Sat"))
weekdays
weekdays <- factor(weekdays, levels = c("Sun", "Mon", "Tue", "Wed", "Thurs", "Fri", "Sat"))
weekdays

is.factor(weekdays)

# 4
as.numeric(weekdays)
