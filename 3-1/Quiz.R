#Question 1
if (!file.exists("data")) {
  dir.create("data")
}

camerasFile <- "./data/data.csv"
if (!file.exists(camerasFile)) {
  fileUrl <-
    "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
  download.file(fileUrl, destfile = camerasFile, method = "curl")
}

cameraData <- read.csv(camerasFile)
#head(cameraData)

data24 <- cameraData[,c("VAL")]
#data24Bool <- cameraData[cameraData$VAL == 24,]

dataClear <- complete.cases(data24)
data24Clear <- data24[dataClear]
length(data24Clear[data24Clear == 24])
#million <- cameraData$VAL[[]]