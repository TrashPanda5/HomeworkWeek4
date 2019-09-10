# looking at data 
#ls() provides a list the variables in the workspace
# class() gives an overview of the structure of the data i.e data.frame
# dim() gives the rows and columns first row, then column
#nrow() and ncol() also provide this infromation 
#object.size() provides the size of the object
#names() provices the character vector of the columns
#head() previews the top of the dataset, first option is number of rows. #head(plants, 10) is the first 10 rows
#tail() is the same as head, but the bottom 
#summary() provides some summary information on each of the variables counts or summary statistics
# mean, median, quantiles, max and min for numeric and counts of each level for factor variables
# table(plants$Active_Growth_Period) provides the count for all the counts for factors in a variable
#str() provides information on the structure of the data, combining a lot of the features above
#read.csv() and read.table() read data into a default data.frame()

#simulation 
#sample takes a sample of the specified size from the elements of x using either with or without replacement.
#Simulate rolling four six-sided dice: sample(1:6, 4, replace = TRUE)
# sample(LETTTERs) lets you sample the alphabet 
# when you don't specify size, sample takes the size equal to the vector from which you are samplign 
# The following command will produce 100 flips of an unfair coin and assign the result: flips
# <- sample(c(0,1), 100, replace = TRUE, prob = c(0.3, 0.7))
# rbinom can produce random binmial variables 
# Each probability distribution in R has an r*** function (for "random"), a d*** function (for
# "density"), a p*** (for "probability"), and q*** (for "quantile"). We are most interested in
# the r*** functions in this lesson, but I encourage you to explore the others on
# we can generate a single random variable that represents the number of heads in 
#100 flips of our unfair coin using rbinom(1, size = 100,prob = 0.7).
#The standard normal distribution has mean 0 and standard deviation 1. As you can see under
# the 'Usage' section in the documentation, the default values for the 'mean' and 'sd'
# arguments to rnorm() are 0 and 1, respectively. Thus, rnorm(10) will generate 10 random
# numbers from a standard normal distribution. Give it a try.
#Now do the same, except with a mean of 100 and a standard deviation of 25.
# rnorm(10 , mean=100, sd= 25)
# Generate 5 random values from a Poisson distribution with mean 10. my_pois <- replicate(100, rpois(5, 10))
# replicate(100, rpois(5, 10)) to perform this operation 100 times.
# cm <- colMeans(my_pois) hist(cm)

#base graphics  
#plot(cars) gives the plot, if you don't tell, R tries to assume. Without names, it uses the variable names
# and uses default tick marks
#plot(x = cars$speed, y = cars$dist).
#Use plot() command to show speed on the x-axis and dist on the y-axis from the cars data frame. Use
#the form of the plot command in which vectors are explicitly passed in as arguments for x and y.
#To begin to explore the many other options, look at ?par
# while limiting the x-axis to 10 through 15.  (Use xlim = c(10, 15)
# You can also change the shape of the symbols in the plot. The help page for points (?points) provides
# the details.
#boxplot(), like many R functions, also takes a "formula" argument, generally an expression with a
#| tilde ("~") which indicates the relationship between the input variables. This allows you to enter
#| something like mpg ~ cyl to plot the relationship between cyl (number of cylinders) on the x-axis and
#| mpg (miles per gallon) on the y-axis.
#Use hist() with the vector mtcars$mpg to create a histogram.

#The best place to go from here is to
#| study the ggplot2 package. If you want to explore other elements of base graphics, then this web page
#| (http://www.ling.upenn.edu/~joseff/rstudy/week4.html) provides a useful overview.