library(ggplot2)

toronto_shelter_system_flow<-read.csv("toronto-shelter-system-flow.csv")
library(tidyverse)
toronto_shelter_system_flow_dec_23<-toronto_shelter_system_flow%>%
  filter(date.mmm.yy.=='Dec-23')
toronto_shelter_system_flow_dec_23_type<-toronto_shelter_system_flow_dec_23[,c(2:9)]

toronto_shelter_system_flow_dec_23_age<-toronto_shelter_system_flow_dec_23[,c(2:3,10:14)]


toronto_shelter_system_flow_dec_23_gender<-toronto_shelter_system_flow_dec_23[,c(2:3,15:17)]


toronto_shelter_system_flow_dec_23_population_group_percentage<-toronto_shelter_system_flow_dec_23[,c(2:3,18)]
knitr::kable(toronto_shelter_system_flow_dec_23_type)
knitr::kable(toronto_shelter_system_flow_dec_23_age)
knitr::kable(toronto_shelter_system_flow_dec_23_gender)
knitr::kable(toronto_shelter_system_flow_dec_23_population_group_percentage)
toronto_shelter_system_flow_dec_23_type_1<-toronto_shelter_system_flow_dec_23_type[,c(2:8)] %>%
  pivot_longer(!population_group, names_to = "type", values_to = "count")
write.csv(toronto_shelter_system_flow_dec_23_type_1,"toronto_shelter_system_flow_dec_23_type_1.csv")

toronto_shelter_system_flow_dec_23_type_1%>%
  filter(population_group=='All Population')%>%
  ggplot(aes(x=reorder(type,count),y=count,fill=type))+
  geom_bar(stat = 'identity')+
  labs(x="type")+
  coord_flip()
toronto_shelter_system_flow_dec_23_age_1<-toronto_shelter_system_flow_dec_23_age[,c(2:7)] %>%
  pivot_longer(!population_group, names_to = "age", values_to = "count")

write.csv(toronto_shelter_system_flow_dec_23_age_1,"toronto_shelter_system_flow_dec_23_age_1.csv")

toronto_shelter_system_flow_dec_23_age_1%>%
  filter(population_group=='All Population')%>%
  ggplot(aes(x=reorder(age,count),y=count,fill=age))+
  geom_bar(stat = 'identity')+
  labs(x="age")+
  coord_flip()

toronto_shelter_system_flow_dec_23_gender_1<-toronto_shelter_system_flow_dec_23_gender[,c(2:5)] %>%
  pivot_longer(!population_group, names_to = "gender", values_to = "count")
write.csv(toronto_shelter_system_flow_dec_23_gender_1,"toronto_shelter_system_flow_dec_23_gender_1.csv")


toronto_shelter_system_flow_dec_23_gender_1%>%
  filter(population_group=='All Population')%>%
  ggplot(aes(x=reorder(gender,count),y=count,fill=gender))+
  geom_bar(stat = 'identity')+
  labs(x="gender")+
  coord_flip()
toronto_shelter_system_flow_dec_23_population_group_percentage$population_group_percentage<-gsub("%","",toronto_shelter_system_flow_dec_23_population_group_percentage$population_group_percentage)
toronto_shelter_system_flow_dec_23_population_group_percentage$population_group_percentage<-as.numeric(toronto_shelter_system_flow_dec_23_population_group_percentage$population_group_percentage)

write.csv(toronto_shelter_system_flow_dec_23_population_group_percentage,"toronto_shelter_system_flow_dec_23_population_group_percentage.csv")

toronto_shelter_system_flow_dec_23_population_group_percentage%>%
  filter(population_group!='All Population')%>%
  ggplot(aes(x=population_group,y=population_group_percentage))+
  geom_bar(stat = 'identity',fill="steelblue")