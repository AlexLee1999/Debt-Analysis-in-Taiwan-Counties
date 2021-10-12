library(sjPlot)
library(sjmisc)
library(sjlabelled)

urlTPE <- "https://raw.githubusercontent.com/mzwesley/2020s-econometrics-final/master/data/taipei.csv"
urlNTPC <- "https://raw.githubusercontent.com/mzwesley/2020s-econometrics-final/master/data/newtaipei.csv"
urlTAO <- "https://raw.githubusercontent.com/mzwesley/2020s-econometrics-final/master/data/taoyuan.csv"
urlTCC <- "https://raw.githubusercontent.com/mzwesley/2020s-econometrics-final/master/data/taichung.csv"
urlTNN <- "https://raw.githubusercontent.com/mzwesley/2020s-econometrics-final/master/data/tainan.csv"
urlKAO <- "https://raw.githubusercontent.com/mzwesley/2020s-econometrics-final/master/data/kaohsiung.csv"
urlHCC <- "https://raw.githubusercontent.com/mzwesley/2020s-econometrics-final/master/data/hsinchu_city.csv"
urlCHC <- "https://raw.githubusercontent.com/mzwesley/2020s-econometrics-final/master/data/changhua.csv"
urlKEE <- "https://raw.githubusercontent.com/mzwesley/2020s-econometrics-final/master/data/keelung.csv"
urlYIL <- "https://raw.githubusercontent.com/mzwesley/2020s-econometrics-final/master/data/yilan.csv"
urlTW <- "https://raw.githubusercontent.com/mzwesley/2020s-econometrics-final/master/data/data.csv"


dataTPE <- read.csv(urlTPE)
dataNTPC <- read.csv(urlNTPC)
dataTAO <- read.csv(urlTAO)
dataTCC <- read.csv(urlTCC)
dataTNN <- read.csv(urlTNN)
dataKAO <- read.csv(urlKAO)
dataHCC <- read.csv(urlHCC)
dataCHC <- read.csv(urlCHC)
dataKEE <- read.csv(urlKEE)
dataYIL <- read.csv(urlYIL)
dataTW <- read.csv(urlTW)

## join all data from different cities together
dataCities <- rbind(dataTPE, dataNTPC, dataTAO, dataTCC, dataTNN, dataKAO, dataHCC, dataCHC, dataKEE, dataYIL)

# same as paper + lowincome
modelp1 <- lm(debtpp ~ unem + revenuepp + socialwalfarepp + elecyr + party + unanimous + relation + expect + unem:elecyr + lowincomehh, data = dataCities)
summary(modelpl)

# add year dummies
modelp2 <- lm(debtpp ~ unem + revenuepp + socialwalfarepp + elecyr + party + unanimous + relation + expect + unem:elecyr + lowincomehh + y89 + y90 + y91 + y92 + y93 + y94 + y95 + y96 + y97 + y99 
           + y100 + y101 + y102 + y103 + y104 + y105 + y106 + y107, data = dataCities)
summary(modelp2)

# final model, add 
modelp3 <- lm(debtpp ~ unem + revenuepp + socialwalfarepp + elecyr + kmt + dpp + unanimous + relation + expect + unem:elecyr + lowincomehh + y89 + y90 + y91 + y92 + y93 + y94 + y95 + y96 + y97 + y99 
               + y100 + y101 + y102 + y103 + y104 + y105 + y106 + y107 + chc + hcc + tpe + ntpc + tao + tcc + tnn + kao + kee, data = dataCities)
summary(modelp3)


# regression table modelp1
tab_model(
  modelp1,
  dv.labels = c("First Model"),
  show.se = TRUE,
  p.style = "stars"
)

# regression table modelp2
tab_model(
  modelp2,
  dv.labels = c("Second Model"),
  show.se = TRUE,
  p.style = "stars"
)

# regression table modelp3
tab_model(
  modelp3,
  dv.labels = c("Final Model"),
  show.se = TRUE,
  terms = c("(Intercept)", "unem", "revenuepp", "socialwalfarepp", "elecyr", "kmt", "dpp", 
            "unanimous", "relation", "expect", "lowincomehh", "unem:elecyr"),
  p.style = "stars"
)
