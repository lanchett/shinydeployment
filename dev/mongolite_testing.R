library(tidyverse)
library(mongolite)
url = "url" #Add real URL here

OpenCon<- mongo(url = url)
CON_movie <- mongo("test", db = "testing",url=url)

con$drop()         #Refresh the collection
con$count()

CON_movie$count()
CON_movie$disconnect()
CON_movie$count()



# testing -----------------------------------------------------------------

con <- mongo(collection = "tests", db ="testings", url= url)

con$drop()         #Refresh the collection
con$count()
con$insert(data.frame(A="test", be = "test", c ="test"))
mydata <- con$find()

con <- mongo(collection = "drinkathon", db ="drinks", url= url)
con$insert(data.frame(A="test", be = "test", c ="test"))
mydata <- con$find()

data <- mydata %>%  group_by(Drink)  %>%  summarise(Antall = n()) %>% 
  fct_reorder(Drink, Antall)




library(ggplot2)

data %>% ggplot(., aes(x= fct_reorder(Drink, Antall), y=Antall, fill=Drink, label = Antall)) + 
  geom_bar(position = 'dodge', stat='identity') +
  geom_label() +
  theme_grey() +
  coord_flip() +
  ggtitle("Drink popularitet")  +
  ylab("Drink") +
  xlab("Antall") 
