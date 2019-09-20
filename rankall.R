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
  if (!(outcome %in% out)){
    stop( 'invalid outcome')
  }
  
  ## Return hospital name in that state with the given rank
  ## 30-day death rate
  if (outcome %in% "heart attack") {
  order_worst <- function(x){ 
  x[order(x$State, x$Attack30DayMortality, x$Hospital, decreasing = c(TRUE, FALSE, FALSE)), ]
  }
order_best <- function(x){  
  x[order(x$State, x$Attack30DayMortality, x$Hospital), ]
}

if (num %in% "worst") {    
  f <-na.omit(attack)
  t <- split(f, f[2])
  o <- lapply(t, order_worst)
  done <- do.call(rbind, lapply(o, function(x) {x[1,1:3]}))
 done[,c(1,2)]
  }
else if (num %in% "best") {    
  f <-na.omit(attack)
  t <- split(f, f[2])
  o <- lapply(t, order_best)
  done <- do.call(rbind, lapply(o, function(x) {x[1,1:3]}))
  done[,c(1,2)]
}
else {
  f <-na.omit(attack)
  t <- split(f, f[2])
  o <- lapply(t, order_best)
  done <- do.call(rbind, lapply(o, function(x) {x[num,1:3]}))
  done[,c(1,2)]
  
}

}

else if (outcome %in% "heart failure") {
  order_worst <- function(x){ 
  x[order(x$State, x$Failure30DayMortality, x$Hospital, decreasing = c(TRUE, FALSE, FALSE)), ]
}
order_best <- function(x){  
  x[order(x$State, x$Failure30DayMortality, x$Hospital), ]}
  if (num %in% "worst") {    
    f <-na.omit(failure)
    t <- split(f, f[2])
    o <- lapply(t, order_worst)
    done <- do.call(rbind, lapply(o, function(x) {x[1,1:3]}))
    done[,c(1,2)]
  }
  else if (num %in% "best") {    
    f <-na.omit(failure)
    t <- split(f, f[2])
    o <- lapply(t, order_best)
    done <- do.call(rbind, lapply(o, function(x) {x[1,1:3]}))
    done[,c(1,2)]
  }
  else {
    f <-na.omit(failure)
    t <- split(f, f[2])
    o <- lapply(t, order_best)
    done <- do.call(rbind, lapply(o, function(x) {x[num,1:3]}))
    done[,c(1,2)]
  }
  
}

else if (outcome %in% "pneumonia") {
  order_worst <- function(x){ 
  x[order(x$State, x$Pneumonia30DayMoraltiy, x$Hospital, decreasing = c(TRUE, FALSE, FALSE)), ]
}
order_best <- function(x){  
  x[order(x$State, x$Pneumonia30DayMoraltiy, x$Hospital), ]
  if (num %in% "worst") {    
    f <-na.omit(pneumonia)
    t <- split(f, f[2])
    o <- lapply(t, order_worst)
    done <- do.call(rbind, lapply(o, function(x) {x[1,1:3]}))
    done[,c(1,2)]
  }
  else if (num %in% "best") {    
    f <-na.omit(pneumonia)
    t <- split(f, f[2])
    o <- lapply(t, order_best)
    done <- do.call(rbind, lapply(o, function(x) {x[1,1:3]}))
    done[,c(1,2)]
  }
  else {
    f <-na.omit(pneumonia)
    t <- split(f, f[2])
    o <- lapply(t, order_best)
    done <- do.call(rbind, lapply(o, function(x) {num[1,1:3]}))
    done[,c(1,2)]
  }
  
}
}
} 
head(rankall("heart attack", 20), 10)

tail(rankall("heart failure", "worst"), 3)

tail(rankall("heart failure"), 10) 
