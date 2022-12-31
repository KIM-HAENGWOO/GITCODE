
#____________________________#
#        6-2 모범답안        #
#____________________________#



#1번
sum <- 0
cnt <- 0
for(i in 1:100){
  if(i%%3 == 0){
    sum <- sum+i
    cnt <- cnt+1
  }
}
sum
cnt

#2번
for(i in 101:200){
  if(i %% 3 == 0 | i %% 4 == 0){
    print(i)
  }
}

#3번
for(i in 1:24){
  if(24 %% i == 0){
    print(i)
  }
}

#4번
fac <- 1
for(i in 1:10){
  fac <- fac*i
}
fac

#5번
num1 <- 0
num2 <- 1
print(num1)
print(num2)
for(i in 3:40){
  temp <- num2
  num2 <- num1+num2
  num1 <- temp
  print(num2)
}



#____________________________#
#        6-3 모범답안        #
#____________________________#


#6-3
#1.  다음과 같이 두 정수를 입력하면 두 수의 최대 공약수를 찾아서 return 해주는 함수 lgm() 를 작성하고 테스트 하시오.
lgm = function(x, y){
  if(x<y){
    temp <- x
    x <- y
    y <- temp
  }
  while(y!=0){
    n <- x%%y
    x <- y
    y <- n
  }
  return (x)
}
result <- lgm(10,8)
result
result <- lgm(10,20)
result

#2. 다음과 같이 벡터를 입력하면 벡터의 최대값과 최소값을 return 하는 함수 maxmin() 을 작성하고 테스트 하시오. (return 값이 list 임)
maxmin <- function(v){
  return (list(max = max(v), min = min(v)))
}

v1 <- c(7,1,2,8,9)
result <- maxmin(v1)
result$max ; result$min
result <- maxmin(iris[,1])
result$max ; result$min




#____________________________#
#        6-5 모범답안        #
#____________________________#

#6-5
#1.세개의 숫자를 매개변수로 입력하면 그중에 가장 큰 수를 돌려주는 함수를 작성하고 테스트 하시오.
maxofthree <- function(a,b,c){
  max = a
  if(max < b) max = b
  if(max < c) max = c
  return (max)
}
result <- maxofthree(3,5,9)
result
result <- maxofthree(10,8,10)
result

# 또는 

maxofthree <- function(a,b,c){
  max = a
  if(max < b){
    max = b
  } 
  if(max < c){
    max = c
  } 
  return (max)
}

result <- maxofthree(10,12,1)
result
result <- maxofthree(100,50,10)
result




#2.화면에서 숫자 2개를 입력 받아 두숫자의 합과 곱을 출력하는 프로그램을 작성하시오. 
# (이작업을 계속 반복하되 두 숫자가 모두 0 이면 프로그램을 중지한다)
while(TRUE){
  a <- readline(prompt="give number : ")             
  a <- as.integer(a)
  b <- readline(prompt="give number : ")
  b <- as.integer(b)
  if(a==0 & b==0){
    break;
  }
  print(a+b)
  print(a*b)                
}

# a = 0이고 b = 0일경우, 답 출력 안되고 반복 종료


#또는

a <- 1
b <- 1
while (a != 0 & b != 0) {
  a <- readline(prompt = "give number1: ")
  a <- as.integer(a)
  b <- readline(prompt = "give number2: ")
  b <- as.integer(b)
  
  sum <- a + b
  mul <- a * b
  
  cat("합: ", sum, "곱: ", mul, "\n")
  
}


# a = 0이고 b = 0일경우, 답 출력되고 반복 종료