
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

> data <- read.csv(file.choose())
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
> dim(data)
[1] 891  12
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
> summary(data)
  PassengerId       Survived          Pclass     
 Min.   :  1.0   Min.   :0.0000   Min.   :1.000  
 1st Qu.:223.5   1st Qu.:0.0000   1st Qu.:2.000  
 Median :446.0   Median :0.0000   Median :3.000  
 Mean   :446.0   Mean   :0.3838   Mean   :2.309  
 3rd Qu.:668.5   3rd Qu.:1.0000   3rd Qu.:3.000  
 Max.   :891.0   Max.   :1.0000   Max.   :3.000  
                                                 
                                    Name         Sex           Age       
 Abbing, Mr. Anthony                  :  1   female:314   Min.   : 0.42  
 Abbott, Mr. Rossmore Edward          :  1   male  :577   1st Qu.:20.12  
 Abbott, Mrs. Stanton (Rosa Hunt)     :  1                Median :28.00  
 Abelson, Mr. Samuel                  :  1                Mean   :29.70  
 Abelson, Mrs. Samuel (Hannah Wizosky):  1                3rd Qu.:38.00  
 Adahl, Mr. Mauritz Nils Martin       :  1                Max.   :80.00  
 (Other)                              :885                NA's   :177    
     SibSp           Parch             Ticket         Fare       
 Min.   :0.000   Min.   :0.0000   1601    :  7   Min.   :  0.00  
 1st Qu.:0.000   1st Qu.:0.0000   347082  :  7   1st Qu.:  7.91  
 Median :0.000   Median :0.0000   CA. 2343:  7   Median : 14.45  
 Mean   :0.523   Mean   :0.3816   3101295 :  6   Mean   : 32.20  
 3rd Qu.:1.000   3rd Qu.:0.0000   347088  :  6   3rd Qu.: 31.00  
 Max.   :8.000   Max.   :6.0000   CA 2144 :  6   Max.   :512.33  
                                  (Other) :852                   
         Cabin     Embarked
            :687    :  2   
 B96 B98    :  4   C:168   
 C23 C25 C27:  4   Q: 77   
 G6         :  4   S:644   
 C22 C26    :  3           
 D          :  3           
 (Other)    :186           
> colSums(is.na(data))
PassengerId    Survived      Pclass        Name         Sex         Age 
          0           0           0           0           0         177 
      SibSp       Parch      Ticket        Fare       Cabin    Embarked 
          0           0           0           0           0           0 
> data$Age[is.na(data$Age)] <- median(data$Age, na.rm = TRUE)
> data$Embarked[is.na(data$Embarked)] <- "Unknown"
Warning message:
In `[<-.factor`(`*tmp*`, is.na(data$Embarked), value = c(4L, 2L,  :
  invalid factor level, NA generated
> data$Cabin <- NULL
> colSums(is.na(data))
PassengerId    Survived      Pclass        Name         Sex         Age 
          0           0           0           0           0           0 
      SibSp       Parch      Ticket        Fare    Embarked 
          0           0           0           0           0 
> sum(duplicated(data))
[1] 0
> boxplot(data$Fare,
+         main = "Fare Outlier Detection",
+         ylab = "Fare")
> boxplot(data$Age,
+         main = "Age Outlier Detection",
+         ylab = "Age")
> Q1_Fare <- quantile(data$Fare, 0.25, na.rm = TRUE)
> Q3_Fare <- quantile(data$Fare, 0.75, na.rm = TRUE)
> 
> IQR_Fare <- Q3_Fare - Q1_Fare
> 
> Lower_Fare <- Q1_Fare - 1.5 * IQR_Fare
> Upper_Fare <- Q3_Fare + 1.5 * IQR_Fare
> 
> Fare_Outliers <- data[data$Fare < Lower_Fare | data$Fare > Upper_Fare, ]
> 
> nrow(Fare_Outliers)
[1] 116
> summary(Fare_Outliers$Fare)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  66.60   78.19   90.00  128.30  147.80  512.30 
> data$Fare_Normalized <- (data$Fare - min(data$Fare, na.rm = TRUE)) /
+                         (max(data$Fare, na.rm = TRUE) - min(data$Fare, na.rm = TRUE))
> 
> summary(data$Fare_Normalized)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
0.00000 0.01544 0.02821 0.06286 0.06051 1.00000 
> data$Sex_Encoded <- ifelse(data$Sex == "male", 1, 0)
> 
> table(data$Sex_Encoded)

  0   1 
314 577 
> data$Embarked_Encoded <- as.numeric(as.factor(data$Embarked))
> 
> table(data$Embarked_Encoded)

  1   2   3   4 
  2 168  77 644 
> str(data)
'data.frame':   891 obs. of  14 variables:
 $ PassengerId     : int  1 2 3 4 5 6 7 8 9 10 ...
 $ Survived        : int  0 1 1 1 0 0 0 0 1 1 ...
 $ Pclass          : int  3 1 3 1 3 3 1 3 3 2 ...
 $ Name            : Factor w/ 891 levels "Abbing, Mr. Anthony",..: 109 191 358 277 16 559 520 629 417 581 ...
 $ Sex             : Factor w/ 2 levels "female","male": 2 1 1 1 2 2 2 2 1 1 ...
 $ Age             : num  22 38 26 35 35 28 54 2 27 14 ...
 $ SibSp           : int  1 1 0 1 0 0 0 3 0 1 ...
 $ Parch           : int  0 0 0 0 0 0 0 1 2 0 ...
 $ Ticket          : Factor w/ 681 levels "110152","110413",..: 524 597 670 50 473 276 86 396 345 133 ...
 $ Fare            : num  7.25 71.28 7.92 53.1 8.05 ...
 $ Embarked        : Factor w/ 4 levels "","C","Q","S": 4 2 4 4 4 3 4 4 4 2 ...
 $ Fare_Normalized : num  0.0142 0.1391 0.0155 0.1036 0.0157 ...
 $ Sex_Encoded     : num  1 0 0 0 1 1 1 1 0 0 ...
 $ Embarked_Encoded: num  4 2 4 4 4 3 4 4 4 2 ...
> summary(data)
  PassengerId       Survived          Pclass     
 Min.   :  1.0   Min.   :0.0000   Min.   :1.000  
 1st Qu.:223.5   1st Qu.:0.0000   1st Qu.:2.000  
 Median :446.0   Median :0.0000   Median :3.000  
 Mean   :446.0   Mean   :0.3838   Mean   :2.309  
 3rd Qu.:668.5   3rd Qu.:1.0000   3rd Qu.:3.000  
 Max.   :891.0   Max.   :1.0000   Max.   :3.000  
                                                 
                                    Name         Sex           Age       
 Abbing, Mr. Anthony                  :  1   female:314   Min.   : 0.42  
 Abbott, Mr. Rossmore Edward          :  1   male  :577   1st Qu.:22.00  
 Abbott, Mrs. Stanton (Rosa Hunt)     :  1                Median :28.00  
 Abelson, Mr. Samuel                  :  1                Mean   :29.36  
 Abelson, Mrs. Samuel (Hannah Wizosky):  1                3rd Qu.:35.00  
 Adahl, Mr. Mauritz Nils Martin       :  1                Max.   :80.00  
 (Other)                              :885                               
     SibSp           Parch             Ticket         Fare        Embarked
 Min.   :0.000   Min.   :0.0000   1601    :  7   Min.   :  0.00    :  2   
 1st Qu.:0.000   1st Qu.:0.0000   347082  :  7   1st Qu.:  7.91   C:168   
 Median :0.000   Median :0.0000   CA. 2343:  7   Median : 14.45   Q: 77   
 Mean   :0.523   Mean   :0.3816   3101295 :  6   Mean   : 32.20   S:644   
 3rd Qu.:1.000   3rd Qu.:0.0000   347088  :  6   3rd Qu.: 31.00           
 Max.   :8.000   Max.   :6.0000   CA 2144 :  6   Max.   :512.33           
                                  (Other) :852                            
 Fare_Normalized    Sex_Encoded     Embarked_Encoded
 Min.   :0.00000   Min.   :0.0000   Min.   :1.00    
 1st Qu.:0.01544   1st Qu.:0.0000   1st Qu.:3.00    
 Median :0.02821   Median :1.0000   Median :4.00    
 Mean   :0.06286   Mean   :0.6476   Mean   :3.53    
 3rd Qu.:0.06051   3rd Qu.:1.0000   3rd Qu.:4.00    
 Max.   :1.00000   Max.   :1.0000   Max.   :4.00    
                                                    
> hist(data$Age,
+      main = "Age Distribution",
+      xlab = "Age",
+      ylab = "Number of Passengers")
> barplot(table(data$Survived),
+         main = "Survival Count",
+         xlab = "Survived (0 = No, 1 = Yes)",
+         ylab = "Number of Passengers")
> hist(data$Fare,
+      main = "Fare Distribution",
+      xlab = "Fare",
+      ylab = "Number of Passengers")
> barplot(table(data$Sex, data$Survived),
+         beside = TRUE,
+         main = "Gender-wise Survival",
+         xlab = "Gender",
+         ylab = "Number of Passengers",
+         legend = TRUE)
> numeric_data <- data[, c("Age", "Fare", "SibSp", "Parch", "Survived")]
> 
> cor(numeric_data, use = "complete.obs")
                 Age       Fare      SibSp       Parch    Survived
Age       1.00000000 0.09668842 -0.2332963 -0.17248195 -0.06491042
Fare      0.09668842 1.00000000  0.1596510  0.21622494  0.25730652
SibSp    -0.23329633 0.15965104  1.0000000  0.41483770 -0.03532250
Parch    -0.17248195 0.21622494  0.4148377  1.00000000  0.08162941
Survived -0.06491042 0.25730652 -0.0353225  0.08162941  1.00000000
> mean(data$Age, na.rm = TRUE)
[1] 29.36158
> median(data$Age, na.rm = TRUE)
[1] 28
> sd(data$Age, na.rm = TRUE)
[1] 13.0197
> 
> mean(data$Fare, na.rm = TRUE)
[1] 32.20421
> median(data$Fare, na.rm = TRUE)
[1] 14.4542
> sd(data$Fare, na.rm = TRUE)
[1] 49.69343
> colSums(is.na(data))
     PassengerId         Survived           Pclass             Name 
               0                0                0                0 
             Sex              Age            SibSp            Parch 
               0                0                0                0 
          Ticket             Fare         Embarked  Fare_Normalized 
               0                0                0                0 
     Sex_Encoded Embarked_Encoded 
               0                0 
> sum(duplicated(data))
[1] 0
> nrow(Fare_Outliers)
[1] 116
> summary(data$Fare_Normalized)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
0.00000 0.01544 0.02821 0.06286 0.06051 1.00000 
> table(data$Sex_Encoded)

  0   1 
314 577 
> table(data$Embarked_Encoded)

  1   2   3   4 
  2 168  77 644 
> 
