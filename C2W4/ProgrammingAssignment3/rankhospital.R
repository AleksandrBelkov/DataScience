rankhospital <- function(state, outcome, num) {
  ##Read outcome data
  ##Check that state and outcome are valid
  ##Return hospital name in that state with the given rank
  ##30-day death rate
  
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
  
  if(num>nrow(result_data)) {
    return(NA)
  }
  
  ##Define result
  result_data<-subset(hospital_data,hospital_data[,7]==state)
  na_result<-result_data[complete.cases(result_data[,illness]),]
  
  ##Clear data for rank define
  if (illness == 11){
    clear_data<-na_result[,-c(1,3:10,12:46)]
  } else if (illness == 17) {
    clear_data<-na_result[,-c(1,3:16,18:46)]
  } else {
    clear_data<-na_result[,-c(1,3:22,24:46)]
  }
  
  clear_data1<-clear_data[,-2]
  clear_data2<-as.numeric(gsub(",",".",nn_result[,2]))
  end_data<-data.frame(Name = clear_data1, Illness = clear_data2)
  ord_data<-order(end_data$Illness)
    
  if (num == "worst"){
    illness <-11
  } else if (outcome == "heart failure") {
    illness<-17
  } else {
    illness<-23
  }
  
  
  ##result<-as.numeric(gsub(",",".",result_data[,illness]))
  
  ##na_result<-result[!is.na(result)]
  ##sort(na_result)
  
  best_data=min(na_result)
  
  best_hospital<-subset(result_data[,2],as.numeric(result_data[,illness])==best_data)
  
  
  return(sort(best_hospital))
}