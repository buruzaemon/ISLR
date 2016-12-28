Advertising = read.csv("data/Advertising.csv")
colnames(Advertising)
head(Advertising)
tail(Advertising)
summary(Advertising)

Advertising = subset(Advertising, select=c(TV, Radio, Newspaper, Sales))
colnames(Advertising)
head(Advertising)
tail(Advertising)
summary(Advertising)

par(mfrow=c(1,3))
plot(Advertising$TV, Advertising$Sales,
     xlab="TV", ylab="Sales",
     pch=1, 
     col="indianred",
     cex=1.5)
abline(lm(Advertising$Sales ~ Advertising$TV),
     lwd=2.5,
     col="dodgerblue4")
plot(Advertising$Radio, Advertising$Sales,
     xlab="Radio", ylab="Sales",
     pch=1, 
     col="indianred",
     cex=1.5)
abline(lm(Advertising$Sales ~ Advertising$Radio),
     lwd=2.5,
     col="dodgerblue4")
plot(Advertising$Newspaper, Advertising$Sales,
     xlab="Newspaper", ylab="Sales",
     pch=1, 
     col="indianred",
     cex=1.5)
abline(lm(Advertising$Sales ~ Advertising$Newspaper),
     lwd=2.5,
     col="dodgerblue4")
title("Figure 2.1: Advertising",
      outer=TRUE)
