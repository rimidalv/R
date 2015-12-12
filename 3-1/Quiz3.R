
library("xlsx")

camerasFileXls <- "./data/data.xlsx"
if (!file.exists(camerasFileXls)) {
  fileUrlXls <-
    "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
  download.file(fileUrlXls, destfile = camerasFileXls, method = "curl")
}
list.files("./data")

#excel.file <- file.path(camerasFileXls)
#dat <- readWorksheetFromFile(excel.file, sheet=1)
dat <- read.xlsx(camerasFileXls, sheetIndex = 1, header = T,startRow = 18, endRow = 23,)
dat <- dat[,7:15]

dat$Zip
datSum = dat$Zip*dat$Ext

datSum
sum(datSum,na.rm=T) 