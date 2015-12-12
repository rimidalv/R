library(data.table)

if (!file.exists("data")) {
  dir.create("data")
}

camerasFile <- "./data/dataTable.csv"
if (!file.exists(camerasFile)) {
  fileUrl <-
    "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
  download.file(fileUrl, destfile = camerasFile, method = "curl")
}


DT = fread(camerasFile,header = T, sep = ",")
head(DT)

check <- function(y, t) {
  message(sprintf("Elapsed time: %.20f", t[3]))
  print(y)
}
#system.time({
#  rowMeans(DT)[DT$SEX == 1]; 
#  rowMeans(DT)[DT$SEX == 2]})
t <- system.time(y <- DT[,mean(pwgtp15),by = SEX])
check(y, t)
t <- system.time(y <- tapply(DT$pwgtp15,DT$SEX,mean))
check(y, t)
t <- system.time(y <- mean(DT$pwgtp15,by = DT$SEX))
check(y, t)
t <- system.time(y <- sapply(split(DT$pwgtp15,DT$SEX),mean))
check(y, t)
t <- system.time(y <- {mean(DT[DT$SEX == 1,]$pwgtp15); mean(DT[DT$SEX == 2,]$pwgtp15)})
check(y, t)




tables()