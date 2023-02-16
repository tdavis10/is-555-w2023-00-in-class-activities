library(tidyverse)

algs <- read_csv('https://www.dropbox.com/s/qomjauiqxb8o4qd/kaggle_algoriths.csv?dl=1')


algs %>% count(current_title)
algs %>% count(ml_maturity)

algs %>% count(algorithm) %>% arrange(desc(n))

algs %>% 
  filter(current_title != "Student", current_title!='"Currently not employed') %>% 
  filter(!is.na(company_size)) %>% 
  distinct(id, current_title, company_size, ml_maturity, algorithm) %>% 
  ggplot(aes(x = algorithm, fill = algorithm)) +
  geom_bar()+
  theme_bw() +
  facet_grid(current_title ~ algorithm)
  

