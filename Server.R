# data source: https://data.oecd.org/unemp/unemployment-rate.htm
library(googleVis)
suppressPackageStartupMessages(library(googleVis))
library(shiny)

#import data
data <- read.csv("datafile.csv",skip=8,header = TRUE)

#drop last columns which are not related to our problem
data <- data[,1:25] 
#keep years 2005 to 2014
data <- data[-c(2:15)]
#remove row 10 and 11 that do not represent any individual countries
data <- data[-c(10,11),]

#rename columns
colnames(data)<-c("Location",sapply(2005:2014,toString))

#drop nan values
data <- data[complete.cases(data),]

#create final data frame
new_data <- data.frame(matrix(ncol = 3, nrow = 10*nrow(data)))
colnames(new_data)<-c("Country","Year","Rate")
m <- 1
for (i in 1:nrow(data)){
    for (l in 2:ncol(data)){
        new_data$Country[m] <- toString(data[i,1])
        new_data$Year[m] <- 2003+l
        new_data$Rate[m] <- data[i,l]
        m <- m+1
    }
}

#create motion
Motion=gvisMotionChart(new_data,idvar="Country",timevar="Year",
                       options=list(state='{"colorOption":"_UNIQUE_COLOR","showTrails":false};'))

shinyServer(
    function(input, output) {
        output$view <- renderGvis({Motion})
    }
)