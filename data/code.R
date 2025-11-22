library(tidyverse)
read_csv("data/all_people.csv") |> 
  distinct() |> 
  rename(p = title,
         n = name) |> 
  mutate(s = "____________") |> 
  select(p, s, n) ->
  people

1:nrow(people) |> 
  map(function(i){
    people |> 
      slice(i) |> 
      bind_rows(tibble(p = NA, s = "подпись, дата", n = "(раздел )"))
  }) |> 
  list_rbind() |> 
  write_csv("data/people.csv", na = "")
  
