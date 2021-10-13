data_cities_list <- list( "./data_cities/New_Taipei.csv", "./data_cities/Taoyuan.csv", "./data_cities/Taichung.csv", "./data_cities/Tainan.csv", "./data_cities/KaoHsiung.csv", "./data_cities/HsinChu_City.csv", "./data_cities/ChangHua.csv", "./data_cities/KeeLung.csv", "./data_cities/Yilan.csv")
d <- read.csv("./data_cities/taipei.csv")
for (url in data_cities_list){
    d<-rbind(d, read.csv(url))
}
modelp1 <- lm(debtpp ~ unem + revenuepp + socialwalfarepp + elecyr + party + unanimous + relation + expect + unem:elecyr + lowincomehh, data = d)
summary(modelp1)