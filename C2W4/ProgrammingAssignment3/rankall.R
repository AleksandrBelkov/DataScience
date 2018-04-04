rankall <- function(outcome, num = "best") {
  ##Read outcome data
  ##Check that state and outcome are valid
  ##For each state, find the hospital of the given rank
  ##Return a data frame with the hospital names and the
  ##(abbreviated) state name
  
  ##read data file
  setwd("C:/GitHub/DataScience/DataScience/C2W4/ProgrammingAssignment3/")
  file_list<-as.character(list.files())
  hospital_data<-read.csv(file_list[4], na.strings="Not Available", stringsAsFactors = FALSE)
  
  ##Check of input parameters
  valid_outcomes<-c("heart attack", "heart failure", "pneumonia")
  illness<-c()
  if(!outcome %in% valid_outcomes) {
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
  state_list<-sort(unique(hospital_data$State))
  cursor<-data.frame(hospital=character(0), state=character(0), stringsAsFactors = FALSE)
  
  for (i in 1:length(state_list)) {
    result_data<-subset(hospital_data,hospital_data[,7]==state_list[i])
    na_result<-result_data[complete.cases(result_data[,illness]),]
  
  
    if(num>nrow(na_result)) {
      if (num == "best") {
        final_index<-1
      } else if (num == "worst"){
        final_index <-nrow(na_result)
      } else {
        final_index<-"None"
      } 
    } else {  
      final_index<-num
    }
  
  
    if (final_index == "None") {
      cursor[i,1]<-"NA"
      cursor[i,2]<-state_list[i]
    } else {
      ##Clear data for rank define
      if (illness == 11){
        clear_data<-na_result[,-c(1,3:10,12:46)]
      } else if (illness == 17) {
        clear_data<-na_result[,-c(1,3:16,18:46)]
      } else {
        clear_data<-na_result[,-c(1,3:22,24:46)]
      }
      
          
        clear_data1<-clear_data[,-2]
        clear_data2<-as.numeric(gsub(",",".",clear_data[,2]))
        end_data<-data.frame(Name = clear_data1, Illness = clear_data2, stringsAsFactors = FALSE)
        ord_data<-end_data[order(end_data$Illness,end_data$Name),]
        cursor[i,1]<-ord_data[final_index,1]
        cursor[i,2]<-state_list[i]
    }
  }
  return(cursor)
}