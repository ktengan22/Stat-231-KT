library(tidyverse)
library(robotstxt)
library(rvest) 
library(purrr) 
library(janitor)
library(knitr)

quotes_url <- "https://www.brainyquote.com/topics/funny-quotes_17"
robotstxt::paths_allowed(quotes_url)

quotes_html <- read_html(quotes_url)

quotes <- quotes_html %>%
  html_elements(".oncl_q") %>%
  html_text()

people <- quotes_html %>%
  html_elements(".oncl_a") %>%
  html_text()

funny_quotes <- tibble(person = people, quote = quotes) %>% 
  mutate(quote = str_remove_all(quote, "\n\n"),
         # Prep quotes for markdown display when `results = "asis"`
         display = paste0('> *"', as.character(quote), '"* --' , as.character(person)))

# outpath <- "/Users/tpkt/Desktop/College2021-2022/Stats231/Personal Repo/Stat-231-KT/ps5/data"
# write_csv(funny_quotes, paste0(outpath, "/quotes.csv"))
write_csv(funny_quotes, "data/quotes.csv")

