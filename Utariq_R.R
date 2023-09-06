#' ---
#' author: "Nafisa Ahmed & Ubaid Tariq"

#' ---

#Load R libraries

library(tidyverse)
library(scales)

# Read in cvs file

NYLeadingCausesofDeath <- read.csv(file = "New_York_City_Leading_Causes_of_Death.csv",
                                   as.is = TRUE, header = TRUE)

#remove null/missing values from data set

NYLeadingCausesofDeath2 <- mutate(na.omit(NYLeadingCausesofDeath))

#setting scipen to make sure R does not use scientific notation for the axis.

options(scipen = 10L)

#What is the leading cause of death in New York City?

ggplot(data = NYLeadingCausesofDeath2, aes(x = Deaths, y = Leading.Cause)) +
    geom_bar(stat="identity", fill = "blue") +
    labs(title = "Leading Causes of Death in New York City",
         x = "Total Death Count",
         y = "Leading Cuases of Death")

#What is the leading cause of death among males and females in New York City?

ggplot(data = NYLeadingCausesofDeath2, aes(x = Deaths, y = Leading.Cause, fill = Sex)) +
    geom_bar(stat = "identity", position = position_dodge(), alpha=0.75) + 
    labs(title = "Leading Causes of Death in New York City by Sex/Gender",
         x = "Total Death Count",
         y ="Leading Causes of Death")

#Which Ethnicities had the most/least reported death counts in New York City?

ggplot(data = NYLeadingCausesofDeath2, aes(x = Race.Ethnicity, y = Deaths, fill = Race.Ethnicity)) +
    geom_bar(stat = "identity") +
    labs(title = "Highest/Least reported Deaths in New York City by Race/Ethnicity",
         x = "Race/Ethnicity",
         y = "Total Death Count")

#Were there specific causes of deaths that occurred only within specific ethnicities and not others?

ggplot(data = NYLeadingCausesofDeath2, aes(x = Deaths, y = Leading.Cause, fill = Race.Ethnicity)) +
    geom_bar(stat = "identity", position = position_dodge(), alpha=0.75) +
     labs(title = "Leading Causes of Death in New York City by Race/Ethnicity",
          x = "Total Death Count",
          y = "Leading Cause of Death")

#Have leading causes of death changed since 2007?

#converting Year variable into factor

NYLeadingCausesofDeath2$Year <- factor(NYLeadingCausesofDeath2$Year, 
                                       levels=c(2007, 2008, 2009, 2010, 2011, 2012, 
                                                2013, 2014, 2015, 2016, 2017, 
                                                2018, 2019, 2020))

ggplot(data = NYLeadingCausesofDeath2, aes(x = Deaths, y = Leading.Cause, fill = Year)) +
  geom_bar(stat = "identity", position = position_dodge(), alpha=0.75) +
  labs(title = "Changes in Leading Cause of Death Since 2007",
       x = "Total Death Count",
       y = "Leading Causes of Death")
