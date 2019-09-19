rankall  <- function(outcome, num = "best") {
  ## Read outcome data
  initial <- read.csv("outcome-of-care-measures.csv", na.strings="Not Available", stringsAsFactors=FALSE)
  colnames(initial)[colnames(initial)=="Hospital.Name"]  <- c("Hospital")
  colnames(initial)[colnames(initial)=="Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"] <-c( "Attack30DayMortality")
  colnames(initial)[colnames(initial)=="Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"] <-c( "Failure30DayMortality")
  colnames(initial)[colnames(initial)=="Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"] <-c( "Pneumonia30DayMoraltiy")

  attack <- initial[,c(2,7,11)] 
  failure <- initial[,c(2,7,17)] 
  pneumonia <- initial[,c(2,7,23)] 
  out <- c("heart attack", "heart failure", "pneumonia")
  
  ## Check that state and outcome are valid
  if(!(state %in% initial$State) && !(outcome %in% out)){
    stop('invalid state and outcome')
  }
  else if (!(state %in% initial$State)){
    stop('invalid state' )
  }
  else if (!(outcome %in% out)){
    stop( 'invalid outcome')
  }
  
  ## Return hospital name in that state with the given rank
  ## 30-day death rate
order_worst <- function(x){ 
  x[order(x$State, x$Attack30DayMortality, x$Hospital, decreasing = c(TRUE, FALSE, FALSE)), ]
  }
order_best <- function(x){  
  x[order(x$State, x$Attack30DayMortality, x$Hospital), ]
}
first <- function(x){
  s <- x[1]
  
}  
if (num %in% "worst") {    
  f <-na.omit(attack)
  t <- split(f, f[2])
  o <- lapply(t, order_worst)
  done <- lapply(unlist( o, recursive = FALSE), function(x) x[[1]])
  done
  }
else if (num %in% "best") {    
  f <-na.omit(attack)
  t <- split(f, f[2])
o <- sapply(t, first)

}
f<-c(t$WY$Hospital, t$WY$Attack30DayMortality)
f
