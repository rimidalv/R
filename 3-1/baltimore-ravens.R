fileUrl <- "http://espn.go.com/nfl/team/_/name/bal/baltimore-ravens"
doc <- htmlTreeParse(fileUrl, useInternal = TRUE)

scores <- xpathSApply(doc, "//li", xmlValue)
teams <- xpathSApply(doc, "//li[@class='team-name']", xmlValue)

scores
