
source('setup_data.R', echo = TRUE);




###
### Worksheet Exercise 1.1
###

class(AP.ts);
str(AP.ts);

start(AP.ts); end(AP.ts); frequency(AP.ts);

plot(AP.ts, ylab = "Air Passengers (\'000s)");


### Using ggplot2 looks better, but you have to work hard for the
### labels on the x-axis so I am leaving this out for now.

#qplot(1:length(AP.ts), as.vector(AP.ts), geom = 'line', ylab = 'Air Passengers (\'000s)');


###
### Worksheet Exercise 1.2
###

class(MA.month.ts);
str(MA.month.ts);

start(MA.month.ts); end(MA.month.ts); frequency(MA.month.ts);

plot(MA.month.ts, ylab = "Unemployment data for the state of Maine");


### Using ggplot2 looks better, but you have to work hard for the
### labels on the x-axis so I am leaving this out for now.

#qplot(1:length(MA.month.ts), as.vector(MA.month.ts), geom = 'line', ylab = 'Unemployment data for the state of Maine');


###
### Worksheet Exercise 1.3
###

### We are going to aggregate over the years, and extract the cycles
AP.year.ts  <- aggregate(AP.ts);
AP.cycle.ts <- cycle(AP.ts);


### We are going to stack the two plots together
layout(1:2)
plot(AP.year.ts)
boxplot(AP.ts ~ AP.cycle.ts)


### Create a plot in ggplot2

#plot1 <- qplot(start(AP.year.ts)[1]:end(AP.year.ts)[1], as.vector(AP.year.ts), geom = 'line', xlab = 'Year', ylab = 'Yearly Aggregates')
#plot2 <- qplot(cycle, AP, data = data.frame(cycle = as.factor(AP.cycle.ts), AP = as.vector(AP.ts)), geom = 'boxplot', xlab = 'Month', ylab = 'Passengers');

#grid.arrange(plot1, plot2);


###
### Worksheet Exercise 1.4
###

### We are going to aggregate over the years, and extract the cycles
MA.year.ts  <- aggregate(MA.month.ts);
MA.cycle.ts <- cycle(MA.month.ts);


### We are going to stack the two plots together
layout(1:2)
plot(MA.year.ts)
boxplot(MA.month.ts ~ MA.cycle.ts)


### Create a plot in ggplot2

#plot1 <- qplot(start(MA.year.ts)[1]:end(MA.year.ts)[1], as.vector(MA.year.ts), geom = 'line', xlab = 'Year', ylab = 'Yearly Aggregates')
#plot2 <- qplot(MA.cycle.ts, MA.month.ts, data = data.frame(cycle = as.factor(MA.cycle.ts), MA = as.vector(MA.month.ts)), geom = 'boxplot', xlab = 'Month', ylab = 'Passengers');

#grid.arrange(plot1, plot2);


###
### Worksheet Exercise 1.5
###

MA.year.ts        <- aggregate(MA.month.ts);
MA.annual.mean.ts <- MA.year.ts / 12;


layout(1:2)
plot(MA.month.ts,       ylab = "unemployed (%)")
plot(MA.annual.mean.ts, ylab = "unemployed (%)")


### We can also plot this in ggplot2
MA.month.vec       <- as.vector(MA.month.ts);
MA.annual.mean.vec <- as.vector(MA.annual.mean.ts);


qplot(1:length(MA.month.vec), MA.month.vec, geom = 'line', colour = I('red')) +
    geom_line(aes(x = -6 + (1:length(MA.annual.mean.vec)) * 12, y = MA.annual.mean.vec), colour = 'blue');


###
### Worksheet Exercise 1.6
###

MA.02.ts <- window(MA.month.ts, start = c(1996, 2), freq = TRUE);
MA.08.ts <- window(MA.month.ts, start = c(1996, 8), freq = TRUE);

head(MA.02.ts); tail(MA.02.ts);

str(MA.02.ts);


Feb.ratio <- mean(MA.02.ts) / mean(MA.month.ts);
Feb.ratio

Aug.ratio <- mean(MA.08.ts) / mean(MA.month.ts);
Aug.ratio
