
rm(list = ls())
set.seed(123)

# 필요 패키지 설치 및 불러오기
install.packages("wordcloud")
install.packages("KoNLP")
install.packages("RColorBrewer")
install.packages('rJava')

lib <- list('rJava', "wordcloud", "KoNLP", "RColorBrewer")
unlist(lapply(lib, require, character.only = T))

## useSejongDic() 실행 오류 시, 아래 주석처리 된 부분 실행
useSejongDic()
# install.packages('devtools')
# library(devtools)
# install_github('haven-jeon/NIADic/NIADic', build_vignettes = TRUE)

pal2 <- brewer.pal(8, "Dark2") # 글자색 저장





# 새누리당 대표 국회 연설문
saenuri <- readLines("saenuri.txt", encoding = "UTF-8")

noun <- sapply(saenuri, extractNoun, USE.NAMES = F)
noun

noun2 <- unlist(noun)
noun2 <- noun2[nchar(noun2)>=2]

wordcount <- table(noun2)

temp <- sort(wordcount, decreasing=T)[1:30]
temp
# temp <- temp[-1]
# temp

barplot(temp, las = 2, names.arg = names(temp), col="lightblue",
        main = "Most frequent words", ylab = "Word frequencies")


wordcloud(names(wordcount), freq = wordcount, scale=c(6, 0.5), min.freq = 3,
          random.order = F, rot.per=0.25, colors  = pal2)


# 무의미한 단어 제거시, 어떤 단어를 제거할 것인가는 분석가의 판단에 의해 결정 
noun2 <- gsub("국민", "", noun2)             
noun2 <- gsub("우리", "", noun2)
noun2 <- gsub("여러분", "", noun2)
noun2 <- gsub("들이", "", noun2)
noun2 <- gsub("하게", "", noun2)
noun2 <- gsub("대표", "", noun2)
noun2 <- gsub("대한", "", noun2)
noun2 <- gsub("민국", "", noun2)
noun2 <- gsub("새누리당은", "", noun2)
noun2 <- gsub("일부", "", noun2)
noun2 <- gsub("70", "", noun2)
noun2 <- gsub("해서", "", noun2)
noun2 <- gsub("마련", "", noun2)
noun2 <- gsub("문제", "", noun2)
noun2 <- gsub("새누리당", "", noun2)
noun2 <- gsub("새누리당이", "", noun2)

## 무의미한 단어 제거된 noun2를 table형태로 다시 저장
wordcount <- table(noun2)

wordcloud(names(wordcount), freq=wordcount, scale=c(7, .5), min.freq = 3,
          random.order = F, rot.per=0.25, colors  = pal2)




#_____________________________________________________________


thebul <- readLines("thebul.txt", encoding = "UTF-8")

noun <- sapply(thebul, extractNoun, USE.NAMES = F)
noun

noun2 <- unlist(noun)
noun2 <- noun2[nchar(noun2)>=2]

wordcount <- table(noun2)




temp <- sort(wordcount, decreasing=T)[1:30]
temp

barplot(temp, las = 2, names.arg = names(temp), col="lightblue",
        main = "Most frequent words", ylab = "Word frequencies")

wordcloud(names(wordcount), freq=wordcount, scale=c(5, 0.5), min.freq = 3,
          random.order = F, rot.per=0.25, colors  = pal2)



noun2 <- gsub("국민", "", noun2)
noun2 <- gsub("우리", "", noun2)
noun2 <- gsub("문제", "", noun2)
noun2 <- gsub("여러분", "", noun2)
noun2 <- gsub("대한", "", noun2)
noun2 <- gsub("민국", "", noun2)
noun2 <- gsub("이상", "", noun2)
noun2 <- gsub("들이", "", noun2)
noun2 <- gsub("때문", "", noun2)
noun2 <- gsub("10", "", noun2)

wordcount <- table(noun2)


wordcloud(names(wordcount), freq=wordcount, scale=c(6, 0.5), min.freq = 3,
          random.order = F, rot.per=0.25, colors  = pal2)

#________________________________________________________


kookmin <- readLines("kookmin.txt", encoding = "UTF-8")

noun <- sapply(thebul, extractNoun, USE.NAMES = F)
noun

noun2 <- unlist(noun)
noun2 <- noun2[nchar(noun2)>=2]

wordcount <- table(noun2)




temp <- sort(wordcount, decreasing=T)[1:30]
temp

barplot(temp, las = 2, names.arg = names(temp), col="lightblue",
        main = "Most frequent words", ylab = "Word frequencies")

wordcloud(names(wordcount), freq=wordcount, scale=c(5, 0.5), min.freq = 3,
          random.order = F, rot.per=0.25, colors  = pal2)




noun2 <- gsub("국민", "", noun2)
noun2 <- gsub("우리", "", noun2)
noun2 <- gsub("문제", "", noun2)
noun2 <- gsub("여러분", "", noun2)
noun2 <- gsub("대한", "", noun2)
noun2 <- gsub("민국", "", noun2)
noun2 <- gsub("이상", "", noun2)
noun2 <- gsub("10", "", noun2)
noun2 <- gsub("들이", "", noun2)
noun2 <- gsub("때문", "", noun2)


wordcount <- table(noun2)

wordcloud(names(wordcount), freq=wordcount, scale=c(6, 0.5), min.freq = 3,
          random.order = F, rot.per=0.25, colors  = pal2)



