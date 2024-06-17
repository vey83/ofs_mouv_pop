mariages_raw <- read_excel("resources/mariages.xlsx",
                           skip = 1) %>%
  clean_names() %>%
  slice(1:27) %>%
  rename(x2001 = x2001_1,
         x2010 = x2010_2,
         x2022 = x2022_3)



mariages_longer <- mariages_raw %>%
  mutate(across(everything(), as.character)) %>%
  pivot_longer(cols = -x1,
               names_to = "year",
               values_to = "total") %>%
  mutate(year = as.numeric(str_replace_all(year,"x","")),
         total = as.numeric(total)) %>%
  rename(canton = x1)

#na_total <- mariages_longer %>%
# filter(is.na(total))

mariages_ch <- mariages_longer %>%
  filter(canton == "Suisse",
         year > 2000) %>%
  select(year,total) %>%
  rename(Mariages = total)


###Datawrapper
#id <- "ODgyT"

#folder_id <- "247216"

#DatawRappr::dw_data_to_chart(mariages_ch,chart_id = id)

###Par canton

mariages_canton <- mariages_longer %>%
  filter(canton != "Suisse",
         year > 2000)

list_canton <- mariages_canton %>%
  group_by(canton) %>%
  slice(1) %>%
  pull(canton)




