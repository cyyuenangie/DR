# Kaggle - Digital Recognizer

library(randomForest)
library(readr)


train <- read_csv("~/GIT/DR/train.csv")
test <- read_csv("~/GIT/DR/test.csv")

set.seed(0)

numTrain <- 10000
numTest <- 5000
numTrees <- 25

rowtrain <- sample(1:nrow(train), numTrain)
rowtest <- sample(1:nrow(train), numTest)

train_y<- as.factor(train[rowtrain,1])
train_x <- train[rowtrain,-1]

test_y <- as.factor(train[rowtest,1])
test_x <- train[rowtest,-1]

rf <- randomForest(train_x,train_y , xtest=test_x, ntree=numTrees)
predictions <- data.frame(ImageId=1:nrow(test_x), Label=levels(labels)[rf$test$predicted])
head(predictions)

write_csv(predictions, "rf_benchmark.csv") 