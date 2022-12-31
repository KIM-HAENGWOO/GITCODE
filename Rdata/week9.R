rm(list = ls())

#--------------------------#
#     9-1주차 모범답안     #
#--------------------------#


library(devtools)
library("ggmap")

register_google(key = #'API 키'
                  )

# (1) 서울시청 지역의 지도를 표시하되 지도 크기는 800x600 으로 하고 maptype 은 "roadmap" 으로 하시오.

addr <- c('서울특별시 중구 명동 세종대로 110')

gc <- geocode(enc2utf8(addr))
gc

df <- data.frame(name = names,
                 lon = gc$lon,
                 lat = gc$lat)


cen <- c(mean(df$lon), mean(df$lat))

cityhall_map <- get_googlemap(center = cen,
               zoom = 16, 
               maptype = 'roadmap', 
               markers = gc)

gmap <- ggmap(cityhall_map )

gmap


# (2) 금강산 지역의 지도를 표시하되 지도 크기는 640x480 으로 하고 maptype 은 "hybrid" 으로 하시오. 
# zoom 은 8로 하시오.


addr <- c('M443+MX Ssukpat, 조선민주주의인민공화국')
gc <- geocode(enc2utf8(addr))
df <- data.frame(name = names,
                 lon = gc$lon,
                 lat = gc$lat)

cen <- c(df$lon, df$lat)


mt.map <- get_googlemap(center = cen,
                     maptype = "hybrid",
                     zoom = 10,
                     markers = gc)

gmap <- ggmap(mt.map)
gmap






# (3) 경도 103.867881, 위도 1.331017 지역의 지도를 표시하되 maptype 은 "roadmap" 으로 하고, zoom 은 9로 하시오.

cen <- c(103.867881, 1.331017)
sgp <- get_googlemap(center = cen,
                     maptype = "roadmap",
                     zoom = 9)

gmap <- ggmap(sgp)
gmap





#--------------------------#
#     9-2주차 모범답안     #
#--------------------------#

# (1) 서울시 각 구청의 위치에 마커, 구청이름을 지도위에 표시하시오.

loc <- read.csv("seoul.csv", header = T)  # geocode를 이용해 얻은 위치 정보 파일 
str(loc)

kor <- get_map("seoul", zoom = 11, maptype = "roadmap")
kor.map <- ggmap(kor) + geom_point(data = loc, aes(x = LON, y = LAT), size = 3, alpha = 1)
kor.map + geom_text(data = loc, aes(x = LON, y = LAT + 0.01, label = 구청명), colour = "black", fontface = "bold", size = 3.5)




# (2) 우리나라의 광역시를 마커, 광역시 이름과 함께 지도위에 표시하시오. 

names <- c( '부산광역시', '대구광역시', '인천광역시',
            '광주광역시', '대전광역시', '울산광역시')

addr <- c('5352+23 부산광역시',
          'RHH8+V9 대구광역시',
          'FP52+2V 남동구 인천광역시',
          '4RXR+H4 광주광역시',
          '89QV+57 대전광역시',
          'G7R4+7V 울산광역시')

gc <- geocode(enc2utf8(addr))
gc

df <- data.frame(name = names,
                 lon = gc$lon,
                 lat = gc$lat)


cen <- c(mean(df$lon), mean(df$lat))

kr <- get_googlemap(center = cen,
                              zoom = 7, 
                              maptype = 'roadmap', 
                              markers = gc)

gmap <- ggmap(kr)
gmap + geom_text(data = df, aes(x = lon, y = lat + 0.01, label = name), colour = "black", fontface = "bold", size = 3.5)



#--------------------------#
#     9-3주차 모범답안     #
#--------------------------#

# (1) treemap 패키지의 GNI2014 데이터셋을 이용하여 유럽대륙의 각 나라의 위치에 그 나라의 인구수를
# 원의 크기로 표시하시오.
# (원의 색깔은 초록색, alpha=0.5)

library(treemap)
data('GNI2014')
ds <- GNI2014
head(ds)

erp <- ds[c(2,4,6),]
erp

names <- erp[,2]
df <- data.frame(name = names,
                 lon = c(10.7387413, 8.227512, 6.13),
                 lat = c(59.9138204,46.818188, 49.61167))
cen <- c(mean(df$lon), mean(df$lat))


europe.map <- get_googlemap(center = cen,
                    zoom = 4, 
                    maptype = 'roadmap', 
                    markers = gc)


gmap <- ggmap(europe.map) + geom_point(data = df, aes(x=lon, y=lat, size = erp$population), alpha = .5)
gmap + scale_size_area(name = c('Population'), max_size = 15) + 
  geom_text(data = df, aes(x = lon, y = lat, label = name), colour = "black", fontface = "bold", size = 3.5)

