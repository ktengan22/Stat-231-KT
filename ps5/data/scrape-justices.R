library(tidyverse)
library(robotstxt)
library(rvest) 
library(purrr) 
library(janitor)
library(knitr)

url <- "https://en.wikipedia.org/wiki/List_of_justices_of_the_Supreme_Court_of_the_United_States"

tables <- url %>% 
  read_html() %>% 
  html_elements("table")
#pluck the html table
scj <- html_table(tables[[2]], fill = TRUE) %>%  
  #clean the names
  janitor::clean_names() 
#create an object for outpath
# outpath <- "/Users/tpkt/Desktop/College2021-2022/Stats231/Personal Repo/Stat-231-KT/ps5/data"
#write the csv file pulling scj table and paste0 combines outpath with writecsv
# write_csv(scj, paste0(outpath, "/justices.csv"))
write_csv(scj, "data/justices.csv")
