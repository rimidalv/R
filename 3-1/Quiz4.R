library(XML)
library(RCurl)

fileUrlXml <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc <- xmlTreeParse(sub("s", "", fileUrlXml), useInternal = TRUE)
#doc <- xmlParse(xData)

teams <- xpathSApply(doc, c("//zipcode"), xmlValue)
length(teams[teams=="21231"])


#xpathSApply(rootNode, c("//name","//price"), xmlValue)