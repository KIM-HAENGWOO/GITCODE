#https://cloud.google.com/billing/docs/how-to/manage-billing-account?hl=ko (구글 결제계정등록 관련)

remove.packages("ggmap")
remove.packages("tibble")


# 아래와 같은 error 메세지가 뜨는 경우, 해당 R 프로그램을 종료하고, 해당 라이브러리들이 저장되어 있는 파일에 가서 삭제 (ppt 3p 참고)
# 예시) Error: package or namespace load failed for ‘devtools’ in loadNamespace(i, c(lib.loc, .libPaths()), versionCheck = vI[[i]]): ‘ggplot2’이라고 불리는 패키지가 없습니다
# 예시) Error: package or namespace load failed for ‘devtools’ in loadNamespace(i, c(lib.loc, .libPaths()), versionCheck = vI[[i]]): ‘rlang’이라고 불리는 패키지가 없습니다
# 예시) Error: package or namespace load failed for ‘devtools’ in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]):‘Rcpp’이라고 불리는 패키지가 없습니다
# 삭제 및 패키치 설치 후, ggmap 패키지 설치 재실행 
# 예시) install.packages("Rcpp") 
# 예시) install.packages("rlang")
# ggmap 패키지 설치 재실행 
# 최신 버전의 패키지로의 업데이트에 관해 묻는 메세지 창이 뜨면, 모두 업데이트 시키고 싶을 경우 all에 해당하는 번호를, 업데이트 시키지 않고자 할 경우 none에 해당하는 
# 번호를 콘솔창에 입력



install.packages("devtools")
library(devtools)
install_github("dkahle/ggmap", ref = "tidyup")  
# install_github("dkahle/ggmap", ref = "tidyup", force = T)     # 위의 코드로 설치가 실행이 안될 경우 
library("ggmap")

register_google(key = #"본인 API 키 입력"
)

names <- c("용두암", "성산일출봉", "정방폭포",
           "중문관광단지", "한라산1100고지", "차귀도")

addr <- c("제주시 용두암길 15",
          "서귀포시 성산읍 성산리",
          "서귀포시 동홍동  299-3",
          "서귀포시 중문동 2624-1",
          "서귀포시 색달동  산1-2",
          "제주시 한경면 고산리 125")

gc <- geocode(enc2utf8(addr))
gc

df <- data.frame(name = names,
                 lon = gc$lon,
                 lat = gc$lat)


cen <- c(mean(df$lon), mean(df$lat))

map <- get_googlemap(center = cen,
                     maptype = "roadma",
                     zoom = 10,
                     size = c(480, 480),
                     markers = gc)

ggmap(map)
