# Required libraries
library(dplyr)

# Load training data set
trainingDat <- read.csv(file = 'rocky.csv', header = TRUE)

# Remove the comment column
colCount <- length(colnames(trainingDat))
trainingDat <- trainingDat[,1:(colCount-1)]

# Show data
trainingDat

# Build regression model
lm1 <- lm(grade ~ ., data = trainingDat)

summary(lm1)

# Plot the "diagnostic residuals plots":
par(mfrow = c(1, 2))
#plot(lm1, which = 1)
plot(lm1, which = 2)
plot(lm1, which = 3)
#plot(lm1, which = 4)

# Predict!
predict(lm1, data.frame(titleScore=12.28, overviewScore=9.82, ratingScore=6.40))
predict(lm1, data.frame(titleScore=0, overviewScore=10.76, ratingScore=7.10))

