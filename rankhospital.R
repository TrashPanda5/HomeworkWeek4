rankhospital  <- function(state, outcome, num = "best") {
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

## Return hospital name in that state with the given rank
## 30-day death rate

if (outcome %in% "heart attack") {
  if (num %in% "worst") {
     f <-na.omit(attack)
     t <- split(f, f[2])
     o <- t[["MD"]]
     done <- o[order(o[2], o[3], o[1]), ]
    nr <-nrow(o)        
    done$Hospital.Name[nr]
      }
      else {
        f <-na.omit(attack)
        t <- split(f, f[2])
        o <- t[[state]]
        done <- o[order(o[2], o[3], o[1]), ]
        done$rank <- 1:nrow(done)
        x<- done[num,]
        x$Hospital.Name
      }
  }
else if (outcome %in% "heart failure") { 
  if (num %in% "worst") {
    f <-na.omit(failure)
    t <- split(f, f[2])
    o <- t[[state]]
    done <- o[order(o[2], o[3], o[1]), ]
    nr <-nrow(o)        
    done$Hospital.Name[nr]
  }
  else {
    f <-na.omit(failure)
    t <- split(f, f[2])
    o <- t[[state]]
    done <- o[order(o[2] , o[3],o[1]), ]
    done$rank <- 1:nrow(done)
    x<- done[num,]
    x$Hospital.Name
  }
}
else if (outcome %in% "pneumonia") { 
  if (num %in% "worst") {
    f <-na.omit(pneumonia)
    t <- split(f, f[2])
    o <- t[[state]]
    done <- o[order(o[2], o[3], o[1]), ]
    nr <-nrow(o)        
    done$Hospital.Name[nr]
  }
  else {
    f <-na.omit(pneumonia)
    t <- split(f, f[2])
    o <- t[[state]]
    done <- o[order(o[2] , o[3], o[1]), ]
    done$rank <- 1:nrow(done)
    x<- done[num,]
    x$Hospital.Name
}

}
}

rankhospital("TX", "heart failure", 4)

rankhospital("MD", "heart attack", "worst")

rankhospital("MN", "heart attack", 5000)

