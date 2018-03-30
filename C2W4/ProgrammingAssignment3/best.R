best <- function(state, outcome) {
  ##Read outcome data
  ##Check that state and outcome are valid
  ##Return hospital name in that state with lowest 30-day death
  ##rate
  
  ##read data file
  setwd("C:/GitHub/DataScience/DataScience/C2W4/ProgrammingAssignment3/")
  file_list<-as.character(list.files())
  hospital_data<-read.csv(file_list[4], na.strings="Not Available", stringsAsFactors = FALSE)
  
  ##Check of input parameters
  valid_outcomes<-c("heart attack", "heart failure", "pneumonia")
  illness<-c()
  if(!state %in% hospital_data$State) {
    stop("invalid state")
  } else if(!outcome %in% valid_outcomes) {
    stop("invalide outcome")
    
  } else {
      if (outcome == "heart attack"){
        illness <-11
      } else if (outcome == "heart failure") {
        illness<-17
      } else {
        illness<-23
      }
  }
  
  ##Define result
  result_data<-subset(hospital_data,hospital_data[,7]==state)
  
  result<-as.numeric(gsub(",",".",result_data[,illness]))
  
  na_result<-result[!is.na(result)]
  
  best_data=min(na_result)
  
  best_hospital<-subset(result_data[,2],as.numeric(result_data[,illness])==best_data)
  
  
  return(sort(best_hospital))
}