library(readxl)
library(XML)


if (!file.exists("data")) {
  dir.create("data")
}

camerasFile <- "./data/cameras.csv"
if (!file.exists(camerasFile)) {
  fileUrl <-
    "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
  download.file(fileUrl, destfile = camerasFile, method = "curl")
}
list.files("./data")

dateDownloaded <- date()

cameraData <- read.table(camerasFile, sep = ",", header = T)
head(cameraData)


camerasFileXls <- "./data/cameras.xlsx"
if (!file.exists(camerasFileXls)) {
  fileUrlXls <-
    "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.xlsx?accessType=DOWNLOAD"
  download.file(fileUrlXls, destfile = camerasFileXls, method = "curl")
}
list.files("./data")


cameraDataXls <- read_excel(camerasFileXls, sheet=1)
head(cameraDataXls)

fileUrlXml <- "http://www.w3schools.com/xml/simple.xml"
doc <- xmlTreeParse(fileUrlXml, useInternal = TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)

names(rootNode)

rootNode[[1]]
rootNode[[1]][[1]]

xpathSApply(rootNode, c("//name","//price"), xmlValue)




