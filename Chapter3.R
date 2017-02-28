df = read.csv("data/Advertising.csv", colClasses=c('NULL', rep('numeric', 4)))
head(df)
tail(df)
summary(df)

lm1 = lm(Sales ~ ., data=df)
summary(lm1)

lm2 = lm(Sales ~ TV + Radio, data=df)
summary(lm2)

lm3 = lm(Sales ~ Radio + Newspaper, data=df)
summary(lm3)

lm.TV = lm(Sales ~ TV, data=df)
summary(lm.TV)

lm.Radio = lm(Sales ~ Radio, data=df)
summary(lm.Radio)

cor(df)