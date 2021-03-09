data <- mtcars

data %>% rownames_to_column("model") %>% 
  filter(cyl == 4) %>%
  mutate(hp_per_1000 = hp/wt) %>%
  select(model,mpg,hp,wt,hp_per_1000) %>%
  arrange(desc(hp_per_1000))