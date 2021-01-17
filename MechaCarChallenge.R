### Perform Summary Analysis on MechaCar dataset

library(dplyr)

mpg_data <- read.csv("./Resources/MechaCar_mpg.csv") # import mpg file

lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = mpg_data) # create a multiple linear regression model
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = mpg_data)) # summarize the linear regression model


### Perform Summary Analysis on suspension coil dataset


suspension_data <- read.csv("./Resources/Suspension_Coil.csv",stringsAsFactors = F, ccheck.names = F)
lot_summary <- suspension_data %>% group_by(Manufacturing_Lot) %>%
  summarise(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI))

total_summary <- suspension_data %>%
  summarise(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI))



### Suspension Coil T-Tests

# Lot 1
t.test(subset(suspension_data,Manufacturing_Lot=="Lot1")$PSI,mu = 1500)

# Lot 2
t.test(subset(suspension_data,Manufacturing_Lot=="Lot2")$PSI,mu = 1500)

# Lot 3
t.test(subset(suspension_data,Manufacturing_Lot=="Lot3")$PSI,mu = 1500)

# Across all Lots
t.test(suspension_data$PSI,mu = 1500)
