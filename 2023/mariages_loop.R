datalist = list()



for (i in list_canton) {
  
  data <- mar_cant(mariages_canton,i)
  
  file_name <- paste("mariages_",i)
  
  write_csv(data,glue::glue("output/{file_name}.csv"))
  
  
}