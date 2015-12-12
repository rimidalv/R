fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileUrl, destfile="./Q1Q5.csv",method="curl")
data<-read.csv("Q1Q5.csv")
DT<-data.frame(data)
file<-tempfile()
write.table(DT,file=file,row.names=FALSE,col.names=TRUE)
system.time(fread(file))
system.time(read.table(file,header=TRUE))
DT<-fread("Q1Q5.csv")

#A
st = proc.time()
for (i in 1:1000){
  sapply(split(DT$pwgtp15,DT$SEX),mean)
}
print (proc.time() - st)

#B
#st = proc.time()
#for (i in 1:100){
#  rowMeans(DT)[DT$SEX==1];rowMeans(DT)[DT$SEX==2]
#}
#print (proc.time() - st)

#C
st = proc.time()
for (i in 1:1000){
  mean(DT$pwgtp15,by=DT$SEX)
}
print (proc.time() - st)

#D
st = proc.time()
for (i in 1:1000){
  tapply(DT$pwgtp15,DT$SEX,mean)
}
print (proc.time() - st)

#E
st = proc.time()
for (i in 1:1000){
  mean(DT[DT$SEX==1,]$pwgtp15);mean(DT[DT$SEX==2,]$pwgtp15)
}
print (proc.time() - st)

#F
st = proc.time()
for (i in 1:1000){
  DT[,mean(pwgtp15),by=SEX]
}
print (proc.time() - st)