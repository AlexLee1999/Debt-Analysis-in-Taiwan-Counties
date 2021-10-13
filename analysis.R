data_cities_list <- list( "./data_cities/New_Taipei.csv", "./data_cities/Taoyuan.csv", "./data_cities/Taichung.csv", "./data_cities/Tainan.csv", "./data_cities/KaoHsiung.csv", "./data_cities/HsinChu_City.csv", "./data_cities/ChangHua.csv", "./data_cities/KeeLung.csv", "./data_cities/Yilan.csv")
d <- read.csv("./data_cities/taipei.csv")
for (url in data_cities_list){
    d<-rbind(d, read.csv(url))
}
# model_first <- lm(debtpp ~ unem + revenuepp + socialwalfarepp + elecyr + party + unanimous + relation + expect + unem:elecyr + lowincomehh, data = d)
# summary(model_first)

model_second <- lm(debtpp ~ unem + elecyr + cpi + population + socialwalfarepp + unanimous + revenuepp + lowincomehh + expect + party + relation + dpp + kmt + y67 + y68 + y69 + y70 + y71 + y72 + y73 + y74 + y75 + y76 + y77 + y78 + y79 + y80 + y81 + y82 + y83 + y84 + y85 + y86 + y87 + y88 + y89 + y90 + y91 + y92 + y93 + y94 + y95 + y96 + y97 + y98 + y99 + y100 + y101 + y102 + y103 + y104 + y105 + y106 + y107 + y108 + chc + tw + hcc + tpe + ntpc + tao + tcc + tnn + kao + kee + yil, data = d)
summary(model_second)
