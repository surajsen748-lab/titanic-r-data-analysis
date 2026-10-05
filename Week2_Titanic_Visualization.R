
R version 3.2.2 (2015-08-14) -- "Fire Safety"
Copyright (C) 2015 The R Foundation for Statistical Computing
Platform: x86_64-w64-mingw32/x64 (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

  Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

[Previously saved workspace restored]

> # Week 2 - Data Visualization and Insight Communication
> 
> # Load Titanic dataset
> data <- read.csv(file.choose())
> 
> # View first 6 rows
> head(data)
  PassengerId Survived Pclass
1           1        0      3
2           2        1      1
3           3        1      3
4           4        1      1
5           5        0      3
6           6        0      3
                                                 Name    Sex Age SibSp Parch
1                             Braund, Mr. Owen Harris   male  22     1     0
2 Cumings, Mrs. John Bradley (Florence Briggs Thayer) female  38     1     0
3                              Heikkinen, Miss. Laina female  26     0     0
4        Futrelle, Mrs. Jacques Heath (Lily May Peel) female  35     1     0
5                            Allen, Mr. William Henry   male  35     0     0
6                                    Moran, Mr. James   male  NA     0     0
            Ticket    Fare Cabin Embarked
1        A/5 21171  7.2500              S
2         PC 17599 71.2833   C85        C
3 STON/O2. 3101282  7.9250              S
4           113803 53.1000  C123        S
5           373450  8.0500              S
6           330877  8.4583              Q
> 
> # Check dataset structure
> str(data)
'data.frame':   891 obs. of  12 variables:
 $ PassengerId: int  1 2 3 4 5 6 7 8 9 10 ...
 $ Survived   : int  0 1 1 1 0 0 0 0 1 1 ...
 $ Pclass     : int  3 1 3 1 3 3 1 3 3 2 ...
 $ Name       : Factor w/ 891 levels "Abbing, Mr. Anthony",..: 109 191 358 277 16 559 520 629 417 581 ...
 $ Sex        : Factor w/ 2 levels "female","male": 2 1 1 1 2 2 2 2 1 1 ...
 $ Age        : num  22 38 26 35 35 NA 54 2 27 14 ...
 $ SibSp      : int  1 1 0 1 0 0 0 3 0 1 ...
 $ Parch      : int  0 0 0 0 0 0 0 1 2 0 ...
 $ Ticket     : Factor w/ 681 levels "110152","110413",..: 524 597 670 50 473 276 86 396 345 133 ...
 $ Fare       : num  7.25 71.28 7.92 53.1 8.05 ...
 $ Cabin      : Factor w/ 148 levels "","A10","A14",..: 1 83 1 57 1 1 131 1 1 1 ...
 $ Embarked   : Factor w/ 4 levels "","C","Q","S": 4 2 4 4 4 3 4 4 4 2 ...
> # Visualization 1: Survival Count
> 
> barplot(
+   table(data$Survived),
+   main = "Titanic Survival Count",
+   xlab = "Survival Status (0 = No, 1 = Yes)",
+   ylab = "Number of Passengers"
+ )
> # Visualization 2: Gender-wise Survival
> 
> barplot(
+   table(data$Sex, data$Survived),
+   beside = TRUE,
+   main = "Gender-wise Survival",
+   xlab = "Survival Status (0 = No, 1 = Yes)",
+   ylab = "Number of Passengers",
+   legend.text = TRUE
+ )
> # Visualization 3: Age Distribution
> 
> hist(
+   data$Age,
+   main = "Age Distribution of Titanic Passengers",
+   xlab = "Age",
+   ylab = "Number of Passengers"
+ )
> # Visualization 4: Fare Distribution
> 
> hist(
+   data$Fare,
+   main = "Fare Distribution of Titanic Passengers",
+   xlab = "Fare",
+   ylab = "Number of Passengers"
+ )
> # Visualization 5: Age vs Fare Scatter Plot
> 
> plot(
+   data$Age,
+   data$Fare,
+   main = "Age vs Fare",
+   xlab = "Age",
+   ylab = "Fare",
+   pch = 19
+ )
> # Visualization 6: Passenger Class vs Survival
> 
> barplot(
+   table(data$Pclass, data$Survived),
+   beside = TRUE,
+   main = "Passenger Class vs Survival",
+   xlab = "Passenger Class",
+   ylab = "Number of Passengers",
+   legend.text = TRUE
+ )
> # Visualization 7: Fare by Survival Status
> 
> boxplot(
+   Fare ~ Survived,
+   data = data,
+   main = "Fare by Survival Status",
+   xlab = "Survival Status (0 = No, 1 = Yes)",
+   ylab = "Fare"
+ )
> # Visualization 8: Age Group vs Survival Rate
> 
> data$Age_Group <- cut(
+   data$Age,
+   breaks = c(0, 12, 18, 35, 60, Inf),
+   labels = c("Child", "Teenager", "Young Adult", "Adult", "Senior"),
+   include.lowest = TRUE
+ )
> 
> survival_rate <- aggregate(
+   Survived ~ Age_Group,
+   data = data,
+   FUN = mean
+ )
> 
> plot(
+   survival_rate$Age_Group,
+   survival_rate$Survived,
+   type = "o",
+   main = "Survival Rate by Age Group",
+   xlab = "Age Group",
+   ylab = "Survival Rate"
+ )
> # Step 11: Basic Summary for Visualization Insights
> 
> cat("Total Passengers:", nrow(data), "\n")
Total Passengers: 891 
> 
> cat("Survival Count:\n")
Survival Count:
> print(table(data$Survived))

  0   1 
549 342 
> 
> cat("Gender-wise Survival:\n")
Gender-wise Survival:
> print(table(data$Sex, data$Survived))
        
           0   1
  female  81 233
  male   468 109
> 
> cat("Passenger Class vs Survival:\n")
Passenger Class vs Survival:
> print(table(data$Pclass, data$Survived))
   
      0   1
  1  80 136
  2  97  87
  3 372 119
> 
> cat("Average Fare by Survival:\n")
Average Fare by Survival:
> print(aggregate(Fare ~ Survived, data = data, FUN = mean))
  Survived     Fare
1        0 22.11789
2        1 48.39541
> 
> # Step 12: Survival Percentage
> 
> survival_percentage <- prop.table(table(data$Survived)) * 100
> 
> print(survival_percentage)

       0        1 
61.61616 38.38384 
> save.image("C:\\Users\\Welcome\\Downloads\\Week2_Titanic_Visualization.R")
> 
