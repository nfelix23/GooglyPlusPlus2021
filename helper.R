
library(lubridate)
library(dplyr)

helper<- function(dir='.',odir=".",minMatches=50) {

  currDir= getwd()
  battingDetails=batsman=runs=strikeRate=matches=meanRuns=meanSR=battingDF=val=NULL
  teams <-c("Chennai Super Kings","Delhi Capitals", "Deccan Chargers","Delhi Daredevils",
            "Kings XI Punjab", 'Kochi Tuskers Kerala',"Kolkata Knight Riders",
            "Mumbai Indians", "Pune Warriors","Rajasthan Royals",
            "Royal Challengers Bangalore","Sunrisers Hyderabad","Gujarat Lions",
            "Rising Pune Supergiants")
  #Change dir
  setwd(odir)
  battingDF<-NULL
  for(team in teams){
    battingDetails <- NULL
    val <- paste(team,"-BattingDetails.RData",sep="")
    print(val)
    tryCatch(load(val),
             error = function(e) {
               print("No data1")
               setNext=TRUE
             }


    )
    details <- battingDetails
    battingDF <- rbind(battingDF,details)

  }

  maxDate= max(battingDF$date)
  minDate= min(battingDF$date)


  #a=battingDF %>% filter(date > as.Date("2018-02-01"))
  return(list(minDate,maxDate,battingDF))

}
