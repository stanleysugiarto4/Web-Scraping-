library(rvest)
library(tidyverse)


URL <- "http://www.sfu.ca/~haoluns/forecast.html"
page <- read_html(URL)


Period <- page %>% html_elements(".period-name") %>% html_text2() %>% str_remove("\n\n") %>% str_replace("\n", " ")
Period


short_dec <- page %>% html_elements(".short-desc") %>% html_text2() %>% str_replace_all("\n", " ")
short_dec

temp <- page %>% html_elements(".temp") %>% html_text2()
temp

tbl = tibble(period = Period,
       short_desc = short_dec,
       temp = temp
         )


write.table(tbl,"301605246.csv", sep = ",", row.names = F, col.names = F)
