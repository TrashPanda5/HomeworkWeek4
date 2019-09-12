best <- function(state, outcome) {
  ## Read outcome data
  initial <- read.csv("outcome-of-care-measures.csv", na.strings="Not Available", stringsAsFactors=FALSE)
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
  
  ## Return hospital name in that state with lowest 30-day death
  ## rate
  if (outcome %in% "heart attack") { 
    f <-na.omit(attack)
    t <- split(f, f[2])
    o <- t[[state]]
    done <- o[order(o[2] , o[3], o[1]), ]
    done$Hospital.Name[1]
  }
  else if (outcome %in% "heart failure") { 
    f <-na.omit(failure)
    t <- split(f, f[2])
    o <- t[[state]]
    done <- o[order(o[2] , o[3], o[1]), ]
    done$Hospital.Name[1]
  }
  else if (outcome %in% "pneumonia") { 
    f <-na.omit(pneumonia)
    t <- split(f, f[2])
    o <- t[[state]]
    done <- o[order(o[2] , o[3], o[1]), ]
    done$Hospital.Name[1]
  }
  
}

best("TX", "heart attack")
best("TX", "heart failure")
best("MD", "heart attack")
best("MD", "pneumonia")
best("BB", "heart attack")
best("NY", "hert attack")
