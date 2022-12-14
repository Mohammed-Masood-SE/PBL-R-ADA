setwd("C:\\Users\\moham\\Desktop\\PBL 2.0")
options(scipen=100000)

# 0-1 Knapsack Greedy
Greedy100 = read.csv("C:\\Users\\moham\\Desktop\\PBL 2.0\\DataSets\\01KnapSackGreedy\\100.csv")
plot(Greedy100$totalItems, Greedy100$ExecutionTime,type = "l",xlab="Total Items",ylab="Time (ms)",main="Greedy Knapsack With 100 Knapsack Size")

Greedy1000 = read.csv("C:\\Users\\moham\\Desktop\\PBL 2.0\\DataSets\\01KnapSackGreedy\\1000.csv")
plot(Greedy1000$totalItems, Greedy1000$ExecutionTime,type = "l",xlab="Total Items",ylab="Time (ms)",main="Greedy Knapsack With 1000 Knapsack Size")

Greedy5000 = read.csv("C:\\Users\\moham\\Desktop\\PBL 2.0\\DataSets\\01KnapSackGreedy\\5000.csv")
plot(Greedy5000$totalItems, Greedy5000$ExecutionTime,type = "l",xlab="Total Items",ylab="Time (ms)",main="Greedy Knapsack With 1000 Knapsack Size")

plot(1, type="n", xlab="Total Items",ylab="Time (ms)", xlim=c(0,5000), ylim=c(0,2),main="Comparison Between The 3 Different Knapsack Size")
points(Greedy100$totalItems,Greedy100$ExecutionTime,type="l",col="blue",lwd=2)
points(Greedy1000$totalItems,Greedy1000$ExecutionTime,type="l",col="green",lwd=2)
points(Greedy5000$totalItems,Greedy5000$ExecutionTime,type="l",col="red",lwd=2)
legend(x = "topright",cex=0.6,legend = c("100", "1000","5000"),fill = c("blue","green","red"))

testreports =t.test(Greedy100$ExecutionTime,Greedy1000$ExecutionTime)
testreports
testreports =t.test(Greedy100$ExecutionTime,Greedy5000$ExecutionTime)
testreports
testreports =t.test(Greedy1000$ExecutionTime,Greedy5000$ExecutionTime)
testreports

# 0-1 Knapsack Dynamic Programming
DP100 = read.csv("C:\\Users\\moham\\Desktop\\PBL 2.0\\DataSets\\01KnapsackDynamic\\100.csv")
plot(DP100$totalItems, DP100$ExecutionTime,type = "l",xlab="Total Items",ylab="Time (ms)",main="DynamicProgramming Knapsack With 100 Knapsack Size")

DP1000 = read.csv("C:\\Users\\moham\\Desktop\\PBL 2.0\\DataSets\\01KnapsackDynamic\\1000.csv")
plot(DP1000$totalItems, DP1000$ExecutionTime,type = "l",xlab="Total Items",ylab="Time (ms)",main="DynamicProgramming Knapsack With 1000 Knapsack Size")

DP5000 = read.csv("C:\\Users\\moham\\Desktop\\PBL 2.0\\DataSets\\01KnapsackDynamic\\5000.csv")
plot(DP5000$totalItems, DP5000$ExecutionTime,type = "l",xlab="Total Items",ylab="Time (ms)",main="DynamicProgramming Knapsack With 1000 Knapsack Size")

plot(1, type="n", xlab="Total Items",ylab="Time (ms)", xlim=c(0,5000), ylim=c(0,1000),main="Comparison Between The 3 Different Knapsack Size")
points(DP100$totalItems,DP100$ExecutionTime,type="l",col="blue",lwd=2)
points(DP1000$totalItems,DP1000$ExecutionTime,type="l",col="green",lwd=2)
points(DP5000$totalItems,DP5000$ExecutionTime,type="l",col="red",lwd=2)
legend(x = "topleft",cex=0.6,legend = c("100", "1000","5000"),fill = c("blue","green","red"))

testreports =t.test(DP100$ExecutionTime,DP1000$ExecutionTime)
testreports
testreports =t.test(DP100$ExecutionTime,DP5000$ExecutionTime)
testreports
testreports =t.test(DP1000$ExecutionTime,DP5000$ExecutionTime)
testreports


plot(1, type="n", xlab="Total Items",ylab="Time (ms)", xlim=c(0,5000), ylim=c(0,1000),main="Greedy VS DP")
points(DP5000$totalItems,DP5000$ExecutionTime,type="l",col="blue",lwd=2)
points(Greedy5000$totalItems,Greedy5000$ExecutionTime,type="l",col="green",lwd=2)
legend(x = "topleft",cex=0.6,legend = c("DP", "Greedy"),fill = c("blue","green"))

testreports =t.test(DP5000$ExecutionTime,Greedy5000$ExecutionTime)
testreports
